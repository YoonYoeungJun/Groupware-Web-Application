
#region ● Namespace declaration

// .Net Framework Reperence part
using System;
using System.Collections;

#endregion

namespace eniFramework.WebApp.ACT {
    /// <summary>
    /// WebAccountMenuCollection
    /// </summary>
    [Serializable]
    public class AccountMNUs : CollectionBase {

        #region ★ 0. Codiing Infomation
        /// <NameSpace>①eniFramework.WebApp.Variables</NameSpace>
        /// <Module>②Menu</Module>
        /// <Class>③MenuCollection</Class>
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

        #endregion

        #region ■ 1.2 SubClass variables

        #endregion

        #region ■ 1.3 Class Global variables

        #endregion

        #region ■ 1.4 Class Global properties

        /// <summary>
        /// 메뉴 익덱스로 메뉴를 가져옵니다.
        /// </summary>
        /// <param name="pIndex">메뉴 인덱스</param>
        /// <returns>메뉴 아이디</returns>
        public AccountMNU this[int pIndex] {
            get {
                if (List.Count > pIndex)
                    return List[pIndex] as AccountMNU;
                return null;
            }
        }
        /// <summary>
        /// 메뉴 아이디로 메뉴를 가져옵니다.
        /// </summary>
        /// <param name="pMenuId">메뉴 아이디</param>
        /// <returns>메뉴 아이디</returns>
        public AccountMNU this[string pMenuId] {
            get {
                foreach (var menu in this) {
                    if (((AccountMNU)menu).MenuId.Equals(pMenuId)) {
                        return menu as AccountMNU;
                    }
                }
                return null;
            }
        }

        #endregion

        #endregion

        #region ▶ 2. Initialization part

        #region ■ 2.1 Constructor

        /// <summary>
        /// 생성자
        /// </summary>
        public AccountMNUs() {
        }

        /// <summary>
        /// 생성자
        /// </summary>
        /// <param name="pCapacity">메뉴를 저장할수 있는 목록 수 입니다.</param>
        public AccountMNUs(int pCapacity)
            : base(pCapacity) {
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

        /// <summary>
        /// 모듈 저장 콜렉션에 모듈을 추가한다.
        /// </summary>
        /// <param name="pMenu">메뉴</param>
        public void Add(AccountMNU pMenu) {
            if (!List.Contains(pMenu))
                List.Add(pMenu);
        }

        /// <summary>
        /// 모듈 저장 콜렉션에 모듈을 추가한다.
        /// </summary>
        /// <param name="pMenus">메뉴</param>
        public void AddRange(AccountMNU[] pMenus) {
            foreach (var menu in pMenus) {
                Add(menu);
            }
        }

        //public MenuCollection GetSystemMenu(string pSYSTEM) {

        //}

        /// <summary>
        /// 모듈 저장 콜렉션에 모듈을 삭제한다.
        /// </summary>
        /// <param name="pMenu">메뉴</param>
        public void Remove(AccountMNU pMenu) {
            if (List.Contains(pMenu))
                List.Remove(pMenu);
        }

        #endregion

        #endregion
    }
}
