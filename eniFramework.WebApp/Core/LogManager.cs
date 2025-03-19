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
using SystemThreading = System.Threading;

// DevExpress Framework Reperence part
using DevExpress.Web;
using DevExpress.Utils;

// eniFramework Reperence part
using eniFramework;
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
    [DebuggerDisplay("EventLogCount={EventLogCount} LogCount={LogCount} DebugCount={DebugCount}")]
    public class LogManager {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework</NameSpace>
        /// <Module>②Base</Module>
        /// <Class>③Replace_Class</Class>
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

        static long logCount_ = 0;
        static long debugCount_ = 0;

        static DateTime logCleanDate = DateTime.MinValue;
        static DateTime debugCleanDate = DateTime.MinValue;

        static FileLogManager file_log_ = null;
        static object sync_file_log_ = new object();
        static FileDebugManager file_debug_ = null;
        static object sync_file_debug_ = new object();

        #endregion

        #region ■ 1.3 Class Global variables

        #endregion

        #region ■ 1.4 Class Global properties

        internal static long LogCount {
            get {
                return logCount_;
            }
            private set {
                if (logCount_ == long.MaxValue) {
                    logCount_ = 0;
                    logCleanDate = DateTime.Now;
                }

                logCount_ += 1;
            }
        }

        internal static long DebugCount {
            get {
                return debugCount_;
            }
            private set {
                if (debugCount_ == long.MaxValue) {
                    debugCount_ = 0;
                    debugCleanDate = DateTime.Now;
                }

                debugCount_ += 1;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        static LogManager() {
            
            file_log_ = new FileLogManager();
            file_debug_ = new FileDebugManager();
        }

        #endregion

        #region ■ 2.2 Initializatize SubClass variables

        #endregion

        #region ■ 2.3 Initializatize Local global variables

        #endregion

        #endregion

        #region ▶ 3. SubClass Override Method part

        #endregion

        #region ▶ 4. Event Method part

        #region ■ 4.1 SubClass Event part

        #endregion

        #region ■ 4.2 Class Event part

        #endregion

        #endregion

        #region ▶ 5. User-defined Method part

        #region ■ 5.1 User-defined function group

        #region LogWriteAll
        /// <summary>
        /// 소켓 & 윈도우 & 파일 에 로그를 기록합니다.
        /// </summary>
        /// <param name="strLogMessage">로그 메세지</param>
        internal static void LogWriteAll(string strLogMessage) {
            LogWrite(ServerityType.Information, strLogMessage);
        }
        /// <summary>
        /// 윈도우 & 파일 에 로그를 기록합니다.
        /// </summary>
        /// <param name="eSType">로그 타입</param>
        /// <param name="strLogMessage">로그 메세지</param>
        internal static void LogWriteAll(ServerityType eSType, string strLogMessage) {
            LogWrite(eSType, strLogMessage);
        }

        #endregion

        #region LogWrite
        /// <summary>
        /// 지정된 위치의 로그파일에 로그를 기록합니다.
        /// </summary>
        /// <param name="strMessage">로그 메세지</param>
        internal static void LogWrite(string strLogMessage) {
            LogWrite(ServerityType.Information, strLogMessage);
        }
        /// <summary>
        /// 지정된 위치의 로그파일에 로그를 기록합니다.
        /// </summary>
        /// <param name="eLogLevel">로그 레벨</param>
        /// <param name="eLogType">로그 타입</param>
        /// <param name="strMessage">로그 메세지</param>
        internal static void LogWrite(ServerityType eSType, string strLogMessage) {
            switch (eSType) {
                case ServerityType.Information:
                    strLogMessage = "[Information] " + strLogMessage;
                    break;
                case ServerityType.Warning:
                    strLogMessage = "[Warning] " + strLogMessage;
                    break;
                case ServerityType.Error:
                    strLogMessage = "[Error] " + strLogMessage;
                    break;
                case ServerityType.FatalError:
                    strLogMessage = "[FatalError] " + strLogMessage;
                    break;
                default: break;
            }

            lock (sync_file_log_) {
                file_log_.Write(strLogMessage);
                LogCount += 1;

                SystemThreading.Monitor.Pulse(sync_file_log_);
            }
        }

        #endregion

        #region DebugWrite
        /// <summary>
        /// [개발전용]지정된 위치의 파일에 디버그 메세지를 씁니다.
        /// </summary>
        /// <param name="strMessage">디버그 메세지</param>
        internal static void DebugWrite(string strDebugMessage) {
            lock (sync_file_debug_) {
                file_debug_.Write(strDebugMessage);
                DebugCount += 1;

                SystemThreading.Monitor.Pulse(sync_file_debug_);
            }
        }

        #endregion

        #endregion

        #endregion
    }
}
