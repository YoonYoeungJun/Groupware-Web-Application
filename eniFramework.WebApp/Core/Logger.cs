#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Diagnostics;
using System.Web.Routing;
using System.Web.Security;
using System.Web.Configuration;
using System.Configuration;
using System.Data.Sql;
using System.Reflection;
using System.Data.SqlClient;

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Utils;

// eniFramework Reperence part



using eniFramework.Configuration;
using eniFramework.WebApp.Variables;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.WebApp.Common.Properties;
//using eniFramework.WebApp.Themes;
using eniFramework.Security;
using eniFramework.Log;

using eniFramework.WebApp.Common;

#endregion

namespace eniFramework.WebApp.Core {
    public class Logger {
        public string DebugFileType { get; private set; }
        public bool DebugWrite { get; private set; }
        public string DebugFileNamePrefix { get; private set; }
        public string LogFileType { get; private set; }
        public bool LogWrite { get; private set; }
        public string LogFileNamePrefix { get; private set; }
        public Logger() {
            DebugFileType = ConfigManager.GetApplicationSetting("DebugFileType");
            var tmpIsDebugWrite = ConfigManager.GetApplicationSetting("IsDebugWrite");
            var tmpObjIsDebugWrite = false;
            if (bool.TryParse(tmpIsDebugWrite, out tmpObjIsDebugWrite)) {
                DebugWrite = tmpObjIsDebugWrite;
            }
            DebugFileNamePrefix = ConfigManager.GetApplicationSetting("DebugFileNamePrefix");

            LogFileType = ConfigManager.GetApplicationSetting("LogFileType");
            var tmpIsLogWrite = ConfigManager.GetApplicationSetting("IsLogWrite");
            var tmpObjIsLogWrite = false;
            if (bool.TryParse(tmpIsLogWrite, out tmpObjIsLogWrite)) {
                LogWrite = tmpObjIsLogWrite;
            }
            LogFileNamePrefix = ConfigManager.GetApplicationSetting("LogFileNamePrefix");
        }

        public void ConsoleWrite(string sLogText) {
//#if DEBUG
//            ConsoleWrite(sLogText, null);
//#endif
            if (Global.gSettings.ApplicationStartMode == ApplicationStartMode.Debug) {
                ConsoleWrite(sLogText, null);
            }
        }

        public void ConsoleWrite(string sLogText, System.Exception pEx) {
//#if DEBUG
//            if (string.IsNullOrWhiteSpace(sLogText)) return;

//            if (pEx != null) {
//                if ((pEx is ExceptionManager) == false) {
//                    pEx = new ExceptionManager(pEx);
//                }
//                Debug.WriteLine(string.Format("{0} : {1} - Error Desc : {2}", DateTime.Now.ToString(CommonVariable.CDT_HHMMSS), sLogText, pEx.Message));
//            } else {
//                Debug.WriteLine(string.Format("{0} : {1}", DateTime.Now.ToString(CommonVariable.CDT_HHMMSS), sLogText));
//            }
//#endif
            if (Global.gSettings.ApplicationStartMode == ApplicationStartMode.Debug) {
                if (string.IsNullOrWhiteSpace(sLogText)) return;

                if (pEx != null) {
                    if ((pEx is ExceptionManager) == false) {
                        pEx = new ExceptionManager(pEx);
                    }
                    Debug.WriteLine(string.Format("{0} : {1} - Error Desc : {2}", DateTime.Now.ToString(CommonVariable.CDT_HHMMSS), sLogText, pEx.Message));
                } else {
                    Debug.WriteLine(string.Format("{0} : {1}", DateTime.Now.ToString(CommonVariable.CDT_HHMMSS), sLogText));
                }
            }
        }
    }
}