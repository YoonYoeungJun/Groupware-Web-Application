//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Text;
//using System.Data.SqlClient;
//using System.Globalization;
//using System.Data;

//using eniFramework.Exception;
//using eniFramework.DataAccess;
//using eniFramework.WebApp.Variables;
//using eniFramework.WebApp.Variables.Menu;

//namespace eniFramework.WebApp.Extentions {
//    public static class ACTExtensions {
//        /// <summary>
//        /// 메인 카테고리 별로 메뉴 컬랙션을 가져옵니다.
//        /// </summary>
//        /// <param name="pStrSystemId">메인 시스템 메뉴 아이디</param>
//        /// <param name="pIntLvl">메뉴 레벨</param>
//        /// <returns>메뉴 컬랙션</returns>
//        public static MenuCollection GetSystemMenus(this WebApplicationUser pWebApplicationUser, string pStrSystemId, int pIntLvl) {
//            var lgStrSql = new StringBuilder();
//            var lgDbAccess = new DatabaseAccess();
//            lgStrSql.AppendLine(" SELECT DISTINCT D.MENU_ID, ");
//            lgStrSql.AppendLine(" 		D.PARENT_MENU_ID, ");
//            lgStrSql.AppendLine(" 		D.MENU_NM, ");
//            lgStrSql.AppendLine(" 		D.MENU_DES, ");
//            lgStrSql.AppendLine(" 		D.MENU_GROUP, ");
//            lgStrSql.AppendLine(" 		F.MENU_NM MENU_GROUP_NM, ");
//            lgStrSql.AppendLine(" 		D.MENU_TYPE, ");
//            lgStrSql.AppendLine(" 		D.MENU_LVL, ");
//            lgStrSql.AppendLine(" 		D.MENU_SEQ, ");
//            lgStrSql.AppendLine(" 		E.ROUTE_URL ");
//            lgStrSql.AppendLine(" FROM S_USR_MST (NOLOCK) A ");
//            lgStrSql.AppendLine(" LEFT JOIN S_USR_MST_S_USR_ROLE_ASSO (NOLOCK) B ON(A.USR_ID = B.USR_ID) ");
//            lgStrSql.AppendLine(" INNER JOIN S_USR_ROLE_S_USR_MENU_ASSO (NOLOCK) C ON(B.USR_ROLE_ID = C.USR_ROLE_ID AND C.USE_YN = 'Y') ");
//            lgStrSql.AppendLine(" INNER JOIN S_USR_MENU (NOLOCK) D ON(C.MENU_ID = D.MENU_ID AND D.USE_YN = 'Y') ");
//            lgStrSql.AppendLine(" LEFT JOIN S_ROUTE_HDR (NOLOCK) E ON(D.ROUTE_ID = E.ROUTE_ID) ");
//            lgStrSql.AppendLine(" LEFT JOIN S_USR_MENU (NOLOCK) F ON(D.MENU_GROUP = F.MENU_ID AND F.USE_YN = 'Y') ");
//            lgStrSql.AppendLine(" WHERE A.USE_YN = 'Y' ");
//            lgStrSql.AppendLine(string.Format("AND A.USR_ID = {0}", Data.FilterVariable(pWebApplicationUser.UserId)));
//            lgStrSql.AppendLine("ORDER BY D.MENU_GROUP, D.MENU_SEQ, D.MENU_ID ");

//            var userMenu = default(DataSet);
//            try {
//                userMenu = lgDbAccess.ExecuteDataSet(lgStrSql.ToString());

//                foreach(DataRow row in userMenu.Tables[0].Rows) {
//                    pWebApplicationUser.gUserMenus.Add(new MenuBase(
//                        row["MENU_ID"].ToString(),
//                        row["PARENT_MENU_ID"].ToString(),
//                        row["MENU_NM"].ToString(),
//                        row["MENU_DES"].ToString(),
//                        row["MENU_GROUP"].ToString(),
//                        row["MENU_GROUP_NM"].ToString(),
//                        row["MENU_TYPE"].ToString(),
//                        int.Parse(row["MENU_LVL"].ToString()),
//                        int.Parse(row["MENU_SEQ"].ToString()),
//                        row["ROUTE_URL"].ToString()));
//                }
//            } catch(System.Exception ex) {
//                throw new ExceptionManager(ex);
//            }

//            if(pWebApplicationUser.gUserMenus.Count >= 0) {
//                var customMenus = new MenuCollection();

//                foreach(MenuBase menu in pWebApplicationUser.gUserMenus) {
//                    if(menu.SystemId == pStrSystemId && menu.MenuLvl == pIntLvl) {
//                        customMenus.Add(menu);
//                    }
//                }
//                return customMenus;
//            } else {
//                return pWebApplicationUser.gUserMenus;
//            }
//        }

//        /// <summary>
//        /// 부모 메뉴 아이디로 하위 메뉴 컬랙션을 가져옵니다.
//        /// </summary>
//        /// <param name="pStrMenuId">부모 메뉴 아이디</param>
//        /// <param name="pIntLvl">메뉴 레벨</param>
//        /// <returns>메뉴 컬랙션</returns>
//        public static MenuCollection GetSubMenus(this WebApplicationUser pWebApplicationUser, string pStrMenuId, int pIntLvl) {
//            if(pWebApplicationUser.gUserMenus.Count >= 0) {
//                var customMenus = new MenuCollection();

//                foreach(MenuBase menu in pWebApplicationUser.gUserMenus) {
//                    if(menu.ParentMenuId == pStrMenuId && menu.MenuLvl == pIntLvl) {
//                        customMenus.Add(menu);
//                    }
//                }
//                return customMenus;
//            } else {
//                return pWebApplicationUser.gUserMenus;
//            }
//        }

//        /// <summary>
//        /// 자식 메뉴 아이디로 상위 메뉴를 가져옵니다.
//        /// </summary>
//        /// <param name="pStrMenuId">자식 메뉴 아이디</param>
//        /// <param name="pIntLvl">메뉴 레벨</param>
//        /// <returns>메뉴 컬랙션</returns>
//        public static MenuBase GetParentMenu(this WebApplicationUser pWebApplicationUser, string pStrMenuId) {
//            if(pWebApplicationUser.gUserMenus.Count >= 0) {
//                var subMenu = default(MenuBase);
//                foreach(MenuBase menu in pWebApplicationUser.gUserMenus) {
//                    if(menu.MenuId == pStrMenuId) {
//                        subMenu = menu;
//                        continue;
//                    }
//                }

//                foreach(MenuBase menu in pWebApplicationUser.gUserMenus) {
//                    if(menu.MenuId == subMenu.ParentMenuId) {
//                        return menu;
//                    }
//                }

//                return null;
//            } else {
//                return null;
//            }
//        }

//        ///// <summary>
//        ///// 사용자의 타입별 파일 경로를 가져옵니다.
//        ///// </summary>
//        ///// <param name="pPathKind">패스 종류</param>
//        ///// <param name="pPathFormatter">경로 유형</param>
//        ///// <returns>경로</returns>
//        //public static string GetAttachFilePath(this WebApplicationUser pWebApplicationUser, PathKind pPathKing, PathFormatter pPathFormatter) {
//        //    return Global.gWebServerDirectorys.GetAttachFilePath(pPathKing, pPathFormatter, pWebApplicationUser.UserId);
//        //}
//        ///// <summary>
//        ///// 사용자의 타입별 파일 경로를 가져옵니다.
//        ///// </summary>
//        ///// <param name="pPathKind">패스 종류</param>
//        ///// <param name="pPathType">패스 타입</param>
//        ///// <param name="pPathFormatter">경로 유형</param>
//        ///// <returns>경로</returns>
//        //public static string GetAttachFilePath(this WebApplicationUser pWebApplicationUser, PathKind pPathKing, PathType pPathType, PathFormatter pPathFormatter) {
//        //    return Global.gWebServerDirectorys.GetAttachFilePath(pPathKing, pPathType, pPathFormatter, pWebApplicationUser.UserId, false);
//        //}
//        ///// <summary>
//        ///// 사용자의 타입별 파일 경로를 가져옵니다.
//        ///// </summary>
//        ///// <param name="pPathKind">패스 종류</param>
//        ///// <param name="pPathType">패스 타입</param>
//        ///// <param name="pPathFormatter">경로 유형</param>
//        ///// <param name="pIsRoot">사용자 계정의 Root경로 만 반환할지 여부</param>
//        ///// <returns>경로</returns>
//        //public static string GetAttachFilePath(this WebApplicationUser pWebApplicationUser, PathKind pPathKing, PathType pPathType, PathFormatter pPathFormatter, bool pIsRoot) {
//        //    return Global.gWebServerDirectorys.GetAttachFilePath(pPathKing, pPathType, pPathFormatter, pWebApplicationUser.UserId, pIsRoot);
//        //}
//    }
//}