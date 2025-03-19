
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.IO;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Web;
using System.Xml.Linq;
using System.Web.UI;
using System.Reflection;
using System.Net;
using System.Net.Mail;
using System.Web.Routing;
using System.Web.SessionState;
using System.Diagnostics;
using System.Web.Hosting;
using SystemIO = System.IO;
//using FAXCOMLib;
using System.Collections.Specialized;

using DevExpress.Web;

using hMailServerService.SocketLayer;

// eniFramework Reperence part
using eniFramework.Json;
using eniFramework.DataAccess;
using eniFramework.WebApp.Variables.Menu;
using eniFramework.Date;
using eniFramework.WebApp.Controls;
using eniFramework.Exception;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Common.Annotations;

#endregion

namespace eniFramework.WebApp.Modules {
    public class LinqFileSystemProvider : FileSystemProviderBase {

        const int DbRootItemId = 1;
        DbFileSystemDataContext dataContext;
        Dictionary<int, DbFileSystemItem> folderCache;
        string rootFolderDisplayName;

        public LinqFileSystemProvider(string rootFolder)
            : base(rootFolder) {
            this.dataContext = new DbFileSystemDataContext();
            RefreshFolderCache();
        }

        public DbFileSystemDataContext DataContext { get { return dataContext; } }

        // Used to decrease the number of recursive LINQ to SQL queries made to a database
        public Dictionary<int, DbFileSystemItem> FolderCache { get { return folderCache; } }


        public override string RootFolderDisplayName { get { return  "(주)디아이씨" /*rootFolderDisplayName*/; } }

        public override IEnumerable<FileManagerFile> GetFiles(FileManagerFolder folder) {
            DbFileSystemItem dbFolderItem = FindDbFolderItem(folder);
            return
                from dbItem in DataContext.DbFileSystemItems
                where !dbItem.IsFolder && dbItem.ParentId == dbFolderItem.Id
                select new FileManagerFile(this, folder, dbItem.Name, dbItem.Id.ToString());
        }
        public override IEnumerable<FileManagerFolder> GetFolders(FileManagerFolder parentFolder) {
            DbFileSystemItem dbFolderItem = FindDbFolderItem(parentFolder);
            return
                from dbItem in FolderCache.Values
                where dbItem.IsFolder && dbItem.ParentId == dbFolderItem.Id
                select new FileManagerFolder(this, parentFolder, dbItem.Name, dbItem.Id.ToString());
        }

        public override bool Exists(FileManagerFile file) {
            return FindDbFileItem(file) != null;
        }
        public override bool Exists(FileManagerFolder folder) {
            return FindDbFolderItem(folder) != null;
        }
        public override System.IO.Stream ReadFile(FileManagerFile file) {
            return new MemoryStream(FindDbFileItem(file).Data.ToArray());
        }
        public override DateTime GetLastWriteTime(FileManagerFile file) {
            var dbFileItem = FindDbFileItem(file);
            return dbFileItem.LastWriteTime.GetValueOrDefault(DateTime.Now);
        }

        // File/folder management operations
        public override void CreateFolder(FileManagerFolder parent, string name) {
            
            UpdateAndSubmitChanges(parent,
                dbItem => DataContext.DbFileSystemItems.InsertOnSubmit(new DbFileSystemItem() {
                    IsFolder = true,
                    LastWriteTime = DateTime.Now,
                    Name = name,
                    ParentId = dbItem.Id
                }));
        }
        public override void DeleteFile(FileManagerFile file) {
            UpdateAndSubmitChanges(file, dbItem => DataContext.DbFileSystemItems.DeleteOnSubmit(dbItem));
        }
        public override void DeleteFolder(FileManagerFolder folder) {
            UpdateAndSubmitChanges(folder, dbItem => DataContext.DbFileSystemItems.DeleteOnSubmit(dbItem));
        }
        public override void MoveFile(FileManagerFile file, FileManagerFolder newParentFolder) {
            UpdateAndSubmitChanges(file, dbItem => dbItem.ParentId = FindDbFolderItem(newParentFolder).Id);
        }
        public override void MoveFolder(FileManagerFolder folder, FileManagerFolder newParentFolder) {
            UpdateAndSubmitChanges(folder, dbItem => dbItem.ParentId = FindDbFolderItem(newParentFolder).Id);
        }
        public override void RenameFile(FileManagerFile file, string name) {
            UpdateAndSubmitChanges(file, dbItem => dbItem.Name = name);
        }
        public override void RenameFolder(FileManagerFolder folder, string name) {
            UpdateAndSubmitChanges(folder, dbItem => dbItem.Name = name);
        }
        public override void UploadFile(FileManagerFolder folder, string fileName, Stream content) {
            UpdateAndSubmitChanges(folder,
                dbItem => DataContext.DbFileSystemItems.InsertOnSubmit(new DbFileSystemItem() {
                    Name = fileName,
                    Data = ReadAllBytes(content),
                    ParentId = dbItem.Id,
                    LastWriteTime = DateTime.Now,
                    IsFolder = false
                }));
        }
        public override void CopyFile(FileManagerFile file, FileManagerFolder newParentFolder) {
            var dbFileItem = FindDbFileItem(file);
            CopyCore(dbFileItem, newParentFolder.RelativeName, false);
        }
        public override void CopyFolder(FileManagerFolder folder, FileManagerFolder newParentFolder) {
            List<FileManagerFolder> folders = new List<FileManagerFolder>();
            FillSubFoldersList(folder, folders);
            int folderNameOffset = !string.IsNullOrEmpty(folder.Parent.RelativeName) ? folder.Parent.RelativeName.Length + 1 : 0;

            foreach(FileManagerFolder copyingFolder in folders) {
                DbFileSystemItem dbFolderItem = FindDbFolderItem(copyingFolder);
                string folderPath = newParentFolder.RelativeName;
                if(copyingFolder != folder)
                    folderPath = Path.Combine(folderPath, copyingFolder.Parent.RelativeName.Substring(folderNameOffset));
                CopyCore(dbFolderItem, folderPath, true);
                foreach(FileManagerFile currentFile in copyingFolder.GetFiles()) {
                    DbFileSystemItem dbFileItem = FindDbFileItem(currentFile);
                    CopyCore(dbFileItem, Path.Combine(folderPath, copyingFolder.Name), false);
                }
            }
        }
        void FillSubFoldersList(FileManagerFolder folder, List<FileManagerFolder> list) {
            list.Add(folder);
            foreach(FileManagerFolder subFolder in folder.GetFolders())
                FillSubFoldersList(subFolder, list);
        }
        void CopyCore(DbFileSystemItem item, string path, bool isFolder) {
            FileManagerFolder newParentFolder = new FileManagerFolder(this, path);
            UpdateAndSubmitChanges(newParentFolder,
                dbItem => DataContext.DbFileSystemItems.InsertOnSubmit(new DbFileSystemItem() {
                    Name = item.Name,
                    Data = item.Data,
                    ParentId = dbItem.Id,
                    LastWriteTime = DateTime.Now,
                    IsFolder = isFolder
                }));
        }
        protected void UpdateAndSubmitChanges(FileManagerFile file, Action<DbFileSystemItem> update) {
            UpdateAndSubmitChangesCore(FindDbFileItem(file), update);
        }
        protected void UpdateAndSubmitChanges(FileManagerFolder folder, Action<DbFileSystemItem> update) {
            UpdateAndSubmitChangesCore(FindDbFolderItem(folder), update);
        }
        protected void UpdateAndSubmitChangesCore(DbFileSystemItem dbitem, Action<DbFileSystemItem> update) {
            update(dbitem);
            DataContext.SubmitChanges();
            RefreshFolderCache();
        }
        protected DbFileSystemItem FindDbFileItem(FileManagerFile file) {
            DbFileSystemItem dbFolderItem = FindDbFolderItem(file.Folder);
            if(dbFolderItem == null)
                return null;
            return
                (from dbItem in DataContext.DbFileSystemItems
                 where dbItem.ParentId == dbFolderItem.Id && !dbItem.IsFolder && dbItem.Name == file.Name
                 select dbItem).FirstOrDefault();
        }
        protected DbFileSystemItem FindDbFolderItem(FileManagerFolder folder) {
            return
                (from dbItem in FolderCache.Values
                 where dbItem.IsFolder && GetRelativeName(dbItem) == folder.RelativeName
                 select dbItem).FirstOrDefault();
        }

        // Returns the path to a specified folder relative to a root folder
        protected string GetRelativeName(DbFileSystemItem dbFolder) {
            if(dbFolder.Id == DbRootItemId) return string.Empty;
            if(dbFolder.ParentId == DbRootItemId) return dbFolder.Name;
            if(!FolderCache.ContainsKey(dbFolder.ParentId)) return null;
            string name = GetRelativeName(FolderCache[dbFolder.ParentId]);
            return name == null ? null : Path.Combine(name, dbFolder.Name);
        }

        // Caches folder names in memory and obtains a root folder's name
        protected void RefreshFolderCache() {
            this.folderCache = (
                from dbItem in DataContext.DbFileSystemItems
                where dbItem.IsFolder
                select dbItem
            ).ToDictionary(i => i.Id);

            //this.rootFolderDisplayName = (
            //    from dbItem in FolderCache.Values
            //    where dbItem.Id == DbRootItemId
            //    select dbItem.Name).First();
        }
        protected static byte[] ReadAllBytes(Stream stream) {
            byte[] buffer = new byte[16 * 1024];
            int readCount;
            using(MemoryStream ms = new MemoryStream()) {
                while((readCount = stream.Read(buffer, 0, buffer.Length)) > 0) {
                    ms.Write(buffer, 0, readCount);
                }
                return ms.ToArray();
            }
        }

        // Get file size (length).
        public override long GetLength(FileManagerFile file) {
            return FindDbFileItem(file).Data.Length;
        }
    }
    public class Provider : PhysicalFileSystemProvider {

        public override string RootFolderDisplayName {
            get {
                return "(주)디아이씨";
            }
        }
        private DateTime currentDate;
        private DateTime nextDate;

        public Provider(string r) : this(r, DateTime.Now){
        }
        public Provider(string r, DateTime myDate)
            : base(r) {
                //currentDate = myDate;
                //nextDate = new DateTime(myDate.Year, myDate.Month, myDate.Day + 1);
        }

        public override IEnumerable<FileManagerFile> GetFiles(FileManagerFolder folder) {
            List<FileManagerFile> files = new List<FileManagerFile>(base.GetFiles(folder));
            files.Sort(delegate(FileManagerFile file1, FileManagerFile file2) {
                return GetLastWriteTime(file2).CompareTo(GetLastWriteTime(file1));
            });
            return files;

            //return base.GetFiles(folder).Where(file => (GetCreationTime(file) >= currentDate) && (GetCreationTime(file) <= nextDate));
        }

        protected DateTime GetCreationTime(FileManagerFile file) {
            string path = Path.Combine(this.GetResolvedRootFolderPath(), file.RelativeName);
            return System.IO.File.GetCreationTime(path);
        }

        //public override IEnumerable<FileManagerFile> GetFiles(FileManagerFolder folder) {
        //    return base.GetFiles(folder);
        //    var fileList = base.GetFiles(folder);
        //    fileList = fileList.Select(oldFile => {
        //        return new FileManagerFile(this, oldFile.Folder, oldFile.Name + "custom file name");
        //    });
        //    return fileList;
        //}

        //public override bool Exists(FileManagerFolder folder) {
        //    return base.Exists(folder);
        //}

        //public override string GetRelativeFolderPath(FileManagerFolder folder, IUrlResolutionService rs) {
        //    return base.GetRelativeFolderPath(folder, rs);

        //}
        //public override IEnumerable<FileManagerFolder> GetFolders(FileManagerFolder parentFolder) {
        //    var folderList = base.GetFolders(parentFolder);
        //    parentFolder.
        //    //return folderList.Select(item => new FileManagerFolder(this, item, "a " + item.Name));
        //    var a = new FileManagerFolder(this, parentFolder, "lyscryz", "aaa");
        //    folderList = folderList.Select(oldFile => {
        //        return new FileManagerFolder(this, oldFile.Parent, oldFile.Name + "custom file name");
        //    });
        //    return folderList;
        //}
        //protected string StoragePath { get { return RootFolder; } }

        //public Provider(string rootFolder)
        //    : base(rootFolder) {
        //}

        //public override System.IO.Stream ReadFile(FileManagerFile file) {
        //    string filePath = Path.Combine(StoragePath, GetFolderRealPath(file.Folder.RelativeName), file.Name);
        //    return SystemIO.File.Exists(filePath) ? SystemIO.File.OpenRead(filePath) : Stream.Null;
        //}

        //public override IEnumerable<FileManagerFolder> GetFolders(FileManagerFolder parentFolder) {
        //    string[] folderPath = parentFolder.RelativeName.Split(new char[] { '\\' }, StringSplitOptions.RemoveEmptyEntries);
        //    //int folderLevel = folderPath.Length;
        //    //if(folderLevel == 0)
        //    //    return GetCompanies().Select(name => new FileManagerFolder(this, parentFolder, name));
        //    //string companyId = GetCompanyId(folderPath[0]);
        //    //if(folderLevel == 1)
        //    //    return GetCompanyDirectories(companyId).Select(name => new FileManagerFolder(this, parentFolder, name));
        //    string fullPath = Path.Combine(StoragePath, GetFolderRealPath(parentFolder.RelativeName));
        //    return Directory.GetDirectories(fullPath).Select(n => new FileManagerFolder(this, parentFolder, n.Substring(n.LastIndexOf('\\'))));
        //}
        //public override IEnumerable<FileManagerFile> GetFiles(FileManagerFolder folder) {
        //    string dirPath = Path.Combine(StoragePath, GetFolderRealPath(folder.RelativeName));
        //    return Directory.GetFiles(dirPath).Select(n => new FileManagerFile(this, folder, n.Substring(n.LastIndexOf('\\'))));
        //}

        //public string GetFolderRealPath(string displayRelativePath) {
        //    string[] folderPath = displayRelativePath.Split(new char[] { '\\' }, StringSplitOptions.RemoveEmptyEntries);
        //    string res = string.Empty;
        //    //if(folderPath.Length > 0)
        //    //    res = GetCompanyId(folderPath[0]);
        //    //if(folderPath.Length > 1)
        //    //    res = Path.Combine(res, GetDirectoryId(res, folderPath[1]));
        //    for(int i = 2; i < folderPath.Length; i++)
        //        res = Path.Combine(res, folderPath[i]);


        //    return res;
        //}

        //IEnumerable<string> GetCompanies() {
        //    SqlDataSource ds = new SqlDataSource(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ConnectionString,
        //        String.Format("SELECT DISTINCT [COMPANY] FROM GetDirectoriesByUserId WHERE [UserId] = '{0}'", userID));
        //    foreach(DataRowView row in ds.Select(DataSourceSelectArguments.Empty))
        //        yield return row["COMPANY"].ToString();
        //}
        //string GetCompanyId(string companyName) {
        //    SqlDataSource ds = new SqlDataSource(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ConnectionString,
        //        String.Format("SELECT [city_COID] FROM GetDirectoriesByUserId WHERE [UserId] = '{0}' and [COMPANY] = '{1}'", userID, companyName));
        //    DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        //    return dv[0]["city_COID"].ToString();
        //}
        //IEnumerable<string> GetCompanyDirectories(string companyId) {
        //    SqlDataSource ds = new SqlDataSource(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ConnectionString,
        //        String.Format("SELECT [DirectoryID], [DirectoryName] FROM GetDirectoriesByUserId WHERE [UserId] = '{0}' and [city_COID] = '{1}'", userID, companyId));
        //    foreach(DataRowView row in ds.Select(DataSourceSelectArguments.Empty))
        //        yield return row["DirectoryName"].ToString();
        //}
        //string GetDirectoryId(string companyId, string subFolderDisplayName) { 
        //    SqlDataSource ds = new SqlDataSource(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ConnectionString,
        //        String.Format("SELECT [DirectoryID] FROM GetDirectoriesByUserId WHERE [UserId] = '{0}' and [city_COID] = '{1}' and [DirectoryName] = '{2}'", userID, companyId, subFolderDisplayName));
        //    DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        //    return dv[0]["DirectoryID"].ToString();
        //}

    }

    /// <summary>
    /// 
    /// </summary>
    [DebuggerDisplay("BodyClassName={BodyClassName} PageID={PageID} SessionID={SessionID} SessionHistoryNo={SessionHistoryNo}")]
    [AllowAnonymous, ReiterationPage]
    public partial class WebHardView : BaseUIACTPage {
        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Groupware</NameSpace>
        /// <Module>②</Module>
        /// <Class>③</Class>
        /// <Desc>④
        ///   This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        ///   <FirstCreated>
        ///     <history name="creator" Date="created date">Make …</history>
        ///   </FirstCreated>
        ///   <Lastmodified>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///     <history name="modifier"  Date="modified date"> contents </history>
        ///   </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        ///   <remark name="modifier"  Date="modified date">… </remark>
        ///   <remark name="modifier"  Date="modified date">… </remark>
        /// </Remarks>
        #endregion

        #region ▶ 1. Declaration part

        #region ■ 1.1 Global Constants

        #endregion

        #region ■ 1.2 SubClass variables

        
        
        #endregion

        #region ■ 1.3 Class Global variables

        

        #endregion

        #region ■ 1.4 Class Global properties

        Dictionary<string, string> extensionsDisplayName;

        Dictionary<string, string> ExtensionsDisplayName {
            get {
                if(extensionsDisplayName == null)
                    extensionsDisplayName = XDocument.Load(MapPath("~/App_Data/FileManager/ExtensionsDisplayName.xml")).Descendants("Extension").ToDictionary(n => n.Attribute("Extension").Value, n => n.Attribute("DisplayName").Value);
                return extensionsDisplayName;
            }
        }

        FileListView CurrentView {
            get {
                var view = Session["View"];
                return view == null ? FileListView.Thumbnails : (FileListView)Session["View"];
            }
            set {
                fmWebhard.SettingsFileList.View = value;
                Session["View"] = value;
            }
        }

        public override string BodyClassName { get { return "eniThm_layout_01"; } }
        public override string PageID { get { return "webhardview"; } }
        public override bool RegisteredHiddenField { get { return true; } }
        public override JScriptKind RegisteredScripts {
            get {
                return JScriptKind.Json |
                        JScriptKind.jQuery | JScriptKind.jQuery_Migrate | JScriptKind.jQuery_Cookie | JScriptKind.jQuery_BlockUI | JScriptKind.jQuery_History |
                        JScriptKind.Framework_jQuery_Extends | JScriptKind.Framework_Extends | JScriptKind.Framework_Resources |
                        JScriptKind.Framework_Enum | JScriptKind.Framework_Classs | JScriptKind.Framework | JScriptKind.Framework_ControlBase |
                        JScriptKind.Framework_UserAgent | JScriptKind.Framework_Log | JScriptKind.Framework_Variables | JScriptKind.Framework_Report |
                        JScriptKind.Framework_Message | JScriptKind.Framework_Loading | JScriptKind.Framework_Popup | JScriptKind.Framework_Ajax |
                        JScriptKind.Framework_DbAccess | JScriptKind.Framework_Date | JScriptKind.Framework_Security | JScriptKind.Framework_Utils;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        public WebHardView()
            : base() {
        }

        #endregion

        #region ■ 2.2 WebUIPageLoad & WebUIPageLoadComplete

        protected override void OnWebUIPageLoad() {
            fmWebhard.Settings.RootFolder = lgACT.GetWebHardACTDirectory(PathType.Attach, PathFormatter.FullPhysicalPath, true);
            //fmWebhard.Settings.InitialFolder = lgWebAccount.GetWebHardAccountDirectory(PathType.Attach, PathFormatter.FullPhysicalPath);
            fmWebhard.Settings.ThumbnailFolder = lgACT.GetWebHardACTDirectory(PathType.Thumb, PathFormatter.RelativeUrl);


            var dept_path = string.Format("{0} {1}", lgACT.PlantName, lgACT.DeptName);
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, dept_path);

            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax0830");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax0880");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax6344");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax6345");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax8466");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax8477");
            Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, "클라우드\\Fax9094");

            var scan_path = string.Format("클라우드\\{0} {1} 스캔", lgACT.PlantName, lgACT.DeptName);
            var scan_real_path = Global.gDirectorys.GetSpecialDirectory(PathKind.WebHard, PathFormatter.FullPhysicalPath, PathType.Default, scan_path);

            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("", Rights.Deny));
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule(lgACT.UserId, Rights.Allow) { EditContents = Rights.Allow, Index = 0 });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule(dept_path, Rights.Allow) { EditContents = Rights.Allow, Index = 1 });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny, Index = 2 });
            var parent_path = SystemIO.Directory.GetParent(scan_real_path).Parent;
            var dirs = parent_path.GetDirectories();
            foreach(var dinfo in dirs) {
                fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule(string.Format("{0}\\{1}", parent_path.Name, dinfo.Name), Rights.Deny));
            }
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax0830", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax0880", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax6344", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax6345", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax8466", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax8477", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule("클라우드\\Fax9094", Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            fmWebhard.SettingsPermissions.AccessRules.Add(new FileManagerFolderAccessRule(scan_path, Rights.Allow) { EditContents = Rights.Allow, Upload = Rights.Deny });
            //fillList();


            


            fmWebhard.SettingsFileList.View = CurrentView;
            bool isDetailsView = CurrentView.Equals(FileListView.Details);
            SetFileManagerToolbarItemCheckedState("ChangeView-Thumbnails", !isDetailsView);
            SetFileManagerToolbarItemCheckedState("ChangeView-Details", isDetailsView);
        }

        protected override void OnWebUIPageLoadComplete() {


        }

        #endregion

        #region ■ 2.3 Initializatize Request Parameter

        protected override void OnInitRoutingParams(RouteData pRoute) {
        }

        protected override void OnInitRequestParams(NameValueCollection pQueryString) {


        }
        #endregion

        #region ■ 2.4 Initializatize Dynamic WebControls

        protected override void OnInitDynamicControls() {
            
        }

        #endregion

        #region ■ 2.5 Request Processing

        protected override void OnReqProcessing() {
            DbQuery();

        }

        #endregion

        #region ■ 2.6 PostBack Request Processing
        protected override void OnPostBackOrCallBackReqProcessing() {
            
        }

        #endregion

        #region ■ 2.7 Initializatize variables

        protected override void OnInitVariables() {

        }

        #endregion

        #region ■ 2.8 Set local global default variables


        protected override void SetDefulatValues() {

        }

        #endregion

        #region ■ 2.9 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. DataBase Access Method part

        #region ■ 3.1 DbQuery

        protected void DbQuery() {
            //lgStrSql = new StringBuilder();
            //lgStrSql.AppendLine(" SELECT NO ");
            //lgStrSql.AppendLine("     SUBJECT, ");
            //lgStrSql.AppendLine("     CONTENT, ");
            //lgStrSql.AppendLine("     USER_ID, ");
            //lgStrSql.AppendLine("     DATE, ");
            //lgStrSql.AppendLine("     VISIT, ");
            //lgStrSql.AppendLine("     RECOMMEND, ");
            //lgStrSql.AppendLine("     TAG, ");
            //lgStrSql.AppendLine("     USER_IP ");
            //lgStrSql.AppendLine(" FROM B_BBS (NOLOCK)");

            //Data.MergeDataSet<tdsBoard.B_BBSDataTable>(lgWorkDataSet, lgDbAccess.ExecuteDataSet(lgStrSql.ToString(), "B_BBS"), true);
        }

        #endregion

        

        #endregion

        #region ▶ 5. Event Method part

        #region ■ 5.1 SubClass Event part

        #endregion

        #region ■ 5.2 Class Event part

        #region ■■ 5.2.1 Single control event implementation group

        protected void fmWebhard_SelectedFileOpened(object source, FileManagerFileOpenedEventArgs e) {
           // //FaxServer ofs = null;

           // //int JobID = 0;
           // //csFax objcsFax = new csFax();
           // //JobID = objcsFax.FaxDocument("C:\\Temp\\any file.txt", "911");

           // int JobID = 0;
           // FAXCOMLib.FaxServer faxsrv = new FAXCOMLib.FaxServerClass();
           // try {
           //     faxsrv.Connect("");
           //     //Pick up the new changed document and fax it out.
           //     FaxDoc faxdoc = new FaxDocClass();
           //     faxdoc.Body = e.File.FullName;
           //     //Name the document
           //     faxdoc.DocumentName = "Fax Transmission";
           //     faxdoc.ReceiptAddress = "bob@doe.com";
           //     FAXCOMEXLib.FaxRecipients frs = new
           //     FAXCOMEXLib.FaxRecipientsClass();
           //     frs.Add("052-262-6344", "윤영준");
           //     faxdoc.Recipients = frs;
           //     faxdoc.ConnectedSubmit(faxsrv);
           // } catch {
           // } finally {
           //     faxsrv.Disconnect();
           //     Marshal.ReleaseComObject(frs);
           //     Marshal.ReleaseComObject(faxdoc);
           //     Marshal.ReleaseComObject(faxsrv);
           // }
           ////JobID;



            //FaxServer server = new FaxServer();

            //try
            //{
            //    FaxServer fs = new FaxServer();



            //    server.Connect(Environment.MachineName);                    
            //    for (int i = 0; i < 3; i++)
            //    {
            //        FaxDoc faxDoc = (FaxDoc)server.CreateDocument("c:\fax2.tiff");
                    
            //        faxDoc.RecipientAddress = "lyscryz@dicorp.co.kr";
            //        faxDoc.DisplayName = "윤영준";
            //        //faxDoc.RecipientName = "윤영준";
                    
            //        faxDoc.FileName = e.File.FullName;
            //        faxDoc.FaxNumber = "0522626344";                                                
            //        faxDoc.Send().ToString();    
            //    }    
            //}
            //catch(System.Exception ex)
            //{
            //}
            //finally
            //{
            //    server.Disconnect();
            //}    
        }
        protected void fmWebhard_CloudProviderRequest(object source, FileManagerCloudProviderRequestEventArgs e) {

        }

        protected void fmWebhard_CustomCallback(object sender, CallbackEventArgsBase e) {
            CurrentView = (FileListView)Enum.Parse(typeof(FileListView), e.Parameter.ToString());
        }

        protected void fmWebhard_DataBinding(object sender, EventArgs e) {

        }
        protected void fmWebhard_CustomFileInfoDisplayText(object source, FileManagerCustomFileInfoDisplayTextEventArgs e) {
            if(e.FileInfoType == FileInfoType.Thumbnail) {

                

            }
        }

        protected void fmWebhard_ItemRenaming(object source, FileManagerItemRenameEventArgs e) {
            ValidateSiteEdit(e);
        }

        protected void fmWebhard_ItemCopying(object source, FileManagerItemCopyEventArgs e) {
            ValidateSiteEdit(e);
        }

        protected void fmWebhard_ItemMoving(object source, FileManagerItemMoveEventArgs e) {
            ValidateSiteEdit(e);
        }

        protected void fmWebhard_ItemDeleting(object source, FileManagerItemDeleteEventArgs e) {
            ValidateSiteEdit(e);
        }

        protected void PopupControl_WindowCallback(object source, PopupWindowCallbackArgs e) {
            switch(e.Parameter) {
                case "Files":
                    var file = fmWebhard.SelectedFile;
                    var fileInfo = new FileInfo(file.FullName);

                    PopupControl.JSProperties["cpHeaderText"] = Path.GetFileNameWithoutExtension(fileInfo.FullName);
                    Type.Text = ExtensionsDisplayName[file.Extension];
                    Size.Text = file.Length.ToString("#,#") + " bytes";
                    Created.Text = fileInfo.CreationTime.ToString("U");
                    Modified.Text = fileInfo.LastWriteTime.ToString("U");
                    Accessed.Text = fileInfo.LastAccessTime.ToString("U");
                    FormLayout.FindItemOrGroupByName("Contains").Visible = false;
                    SetFileManagerItemInfo(file);
                    break;
                case "Folders":
                    var folder = fmWebhard.SelectedFolder;
                    var path = MapPath(folder.FullName);
                    var directoryInfo = new DirectoryInfo(path);
                    var filesInfo = directoryInfo.GetFiles("*", SearchOption.AllDirectories);
                    long folderSize = 0;
                    foreach(var info in filesInfo)
                        folderSize += info.Length;
                    var filesCount = filesInfo.Length;
                    var subDirectoriesCount = directoryInfo.GetDirectories("*", SearchOption.AllDirectories).Length;

                    Type.Text = "Folder";
                    Size.Text = folderSize.ToString("#,#") + " bytes";
                    Contains.Text = filesCount + " Files, " + subDirectoriesCount + " Folders";
                    PopupControl.JSProperties["cpHeaderText"] = folder.Name;
                    Created.Text = Directory.GetCreationTime(path).ToString("U");
                    FormLayout.FindItemOrGroupByName("Modified").Visible = false;
                    FormLayout.FindItemOrGroupByName("Accessed").Visible = false;
                    SetFileManagerItemInfo(folder);
                    break;
            }
        }

        #endregion

      

   


        

        #region ■■ 5.2.2 User-defined function group
        void SetFileManagerItemInfo(FileManagerItem item) {
            PopupControl.JSProperties["cpHeaderText"] += " Properties";
            Name.Text = item.Name;
            Location.Text = item.FullName;
            RelativeLocation.Text = item.RelativeName;
        }
        void SetFileManagerToolbarItemCheckedState(string commandName, bool checkedState) {
            var item = fmWebhard.SettingsToolbar.Items.FindByCommandName(commandName);
            (item as FileManagerToolbarCustomButton).Checked = checkedState;
        }

        void ValidateSiteEdit(FileManagerActionEventArgsBase e) {
            //e.Cancel = Utils.IsSiteMode;
            //e.ErrorText = Utils.GetReadOnlyMessageText();
        }


        //protected void fillList() {
        //    //this is dummy information, just to show how information is being used
        //    string ftpUser = "11174";
        //    string ftpPass = "dbsowns1";
        //    string ftpServer = "173.0.9.33";
        //    string dir = "002.ShareUtil";

        //    string ftpUri = string.Format("ftp://{0}/{1}", ftpServer, dir);
        //    ArrayList lsnames = new ArrayList();
        //    ArrayList retArr = recurseUnixFtpTree(lsnames, ftpUri, "/", new NetworkCredential(ftpUser, ftpPass));
        //    fmWebhard.DataSource = retArr;
        //    fmWebhard.DataBind();
        //}


        //protected ArrayList recurseUnixFtpTree(ArrayList arr, string server, string directory, NetworkCredential creds) {
        //    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(new Uri(server + directory));
        //    request.Method = WebRequestMethods.Ftp.ListDirectoryDetails;
        //    request.Credentials = creds;
        //    request.UsePassive = false;
        //    request.KeepAlive = true;

        //    try {
        //        FtpWebResponse response = (FtpWebResponse)request.GetResponse();
        //        Stream responseStream = response.GetResponseStream();
        //        StreamReader reader = new StreamReader(responseStream);
        //        string lstdirectory = reader.ReadLine();

        //        while(lstdirectory != null) {
        //            string[] dirDetails = lstdirectory.Split(new char[] { ' ' }, 9, StringSplitOptions.RemoveEmptyEntries);
        //            string dirFlag = dirDetails[0].Substring(0, 1);
        //            string filename = dirDetails[8];

        //            if(dirFlag.Equals("d"))
        //                recurseUnixFtpTree(arr, server, string.Format("{0}/{1}", directory, filename), creds);

        //            arr.Add(string.Format("{0}/{1}", directory, filename));
        //            lstdirectory = reader.ReadLine();
        //        }
        //        System.Diagnostics.Debug.WriteLine("Status: " + response.StatusCode.ToString());
        //        response.Close();
        //        responseStream.Close();
        //        reader.Close();
        //    } catch(WebException we) {
        //        System.Diagnostics.Debug.WriteLine(string.Format("Response/status: {0}/{1}: {2}", we.Response, we.Status, we.ToString()));
        //    }
        //    return arr;
        //}


        #endregion


        #endregion

        #endregion
    }
}