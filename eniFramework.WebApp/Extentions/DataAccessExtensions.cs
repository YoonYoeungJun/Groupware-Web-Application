
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Globalization;

using eniFramework.DataAccess;
using eniFramework.WebApp.Common;

namespace eniFramework.WebApp.Extentions {
    public static class DataAccessExtensions {
        public static string GetMessage(this DatabaseBatchAccess oDbAccess, string strMsgCode) {
            return GetMessage(oDbAccess, strMsgCode, Utilities.GetLang());
        }
        public static string GetMessage(this DatabaseBatchAccess oDbAccess, string strMsgCode, string strLang) {
            var mustConnection = false;
            var culture = EnumDef.ConvertLangToCultureInfo(strLang);

            if (oDbAccess.Connection.State != System.Data.ConnectionState.Open) {
                try {
                    oDbAccess.Connect();
                } catch (SqlException ex) {
                    throw new DatabaseAccessException(-1, Resources.Global.ResourceManager.GetString("GCSTRESX00300", culture), ex);
                }
                mustConnection = true;
            }

            var strSql = new StringBuilder();
            strSql.AppendLine("SELECT TOP(1) MSG_TEXT");
            strSql.AppendLine("FROM S_MESSAGE (NOLOCK)");
            strSql.AppendLine(string.Format("WHERE MSG_CD = {0}", Data.FilterVariable(strMsgCode)));
            strSql.AppendLine(string.Format("AND LANG = {0}", Data.FilterVariable(strLang)));

            var strMsg = oDbAccess.ExecuteScalar(strSql.ToString());

            if (mustConnection) {
                oDbAccess.DisConnect();
            }

            if (strMsg != null) {
                return strMsg.ToString();
            } else {
                return Resources.Global.ResourceManager.GetString("GCSTRESX00301", culture);
            }
        }
        public static string GetMessage(this DatabaseBatchAccess oDbAccess, int iMsgId) {
            return GetMessage(oDbAccess, iMsgId, Utilities.GetLang());
        }
        public static string GetMessage(this DatabaseBatchAccess oDbAccess, int iMsgId, string strLang) {
            var mustConnection = false;
            var culture = EnumDef.ConvertLangToCultureInfo(strLang);

            if (oDbAccess.Connection.State != System.Data.ConnectionState.Open) {
                try {
                    oDbAccess.Connect();
                } catch (SqlException ex) {
                    throw new DatabaseAccessException(-1, Resources.Global.ResourceManager.GetString("GCSTRESX00300", culture), ex);
                }
                mustConnection = true;
            }

            var strSql = new StringBuilder();
            strSql.AppendLine("SELECT TOP(1) MSG_TEXT");
            strSql.AppendLine("FROM S_MESSAGE (NOLOCK)");
            strSql.AppendLine(string.Format("WHERE MSG_ID = {0}", Data.FilterVariable(iMsgId, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
            strSql.AppendLine(string.Format("AND LANG = {0}", Data.FilterVariable(strLang)));

            var strMsg = oDbAccess.ExecuteScalar(strSql.ToString());

            if (mustConnection) {
                oDbAccess.DisConnect();
            }

            if (strMsg != null) {
                return strMsg.ToString();
            } else {
                return Resources.Global.ResourceManager.GetString("GCSTRESX00301", culture);
            }
        }
        public static string GetMessage(this DatabaseAccess oDbAccess, string strMsgCode) {
            return GetMessage(oDbAccess, strMsgCode, Utilities.GetLang());
        }
        public static string GetMessage(this DatabaseAccess oDbAccess, string strMsgCode, string strLang) {
            var mustConnection = false;
            var culture = EnumDef.ConvertLangToCultureInfo(strLang);

            if (oDbAccess.Connection.State != System.Data.ConnectionState.Open) {
                try {
                    oDbAccess.Connect();
                } catch (SqlException ex) {
                    throw new DatabaseAccessException(-1, Resources.Global.ResourceManager.GetString("GCSTRESX00300", culture), ex);
                }

                mustConnection = true;
            }

            var strSql = new StringBuilder();
            strSql.AppendLine("SELECT TOP(1) MSG_TEXT");
            strSql.AppendLine("FROM S_MESSAGE (NOLOCK)");
            strSql.AppendLine(string.Format("WHERE MSG_CD = {0}", Data.FilterVariable(strMsgCode)));
            strSql.AppendLine(string.Format("AND LANG = {0}", Data.FilterVariable(strLang)));

            var strMsg = oDbAccess.ExecuteScalar(strSql.ToString());

            if (mustConnection) {
                oDbAccess.DisConnect();
            }

            if (strMsg != null) {
                return strMsg.ToString();
            } else {
                return Resources.Global.ResourceManager.GetString("GCSTRESX00301", culture);
            }
        }
        public static string GetMessage(this DatabaseAccess oDbAccess, int iMsgId) {
            return GetMessage(oDbAccess, iMsgId, Utilities.GetLang());
        }

        public static string GetMessage(this DatabaseAccess oDbAccess, int iMsgId, string strLang) {
            var mustConnection = false;
            var culture = EnumDef.ConvertLangToCultureInfo(strLang);

            if (oDbAccess.Connection.State != System.Data.ConnectionState.Open) {
                try {
                    oDbAccess.Connect();
                } catch (SqlException ex) {
                    throw new DatabaseAccessException(-1, Resources.Global.ResourceManager.GetString("GCSTRESX00300", culture), ex);
                }

                mustConnection = true;
            }

            var strSql = new StringBuilder();
            strSql.AppendLine("SELECT TOP(1) MSG_TEXT");
            strSql.AppendLine("FROM S_MESSAGE (NOLOCK)");
            strSql.AppendLine(string.Format("WHERE MSG_ID = '{0}'", Data.FilterVariable(iMsgId, FilterVarType.NoBraceButReplSingleWithDoubleQuotation)));
            strSql.AppendLine(string.Format("AND LANG = {0}", Data.FilterVariable(strLang)));

            var strMsg = oDbAccess.ExecuteScalar(strSql.ToString());

            if (mustConnection) {
                oDbAccess.DisConnect();
            }

            if (strMsg != null) {
                return strMsg.ToString();
            } else {
                return Resources.Global.ResourceManager.GetString("GCSTRESX00301", culture);
            }
        }
    }
}