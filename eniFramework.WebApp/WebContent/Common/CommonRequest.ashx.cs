using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Reflection;
using System.Collections.Specialized;
using System.Web.SessionState;
using System.Web.Security;
using System.Data.SqlClient;
using System.Threading;


using eniFramework.WebApp.Common.Interface;
using eniFramework.WebApp.Common.JsonArgs;
using eniFramework.WebApp.Common.ActiveX;

using eniFramework.Json;
using eniFramework.Exception;
using eniFramework.DataAccess;
using eniFramework.Security;
using eniFramework.WebApp.ACT;
using eniFramework.WebApp.Common;
using eniFramework.WebApp.Core;
using eniFramework.WebApp.Extentions;

using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

namespace eniFramework.WebApp.Common {
    /// <summary>
    /// RequestQuery의 요약 설명입니다.
    /// </summary>
    public class CommonRequest : BaseHTTPHandler {
        protected override void HTTPRequest() {
            IResultArgs retArgs = null;

            try {
                var oRequestArgs = new RequestArgs() {
                    Cmd = lgQueryString["cmd"],
                    Mode = lgQueryString["mode"],
                    Data = lgQueryString["data"],
                    Lang = string.IsNullOrWhiteSpace(lgQueryString["lang"]) ? lgLang : lgQueryString["lang"]
                };

                switch (oRequestArgs.Cmd.ToLower()) {
                    //case "Login": ResponseWrite(new AjaxResult { Data = new AjaxAuthentication(lgContext, ajaxRequest).LoginProcess() }); break;
                    case "login":
                        retArgs = Login();
                        break;
                    //case "Logout": ResponseWrite(new AjaxResult { Data = new AjaxAuthentication(lgContext, ajaxRequest).LogoutProcess() }); break;
                    case "logout":
                        //ResponseWrite(new ResultArgs { Data = Login() });
                        retArgs = Logout();
                        break;
                    case "dbmessage":
                    //case "dbmessage": retArgs.Data = new AjaxMessage(lgContext, oRequestArgs).GetDbMessage(); break;
                        retArgs = DbMessage(oRequestArgs);
                        break;
                    case "dbaccess":
                        retArgs = DbAccess(oRequestArgs);
                        break;
                    default:
                        retArgs = new ResultArgs() {
                            Code = (-1).ToString(),
                            Message = GetGlobalResource("GCSTRESX00102")
                        };
                        break;
                }
            } catch (ExceptionManager ex) {
                retArgs = new ResultArgs() {
                    Code = ex.ErrorCode.ToString(),
                    Message = ex.Message
                };
            } catch (System.Exception ex) {
                retArgs = new ResultArgs() {
                    Code = (-1).ToString(),
                    Message = ex.Message
                };
            }

            ResponseWrite(retArgs);
        }

        #region Login & Logout

        protected ResultArgs Login() {
            try {
                var strUserId = string.Empty;
                var strUserPwd = string.Empty;
                var strSsId = string.Empty;
                var strShNo = string.Empty;

                strUserId = lgQueryString["uid"];
                strUserPwd = lgQueryString["pwd"];
                strSsId = lgQueryString["ssid"];
                strShNo = lgQueryString["sshn"];

                var act = new Account(strUserId);
                act.LoginProcess(lgContext, strUserPwd, strSsId, strShNo);
                
                //Response.Cookies.Add(new HttpCookie("ckUserId", Server.UrlEncode(_webAccount.UserId)));
                //lgContext.Response.Cookies.Add(new HttpCookie("ckUserPwd", lgContext.Server.UrlEncode(_webAccount.UserPwd)));


                //var _webAccount = new WebAccount(lgContext.Request.QueryString["uid"]);
                //_webAccount.LoginProcess(lgContext.Request.QueryString["pwd"], lgContext.Request.QueryString["ssn"]);

                //FormsAuthentication.SetAuthCookie(_webAccount.UserId, false);


                //lgContext.Response.Cookies.Add(new HttpCookie("ckUserId", lgContext.Server.UrlEncode(_webAccount.UserId)));
                //lgContext.Response.Cookies.Add(new HttpCookie("ckUserPwd", lgContext.Server.UrlEncode(_webAccount.UserPwd)));

                return new ResultArgs();
            } catch (ExceptionManager ex) {
                return new ResultArgs() { Code = ex.ErrorCode.ToString(), Message = ex.Message };
            } catch (System.Exception ex) {
                var exm = new ExceptionManager(ex);
                return new ResultArgs() { Code = exm.ErrorCode.ToString(), Message = exm.Message };
            }
        }

        protected ResultArgs Logout() {
            try {
                var accunt = lgContext.Session[CommonResource.SessionAccount] as Account;
                if (accunt != null) {
                    accunt.LogoutProcess(lgContext);
                }
                //Session.Remove(eniFramework.WebApp.Properties.Resources.SessionWebUser);
                //FormsAuthentication.SignOut();
                //ResponseWrite(GetJson(AjaxJson.J0005, null));
                return new ResultArgs();
            } catch (ExceptionManager ex) {
                return new ResultArgs() { Code = ex.ErrorCode.ToString(), Message = ex.Message };
            } catch (System.Exception ex) {
                var exm = new ExceptionManager(ex);
                return new ResultArgs() { Code = exm.ErrorCode.ToString(), Message = exm.Message };
            }
        }

        #endregion

        #region DbAccess

        private IResultArgs DbAccess(RequestArgs oRequestArgs) {
            IResultArgs oResultArgs = null;
            IDbAccessDataArgs dbAccessDataArgs = null;

            switch (oRequestArgs.Mode.ToLower()) {
                case "executecodename":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessCodeNameDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessCodeNameDataArgs {
                            Schema = Global.gEnvironmonts.Schema,
                            CommandText = lgQueryString["commandtext"],
                            TableName = lgQueryString["tablename"],
                            Code1 = lgQueryString["code1"],
                            Code2 = lgQueryString["code2"],
                            Lang = lgLang
                        };
                    }
                    break;
                case "executequery":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessQueryDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessQueryDataArgs {
                            CommandText = oRequestArgs.Data.ToString(),
                            TableNames = lgQueryString["tables"]
                        };
                    }
                    break;
                case "executedataset":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessDataSetDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessDataSetDataArgs {
                            CommandText = oRequestArgs.Data.ToString(),
                            TableNames = lgQueryString["tables"]
                        };
                    }
                    break;
                case "executescalar":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessQueryDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessQueryDataArgs {
                            CommandText = oRequestArgs.Data.ToString()
                        };
                    }
                    break;
                case "executerowcountquery":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessQueryDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessQueryDataArgs {
                            CommandText = oRequestArgs.Data.ToString()
                        };
                    }
                    break;
                case "executenonquery":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessQueryDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessQueryDataArgs {
                            CommandText = oRequestArgs.Data.ToString(),
                            TableNames = lgQueryString["tables"]
                        };
                    }
                    break;
                case "executecombodataquery":
                    if (lgContentType.IndexOf("json") > 0) {
                        dbAccessDataArgs = JsonConvert.DeserializeObject<DbAccessDataSetDataArgs>(oRequestArgs.Data.ToString());
                    } else {
                        dbAccessDataArgs = new DbAccessDataSetDataArgs {
                            CommandText = oRequestArgs.Data.ToString()
                        };
                    }
                    break;
                default: break;
            }

            if (dbAccessDataArgs == null) {
                throw new ExceptionManager(-1, GetGlobalResource("GCSTRESX00102"));
            }

            switch (oRequestArgs.Mode.ToLower()) {
                case "executecodename":
                    var executeCodeNameData = (DbAccessCodeNameDataArgs)dbAccessDataArgs;
                    var executeCodeNameScalar = lgDbAccess.ExecuteScalar(executeCodeNameData.CommandType, executeCodeNameData.CommandText);
                    oResultArgs = new DbAccessScalarResultArgs { Value = executeCodeNameScalar.ToString() };
                    break;
                case "executequery":
                    var executeQueryData = (DbAccessQueryDataArgs)dbAccessDataArgs;
                    var executeQueryTableNames = executeQueryData.TableNames.Split(',', ':', ';', '.', '/', '|', '\\');
                    var executeQueryDSSet = lgDbAccess.ExecuteDataSet(executeQueryData.CommandType, executeQueryData.CommandText, executeQueryTableNames, executeQueryData.GetSqlParameters());

                    if (executeQueryDSSet.Tables.Count > 1) {
                        oResultArgs = new DbAccessDataSetResultArgs { DataSet = executeQueryDSSet };
                    } else {
                        oResultArgs = new DbAccessDataTableResultArgs { DataTable = executeQueryDSSet.Tables[0] };
                    }
                    
                    break;
                case "executedataset":
                    var executeDataSetData = (DbAccessDataSetDataArgs)dbAccessDataArgs;
                    var executeDataSetTableNames = executeDataSetData.TableNames.Split(',', ':', ';', '.', '/', '|', '\\');
                    var executeDSSet = lgDbAccess.ExecuteDataSet(executeDataSetData.CommandType, executeDataSetData.CommandText, executeDataSetTableNames, executeDataSetData.GetSqlParameters());
                    oResultArgs = new DbAccessDataSetResultArgs { DataSet = executeDSSet };
                    break;
                case "executescalar":
                    var executeScalarData = (DbAccessQueryDataArgs)dbAccessDataArgs;
                    var executeScalar = lgDbAccess.ExecuteScalar(executeScalarData.CommandType, executeScalarData.CommandText);
                    if (executeScalar == null) {
                        oResultArgs = new DbAccessScalarResultArgs { Value = string.Empty };
                    } else {
                        oResultArgs = new DbAccessScalarResultArgs { Value = executeScalar.ToString() };
                    }
                    break;
                case "executerowcountquery":
                    var executeRowCountQueryData = (DbAccessQueryDataArgs)dbAccessDataArgs;
                    var executeRowCountQuerySet = lgDbAccess.ExecuteDataSet(executeRowCountQueryData.CommandType, executeRowCountQueryData.CommandText);
                    oResultArgs = new DbAccessScalarResultArgs { Value = executeRowCountQuerySet.Tables[0].Rows.Count.ToString() };
                    break;
                case "executenonquery":
                    var executeNonQueryData = (DbAccessQueryDataArgs)dbAccessDataArgs;
                    var executeNonQueryRetCount = lgDbAccess.ExecuteNonQuery(executeNonQueryData.CommandType, executeNonQueryData.CommandText, executeNonQueryData.GetSqlParameters());
                    oResultArgs = new DbAccessScalarResultArgs { Value = executeNonQueryRetCount.ToString() };
                    break;
                case "executecombodataquery":
                    var executeComboDataQuery = (DbAccessDataSetDataArgs)dbAccessDataArgs;
                    var executeComboDataTableNames = executeComboDataQuery.TableNames.Split(',', ':', ';', '.', '/', '|', '\\');
                    var executeComboDSSet = lgDbAccess.ExecuteDataSet(executeComboDataQuery.CommandType, executeComboDataQuery.CommandText, executeComboDataTableNames, executeComboDataQuery.GetSqlParameters());
                    var executeComboDt = executeComboDSSet.Tables[0];

                    var strComboData1 = new StringBuilder();
                    var strComboData2 = new StringBuilder();
                    foreach (DataRow row in executeComboDt.Rows) {
                        if (executeComboDt.Columns.Count > 1) {
                            strComboData1.Append(string.Format("{0}{1}", row[0], eniSpread.ColSep));
                            strComboData2.Append(string.Format("{0}{1}", row[1], eniSpread.ColSep));
                        } else {
                            strComboData1.Append(string.Format("{0}{1}", row[0], eniSpread.ColSep));
                        }
                    }

                    var comboData1 = strComboData1.ToString();
                    var comboData2 = strComboData2.ToString();
                    if (strComboData1.Length > 0 || strComboData2.Length > 0) {
                        if (executeComboDt.Columns.Count > 1) {
                            strComboData1.Clear();
                            strComboData1.Append(comboData1.Substring(0, comboData1.LastIndexOf(eniSpread.ColSep)));
                            strComboData2.Clear();
                            strComboData2.Append(comboData2.Substring(0, comboData2.LastIndexOf(eniSpread.ColSep)));
                        } else {
                            strComboData1.Clear();
                            strComboData1.Append(comboData1.Substring(0, comboData1.LastIndexOf(eniSpread.ColSep)));
                        }

                        if (executeComboDt.Columns.Count > 1) {
                            oResultArgs = new DbAccessScalarResultArgs { Value = string.Format("{0}{1}{2}", strComboData1, eniSpread.RowSep, strComboData2) };
                        } else {
                            oResultArgs = new DbAccessScalarResultArgs { Value = strComboData1.ToString() };
                        }
                    } else {
                        oResultArgs = new DbAccessScalarResultArgs { Value = string.Empty };
                    }
                    break;
                default: throw new ExceptionManager(-1, GetGlobalResource("GCSTRESX00102"));
            }

            //var strSql = lgQueryString["strSql"];
            //if (!string.IsNullOrWhiteSpace(strSql)) {
            //    var ds_data = lgDbAccess.ExecuteDataSet(strSql);
            //    var dt_data = ds_data.Tables[0];

            //    ResponseWrite(dt_data);
            //} else {
            //    ResponseWrite("");
            //}

            return oResultArgs;
        }

        #endregion

        #region DbMessage

        private IResultArgs DbMessage(RequestArgs oRequestArgs) {
            IResultArgs oResultArgs = new DbMessageResultArgs();

            oResultArgs.Code = oRequestArgs.Data.ToString();
            oResultArgs.Message = lgDbAccess.GetMessage(oRequestArgs.Data.ToString(), oRequestArgs.Lang);

            return oResultArgs;
        }

        #endregion
    }
}