
#region ● Namespace declaration

// .Net Framework Reperence part
using System;

#endregion

namespace eniFramework.WebApp.ACT {
    /// <summary>
    /// WebAccountMenu
    /// </summary>
    [Serializable]
    public class AccountMNU {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Variables</NameSpace>
        /// <Module>②Menu</Module>
        /// <Class>③MenuBase</Class>
        /// <Desc>④
        /// This part describe the summary information about class 
        /// </Desc>
        /// <History>⑤
        /// <FirstCreated>
        /// <history name="creator"Date="created date">Make …</history>
        /// </FirstCreated>
        /// <Lastmodified>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// <history name="modifier"Date="modified date"> contents </history>
        /// </Lastmodified>
        /// </History>
        /// <Remarks>⑥
        /// <remark name="modifier"Date="modified date">… </remark>
        /// <remark name="modifier"Date="modified date">… </remark>
        /// </Remarks>
        #endregion

        #region ▶ 1. Declaration part

        #region ■ 1.1 Global Constants

        //private const string __IS_VIRTUAL_PATH_ARGS_TYPE_ERROR_MESSAGE = "입력한 타입이 사용가능한 문자가 아닙니다.";

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        private readonly string strMenuId_ = string.Empty;
        private readonly string strParentMenuId_ = string.Empty;
        private readonly string strMenuName_ = string.Empty;
        private readonly string strMenuDescription_ = string.Empty;
        private readonly string strMenuType_ = string.Empty;
        private readonly int iMenuLvl_ = 0;
        private readonly string strMenuSeq_ = string.Empty;
        private readonly string strReqRtUrl_ = string.Empty;

        #endregion

        #region ■ 1.4 Class Global properties

        /// <summary>
        /// 메뉴 아이디
        /// </summary>
        public string MenuId { get { return strMenuId_; } }
        /// <summary>
        /// 부모 메뉴 아이디
        /// </summary>
        public string ParentMenuId { get { return strParentMenuId_; } }
        /// <summary>
        /// 메뉴 이름
        /// </summary>
        public string MenuName { get { return strMenuName_; } }
        /// <summary>
        /// 메뉴 설명
        /// </summary>
        public string MenuDescription { get { return strMenuDescription_; } }
        public string MenuGroup { get; private set; }
        public string MenuGroupName { get; private set; }
        /// <summary>
        /// 메뉴 타입
        /// </summary>
        public string MenuType { get { return strMenuType_; } }
        /// <summary>
        /// 메뉴 레벨
        /// </summary>
        public int MenuLvl { get { return iMenuLvl_; } }
        /// <summary>
        /// 메뉴 순번
        /// </summary>
        public string MenuSeq { get { return strMenuSeq_; } }
        /// <summary>
        /// 호출 URL
        /// </summary>
        public string ReqRtUrl { get { return strReqRtUrl_; } }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor


        /// <summary>
        /// 생성자
        /// </summary>
        /// <param name="strMenuId">메뉴 아이디</param>
        /// <param name="strParentMenuId">부모 메뉴 아이디</param>
        /// <param name="strMenuName">메뉴 이름</param>
        /// <param name="strMenuDescription">메뉴 설명</param>
        /// <param name="strMenuGroup">메뉴 그룹</param>
        /// <param name="strMenuGroupName">메뉴 그룹 이름</param>
        /// <param name="strMenuType">메뉴 타입</param>
        /// <param name="iMenuLvl">메뉴 레벨</param>
        /// <param name="strMenuSeq">메뉴 순번</param>
        /// <param name="strReqRtUrl">호출 URL</param>
        public AccountMNU(string strMenuId, string strParentMenuId, string strMenuName, string strMenuDescription,
            string strMenuGroup, string strMenuGroupName, string strMenuType, int iMenuLvl, string strMenuSeq, string strReqRtUrl) {
                strMenuId_          = strMenuId;
                strParentMenuId_    = strParentMenuId;
                strMenuName_        = strMenuName;
                strMenuDescription_ = strMenuDescription;
                MenuGroup           = strMenuGroup;
                MenuGroupName       = strMenuGroupName;
                strMenuType_        = strMenuType;
                iMenuLvl_           = iMenuLvl;
                strMenuSeq_         = strMenuSeq;
                strReqRtUrl_        = strReqRtUrl;
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

        #endregion

        #endregion
    }
}
