/// <reference path="../_references.js" />

(function () {
    if (!window.eni) {
        window.eni = {};
    };
    eni.Message = new function () {
        this.StrBundle = function (strId) {
            var retStr = "";
            
            var dfLang = function () {
                switch (strId) {
                    case "common.alert": retStr = "알림"; break;
                    case "common.delete": retStr = "삭제 알림"; break;
                    case "common.changedata": retStr = "변경사항 알림"; break;
                    case "common.error": retStr = "에러 발생"; break;
                    case "common.nochangedata": retStr = "변경사항 없음"; break;
                    case "common.logout": retStr = "로그아웃"; break;
                    case "common.devtime": retStr = "개발중"; break;
                    case "common.waite": retStr = "잠시만 기다려주세요"; break;

                    case "board.boardwrite.selectcategory": retStr = "게시판을 선택하세요."; break;
                    case "board.boardwrite.insertsubject": retStr = "제목을 입력하세요."; break;
                    case "board.boardwrite.insertcontent": retStr = "내용을 입력하세요."; break;
                    case "board.boardwrite.save": retStr = "게시글을 등록중입니다.<br>잠시만 기다려 주세요."; break;
                    case "board.boardread.delete": retStr = "게시글을 삭제하시겠습니까?"; break;
                    case "board.boardread.save": retStr = "저장중입니다."; break;
                    case "board.boardread.comment.delete": retStr = "정말 댓글을 삭제할까요?"; break;
                    case "board.boardread.comment.empty": retStr = "내용을 입력하세요."; break;
                    case "mail.maillist.selectmessages": retStr = "메일을 선택하세요."; break;
                    case "mail.maillist.selectionmessage": retStr = "최소 한개의 행을 선택하셔야합니다."; break;
                    case "mail.maillist.selectownmessage": retStr = "너무 많은 행이 선택되었습니다."; break;
                    case "mail.maillist.confirmdeletemessages": retStr = "선택된 메일을 삭제하면 복구 할 수 없습니다.<br>삭제하시겠습니까?"; break;
                    case "mail.maillist.deletemessages": retStr = "선택된 메일을 삭제중입니다.<br>잠시만 기다려주세요."; break;
                    case "mail.maillist.movemessages": retStr = "선택된 메일을 이동중입니다."; break;
                    case "common.popup.noselectitem": retStr = "선택된 항목이 없습니다."; break;
                    case "common.callback.requesting": retStr = "서버와 통신중입니다."; break;
                    case "common.gridview.callback.applycolumnfilter": retStr = "데이터 필터링중입니다."; break;
                    case "common.gridview.callback.applyheadercolumnfilter": retStr = "해더컬럼 선택 필터링 중입니다."; break;
                    case "common.gridview.callback.collapseall": retStr = "행을 접는 중입니다."; break;
                    case "common.gridview.callback.expandall": retStr = "행을 펼치는 중입니다."; break;
                    case "common.gridview.callback.contextmenu": retStr = "그리드의 설정을 변경중입니다."; break;
                    case "common.gridview.callback.columnmove": retStr = "컬럼 이동중입니다."; break;
                    case "common.gridview.callback.customcallback": retStr = "데이터를 불러오는 중입니다."; break;
                    case "common.gridview.callback.function": retStr = "정렬 리스트 불러오는 중입니다."; break;
                    case "common.gridview.callback.group": retStr = "그룹핑 중입니다."; break;
                    case "common.gridview.callback.sort": retStr = "데이터 정렬중입니다."; break;
                    case "common.gridview.callback.pageronclick": retStr = "페이지 크기를 조절하는 중입니다."; break;
                    case "common.gridview.callback.updateedit": retStr = "변경된 데이터를 저장중입니다."; break;
                    case "common.changepage": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.changedata": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.changedata.keydown.f5": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>새로 고치시겠습니까?"; break;
                    case "common.changedata.runpageframe": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "common.loading": retStr = "서버와 통신중입니다."; break;
                    case "common.status": retStr = "정상적으로 통신하였습니다."; break;
                    case "common.pop.loading": retStr = "불러오는 중입니다.<br>잠시만 기다려주십시요."; break;
                    case "common.logout": retStr = "로그아웃전 변경된 데이터가 있습니다.<br>저장하지 않고 로그아웃 하시겠습니까?"; break;
                    case "common.refresh": retStr = "페이지를 새로 고치는 중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.processing": retStr = "처리중입니다 잠시만 기다려주세요."; break;
                    case "common.runpageframe": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.nochangedata": retStr = "변경된 데이터가 없습니다."; break;
                    case "common.nosearchdata": retStr = "검색된 데이터가 없습니다."; break;
                    case "toolbar.changedata.new": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "toolbar.changedata.refresh": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.error": retStr = "알수 없는 에러 입니다.<br>관리자에게 문의하십시오."; break;
                    case "common.devtime": retStr = "죄송합니다. 아직은 지원하지 않습니다."; break;
                    case "script.ajax.error": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "script.ajax.parsererror": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "script.ajax.timeout": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;

                    case "MSGBD00001": retStr = "알림"; break;
                    case "MSGBD00002": retStr = "삭제알림"; break;
                    case "MSGBD00003": retStr = "오류"; break;
                    case "MSGBD00004": retStr = "로그아웃"; break;
                    case "MSGBD00005": retStr = "개발중"; break;
                    case "MSGBD00006": retStr = "신규"; break;
                    case "MSGBD00007": retStr = "수정"; break;
                    case "MSGBD00008": retStr = "삭제"; break;


                    case "MSGBD00100": retStr = "잠시만 기다려주세요"; break;
                    case "MSGBD00101": retStr = "페이지를 불러오는 중입니다."; break;
                    case "MSGBD00102": retStr = "아직 저장되지 않은 데이터가 있습니다.<br> 계속하시겠습니까?"; break;
                    case "MSGBD00103": retStr = "조회된 데이터가 없습니다."; break;
                    case "MSGBD00104": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "MSGBD00105": retStr = "서버와 통신중입니다."; break;
                    case "MSGBD00106": retStr = "개발 준비중입니다."; break;
                    case "MSGBD00107": retStr = "현재 페이지를 새로 불러옵니다."; break;
                    case "MSGBD00108": retStr = "자료를 조회중입니다."; break;
                    case "MSGBD00109": retStr = "언어 변경중입니다. 잠시만 기다려 주세요."; break;
                    case "MSGBD00110": retStr = "변경된 데이터가 없습니다."; break;
                    case "MSGBD00111": retStr = "검색된 데이터가 없습니다."; break;
                    case "MSGBD00112": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00113": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00114": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "MSGBD00115": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "MSGBD00116": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;
                    case "MSGBD00117": retStr = "조건이 변경되어서 다시 조회하여야합니다."; break;
                    case "MSGBD00118": retStr = "필수 입력사항이 비어있습니다."; break;
                    case "MSGBD00119": retStr = "저장부터 먼저 하세요."; break;
                    case "MSGBD00120": retStr = "는 필수 입력 사항입니다."; break;
                    case "MSGBD00121": retStr = "오늘보다 이전일일순 없습니다."; break;
                    case "MSGBD00122": retStr = "이번달보다 이전달일순 없습니다."; break;
                    case "MSGBD00123": retStr = "0 보다 큰 수를 입력하세요."; break;
                    case "MSGBD00124": retStr = "초기화 중입니다."; break;
                    case "MSGBD00125": retStr = "모든 데이터가 삭제됩니다 계속 하시겠습니까?"; break;
                    case "MSGBD00126": retStr = "조회부터 먼저하세요."; break;
                    case "MSGBD00127": retStr = "선택된 데이터가 없습니다."; break;
                    case "MSGBD00128": retStr = "부터 먼저 입력하세요."; break;
                    default: retStr = ""; break;
                }
            };
            var enLang = function () {
                switch (strId) {
                    case "common.alert": retStr = "알림"; break;
                    case "common.delete": retStr = "삭제 알림"; break;
                    case "common.changedata": retStr = "변경사항 알림"; break;
                    case "common.error": retStr = "에러 발생"; break;
                    case "common.nochangedata": retStr = "변경사항 없음"; break;
                    case "common.logout": retStr = "로그아웃"; break;
                    case "common.devtime": retStr = "개발중"; break;
                    case "common.waite": retStr = "잠시만 기다려주세요"; break;

                    case "board.boardwrite.selectcategory": retStr = "게시판을 선택하세요."; break;
                    case "board.boardwrite.insertsubject": retStr = "제목을 입력하세요."; break;
                    case "board.boardwrite.insertcontent": retStr = "내용을 입력하세요."; break;
                    case "board.boardwrite.save": retStr = "게시글을 등록중입니다.<br>잠시만 기다려 주세요."; break;
                    case "board.boardread.delete": retStr = "게시글을 삭제하시겠습니까?"; break;
                    case "board.boardread.save": retStr = "저장중입니다."; break;
                    case "board.boardread.comment.delete": retStr = "정말 댓글을 삭제할까요?"; break;
                    case "board.boardread.comment.empty": retStr = "내용을 입력하세요."; break;
                    case "mail.maillist.selectmessages": retStr = "메일을 선택하세요."; break;
                    case "mail.maillist.selectionmessage": retStr = "최소 한개의 행을 선택하셔야합니다."; break;
                    case "mail.maillist.selectownmessage": retStr = "너무 많은 행이 선택되었습니다."; break;
                    case "mail.maillist.confirmdeletemessages": retStr = "선택된 메일을 삭제하면 복구 할 수 없습니다.<br>삭제하시겠습니까?"; break;
                    case "mail.maillist.deletemessages": retStr = "선택된 메일을 삭제중입니다.<br>잠시만 기다려주세요."; break;
                    case "mail.maillist.movemessages": retStr = "선택된 메일을 이동중입니다."; break;
                    case "common.popup.noselectitem": retStr = "선택된 항목이 없습니다."; break;
                    case "common.callback.requesting": retStr = "서버와 통신중입니다."; break;
                    case "common.gridview.callback.applycolumnfilter": retStr = "데이터 필터링중입니다."; break;
                    case "common.gridview.callback.applyheadercolumnfilter": retStr = "해더컬럼 선택 필터링 중입니다."; break;
                    case "common.gridview.callback.collapseall": retStr = "행을 접는 중입니다."; break;
                    case "common.gridview.callback.expandall": retStr = "행을 펼치는 중입니다."; break;
                    case "common.gridview.callback.contextmenu": retStr = "그리드의 설정을 변경중입니다."; break;
                    case "common.gridview.callback.columnmove": retStr = "컬럼 이동중입니다."; break;
                    case "common.gridview.callback.customcallback": retStr = "데이터를 불러오는 중입니다."; break;
                    case "common.gridview.callback.function": retStr = "정렬 리스트 불러오는 중입니다."; break;
                    case "common.gridview.callback.group": retStr = "그룹핑 중입니다."; break;
                    case "common.gridview.callback.sort": retStr = "데이터 정렬중입니다."; break;
                    case "common.gridview.callback.pageronclick": retStr = "페이지 크기를 조절하는 중입니다."; break;
                    case "common.gridview.callback.updateedit": retStr = "변경된 데이터를 저장중입니다."; break;
                    case "common.changepage": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.changedata": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.changedata.keydown.f5": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>새로 고치시겠습니까?"; break;
                    case "common.changedata.runpageframe": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "common.loading": retStr = "서버와 통신중입니다."; break;
                    case "common.status": retStr = "정상적으로 통신하였습니다."; break;
                    case "common.pop.loading": retStr = "불러오는 중입니다.<br>잠시만 기다려주십시요."; break;
                    case "common.logout": retStr = "로그아웃전 변경된 데이터가 있습니다.<br>저장하지 않고 로그아웃 하시겠습니까?"; break;
                    case "common.refresh": retStr = "페이지를 새로 고치는 중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.processing": retStr = "처리중입니다 잠시만 기다려주세요."; break;
                    case "common.runpageframe": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.nochangedata": retStr = "변경된 데이터가 없습니다."; break;
                    case "common.nosearchdata": retStr = "검색된 데이터가 없습니다."; break;
                    case "toolbar.changedata.new": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "toolbar.changedata.refresh": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.error": retStr = "알수 없는 에러 입니다.<br>관리자에게 문의하십시오."; break;
                    case "common.devtime": retStr = "죄송합니다. 아직은 지원하지 않습니다."; break;
                    case "script.ajax.error": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "script.ajax.parsererror": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "script.ajax.timeout": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;

                    case "MSGBD00001": retStr = "알림"; break;
                    case "MSGBD00002": retStr = "삭제알림"; break;
                    case "MSGBD00003": retStr = "오류"; break;
                    case "MSGBD00004": retStr = "로그아웃"; break;
                    case "MSGBD00005": retStr = "개발중"; break;
                    case "MSGBD00006": retStr = "신규"; break;
                    case "MSGBD00007": retStr = "수정"; break;
                    case "MSGBD00008": retStr = "삭제"; break;


                    case "MSGBD00100": retStr = "잠시만 기다려주세요"; break;
                    case "MSGBD00101": retStr = "페이지를 불러오는 중입니다."; break;
                    case "MSGBD00102": retStr = "아직 저장되지 않은 데이터가 있습니다.<br> 계속하시겠습니까?"; break;
                    case "MSGBD00103": retStr = "조회된 데이터가 없습니다."; break;
                    case "MSGBD00104": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "MSGBD00105": retStr = "서버와 통신중입니다."; break;
                    case "MSGBD00106": retStr = "개발 준비중입니다."; break;
                    case "MSGBD00107": retStr = "현재 페이지를 새로 불러옵니다."; break;
                    case "MSGBD00108": retStr = "Looks up the fresh man of the material."; break;
                    case "MSGBD00109": retStr = "언어 변경중입니다. 잠시만 기다려 주세요."; break;
                    case "MSGBD00110": retStr = "변경된 데이터가 없습니다."; break;
                    case "MSGBD00111": retStr = "검색된 데이터가 없습니다."; break;
                    case "MSGBD00112": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00113": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00114": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "MSGBD00115": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "MSGBD00116": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;
                    case "MSGBD00117": retStr = "조건이 변경되어서 다시 조회하여야합니다."; break;
                    case "MSGBD00118": retStr = "필수 입력사항이 비어있습니다."; break;
                    case "MSGBD00119": retStr = "저장부터 먼저 하세요."; break;
                    case "MSGBD00120": retStr = "는 필수 입력 사항입니다."; break;
                    case "MSGBD00121": retStr = "오늘보다 이전일일순 없습니다."; break;
                    case "MSGBD00122": retStr = "이번달보다 이전달일순 없습니다."; break;
                    case "MSGBD00123": retStr = "0 보다 큰 수를 입력하세요."; break;
                    case "MSGBD00124": retStr = "초기화 중입니다."; break;
                    case "MSGBD00125": retStr = "모든 데이터가 삭제됩니다 계속 하시겠습니까?"; break;
                    case "MSGBD00126": retStr = "조회부터 먼저하세요."; break;
                    case "MSGBD00127": retStr = "선택된 데이터가 없습니다."; break;
                    case "MSGBD00128": retStr = "부터 먼저 입력하세요."; break;
                    default: retStr = ""; break;
                }
            };

            var cnLang = function () {
                switch (strId) {
                    case "common.alert": retStr = "通知"; break;
                    case "common.delete": retStr = "删除通知"; break;
                    case "common.changedata": retStr = "变更事项通知"; break;
                    case "common.error": retStr = "发生错误"; break;
                    case "common.nochangedata": retStr = "无变更事项"; break;
                    case "common.logout": retStr = "注销"; break;
                    case "common.devtime": retStr = "开发中"; break;
                    case "common.waite": retStr = "请稍等"; break;

                    case "board.boardwrite.selectcategory": retStr = "请选择公告栏."; break;
                    case "board.boardwrite.insertsubject": retStr = "请输入题目."; break;
                    case "board.boardwrite.insertcontent": retStr = "请输入内容."; break;
                    case "board.boardwrite.save": retStr = "公告登记中.<br>请稍候."; break;
                    case "board.boardread.delete": retStr = "公告删除吗?"; break;
                    case "board.boardread.save": retStr = "保存中."; break;
                    case "board.boardread.comment.delete": retStr = "确认删除回帖吗?"; break;
                    case "board.boardread.comment.empty": retStr = "请输入内容."; break;
                    case "mail.maillist.selectmessages": retStr = "请选择邮件."; break;
                    case "mail.maillist.selectionmessage": retStr = "最小选择一行."; break;
                    case "mail.maillist.selectownmessage": retStr = "选择多个行."; break;
                    case "mail.maillist.confirmdeletemessages": retStr = "选择的邮件删除后无法恢复.<br>确认删除吗?"; break;
                    case "mail.maillist.deletemessages": retStr = "选择的邮件删除中.<br>请稍候."; break;
                    case "mail.maillist.movemessages": retStr = "选择的邮件移动中."; break;
                    case "common.popup.noselectitem": retStr = "无选择的项目."; break;
                    case "common.callback.requesting": retStr = "服务器连接中."; break;
                    case "common.gridview.callback.applycolumnfilter": retStr = "데이터 필터링중입니다."; break;
                    case "common.gridview.callback.applyheadercolumnfilter": retStr = "해더컬럼 선택 필터링 중입니다."; break;
                    case "common.gridview.callback.collapseall": retStr = "행을 접는 중입니다."; break;
                    case "common.gridview.callback.expandall": retStr = "행을 펼치는 중입니다."; break;
                    case "common.gridview.callback.contextmenu": retStr = "그리드의 설정을 변경중입니다."; break;
                    case "common.gridview.callback.columnmove": retStr = "列移动中."; break;
                    case "common.gridview.callback.customcallback": retStr = "数据读取中."; break;
                    case "common.gridview.callback.function": retStr = "整列LIST读取中."; break;
                    case "common.gridview.callback.group": retStr = "Grouping中."; break;
                    case "common.gridview.callback.sort": retStr = "数据整列中."; break;
                    case "common.gridview.callback.pageronclick": retStr = "页面大小调整中."; break;
                    case "common.gridview.callback.updateedit": retStr = "变更的数据保存中."; break;
                    case "common.changepage": retStr = "页面转换中.<br>请稍候."; break;
                    case "common.changedata": retStr = "有变更的数据.<br>继续操作的情况,会丢失变更的数据.<br>继续吗?"; break;
                    case "common.changedata.keydown.f5": retStr = "有变更的数据.<br>继续操作的情况,会丢失变更的数据.<br>刷新吗?"; break;
                    case "common.changedata.runpageframe": retStr = "有变更的数据.<br>转换页面吗?"; break;
                    case "common.loading": retStr = "服务器通讯中."; break;
                    case "common.status": retStr = "正常通讯."; break;
                    case "common.pop.loading": retStr = "读取中.<br>请稍候."; break;
                    case "common.logout": retStr = "有注销前变更的数据.<br>无需保存,注销吗?"; break;
                    case "common.refresh": retStr = "页面刷新中.<br>请稍候."; break;
                    case "common.processing": retStr = "处理中 请稍候."; break;
                    case "common.runpageframe": retStr = "页面转换中.<br>请稍候."; break;
                    case "common.nochangedata": retStr = "无变更的数据."; break;
                    case "common.nosearchdata": retStr = "无搜索的数据."; break;
                    case "toolbar.changedata.new": retStr = "有变更的数据.<br>所以数据初始化.<br>继续吗?"; break;
                    case "toolbar.changedata.refresh": retStr = "有变更的数据.<br>所以数据初始化.<br>继续吗?"; break;
                    case "common.error": retStr = "发生错误.<br>请咨询管理者."; break;
                    case "common.devtime": retStr = "对不起.暂时不支援."; break;
                    case "script.ajax.error": retStr = "Ajax 邀请错误."; break;
                    case "script.ajax.parsererror": retStr = "Ajax 对邀请的数据没有变换."; break;
                    case "script.ajax.timeout": retStr = "Ajax 邀请等待时间超过."; break;


                    case "MSGBD00001": retStr = "通知"; break;
                    case "MSGBD00002": retStr = "通知删除"; break;
                    case "MSGBD00003": retStr = "错误"; break;
                    case "MSGBD00004": retStr = "注销"; break;
                    case "MSGBD00005": retStr = "开发中"; break;
                    case "MSGBD00006": retStr = "新"; break;
                    case "MSGBD00007": retStr = "修订"; break;
                    case "MSGBD00008": retStr = "删除"; break;


                    case "MSGBD00100": retStr = "请稍等。"; break;
                    case "MSGBD00101": retStr = "页面载入了。"; break;
                    case "MSGBD00102": retStr = "还未保存的数据<br>。 要继续吗？"; break;
                    case "MSGBD00103": retStr = "查询的数据。"; break;
                    case "MSGBD00104": retStr = "有变更的数据.<br>要转换页面吗?"; break;
                    case "MSGBD00105": retStr = "服务器和通信中。"; break;
                    case "MSGBD00106": retStr = "正在准备开发。"; break;
                    case "MSGBD00107": retStr = "目前,新一页。"; break;
                    case "MSGBD00108": retStr = "相关资料中。"; break;
                    case "MSGBD00109": retStr = "语言变更中. 请稍候."; break;
                    case "MSGBD00110": retStr = "变更后的数据。"; break;
                    case "MSGBD00111": retStr = "搜索到的数据。"; break;
                    case "MSGBD00112": retStr = "有变更的数据.<br>所有数据会初始化.<br>要继续吗?"; break;
                    case "MSGBD00113": retStr = "有变更的数据.<br>所有数据会初始化.<br>要继续吗?"; break;
                    case "MSGBD00114": retStr = "Ajax 邀请错误."; break;
                    case "MSGBD00115": retStr = "Ajax 对邀请的数据没有发行."; break;
                    case "MSGBD00116": retStr = "Ajax 超过邀请等待时间."; break;
                    case "MSGBD00117": retStr = "条件更改,必须再次查询。"; break;
                    case "MSGBD00118": retStr = "必填项目为空。"; break;
                    case "MSGBD00119": retStr = "请先储存。"; break;
                    case "MSGBD00120": retStr = "是必须录入事项."; break;
                    case "MSGBD00121": retStr = "今天比以往的没有想过。"; break;
                    case "MSGBD00122": retStr = "这个月比以前不能。"; break;
                    case "MSGBD00123": retStr = "以更大的输入数量。"; break;
                    case "MSGBD00124": retStr = "初始化中."; break;
                    case "MSGBD00125": retStr = "所有数据删除. 要继续吗?"; break;
                    case "MSGBD00126": retStr = "先查询."; break;
                    case "MSGBD00127": retStr = "没有选择的数据."; break;
                    case "MSGBD00128": retStr = "先输入."; break;
                    default: retStr = ""; break;
                }
            };

            var jpLang = function () {
                switch (strId) {
                    case "common.alert": retStr = "알림"; break;
                    case "common.delete": retStr = "삭제 알림"; break;
                    case "common.changedata": retStr = "변경사항 알림"; break;
                    case "common.error": retStr = "에러 발생"; break;
                    case "common.nochangedata": retStr = "변경사항 없음"; break;
                    case "common.logout": retStr = "로그아웃"; break;
                    case "common.devtime": retStr = "개발중"; break;
                    case "common.waite": retStr = "잠시만 기다려주세요"; break;

                    case "board.boardwrite.selectcategory": retStr = "게시판을 선택하세요."; break;
                    case "board.boardwrite.insertsubject": retStr = "제목을 입력하세요."; break;
                    case "board.boardwrite.insertcontent": retStr = "내용을 입력하세요."; break;
                    case "board.boardwrite.save": retStr = "게시글을 등록중입니다.<br>잠시만 기다려 주세요."; break;
                    case "board.boardread.delete": retStr = "게시글을 삭제하시겠습니까?"; break;
                    case "board.boardread.save": retStr = "저장중입니다."; break;
                    case "board.boardread.comment.delete": retStr = "정말 댓글을 삭제할까요?"; break;
                    case "board.boardread.comment.empty": retStr = "내용을 입력하세요."; break;
                    case "mail.maillist.selectmessages": retStr = "메일을 선택하세요."; break;
                    case "mail.maillist.selectionmessage": retStr = "최소 한개의 행을 선택하셔야합니다."; break;
                    case "mail.maillist.selectownmessage": retStr = "너무 많은 행이 선택되었습니다."; break;
                    case "mail.maillist.confirmdeletemessages": retStr = "선택된 메일을 삭제하면 복구 할 수 없습니다.<br>삭제하시겠습니까?"; break;
                    case "mail.maillist.deletemessages": retStr = "선택된 메일을 삭제중입니다.<br>잠시만 기다려주세요."; break;
                    case "mail.maillist.movemessages": retStr = "선택된 메일을 이동중입니다."; break;
                    case "common.popup.noselectitem": retStr = "선택된 항목이 없습니다."; break;
                    case "common.callback.requesting": retStr = "서버와 통신중입니다."; break;
                    case "common.gridview.callback.applycolumnfilter": retStr = "데이터 필터링중입니다."; break;
                    case "common.gridview.callback.applyheadercolumnfilter": retStr = "해더컬럼 선택 필터링 중입니다."; break;
                    case "common.gridview.callback.collapseall": retStr = "행을 접는 중입니다."; break;
                    case "common.gridview.callback.expandall": retStr = "행을 펼치는 중입니다."; break;
                    case "common.gridview.callback.contextmenu": retStr = "그리드의 설정을 변경중입니다."; break;
                    case "common.gridview.callback.columnmove": retStr = "컬럼 이동중입니다."; break;
                    case "common.gridview.callback.customcallback": retStr = "데이터를 불러오는 중입니다."; break;
                    case "common.gridview.callback.function": retStr = "정렬 리스트 불러오는 중입니다."; break;
                    case "common.gridview.callback.group": retStr = "그룹핑 중입니다."; break;
                    case "common.gridview.callback.sort": retStr = "데이터 정렬중입니다."; break;
                    case "common.gridview.callback.pageronclick": retStr = "페이지 크기를 조절하는 중입니다."; break;
                    case "common.gridview.callback.updateedit": retStr = "변경된 데이터를 저장중입니다."; break;
                    case "common.changepage": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.changedata": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.changedata.keydown.f5": retStr = "변경된 데이터가 있습니다.<br>작업을 계속할 경우 변경된 데이터를 잃게 됩니다.<br>새로 고치시겠습니까?"; break;
                    case "common.changedata.runpageframe": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "common.loading": retStr = "서버와 통신중입니다."; break;
                    case "common.status": retStr = "정상적으로 통신하였습니다."; break;
                    case "common.pop.loading": retStr = "불러오는 중입니다.<br>잠시만 기다려주십시요."; break;
                    case "common.logout": retStr = "로그아웃전 변경된 데이터가 있습니다.<br>저장하지 않고 로그아웃 하시겠습니까?"; break;
                    case "common.refresh": retStr = "페이지를 새로 고치는 중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.processing": retStr = "처리중입니다 잠시만 기다려주세요."; break;
                    case "common.runpageframe": retStr = "페이지 전환중입니다.<br>잠시만 기다려주세요."; break;
                    case "common.nochangedata": retStr = "변경된 데이터가 없습니다."; break;
                    case "common.nosearchdata": retStr = "검색된 데이터가 없습니다."; break;
                    case "toolbar.changedata.new": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "toolbar.changedata.refresh": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "common.error": retStr = "알수 없는 에러 입니다.<br>관리자에게 문의하십시오."; break;
                    case "common.devtime": retStr = "죄송합니다. 아직은 지원하지 않습니다."; break;
                    case "script.ajax.error": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "script.ajax.parsererror": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "script.ajax.timeout": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;

                    case "MSGBD00001": retStr = "알림"; break;
                    case "MSGBD00002": retStr = "삭제알림"; break;
                    case "MSGBD00003": retStr = "오류"; break;
                    case "MSGBD00004": retStr = "로그아웃"; break;
                    case "MSGBD00005": retStr = "개발중"; break;
                    case "MSGBD00006": retStr = "신규"; break;
                    case "MSGBD00007": retStr = "수정"; break;
                    case "MSGBD00008": retStr = "삭제"; break;


                    case "MSGBD00100": retStr = "잠시만 기다려주세요"; break;
                    case "MSGBD00101": retStr = "페이지를 불러오는 중입니다."; break;
                    case "MSGBD00102": retStr = "아직 저장되지 않은 데이터가 있습니다.<br> 계속하시겠습니까?"; break;
                    case "MSGBD00103": retStr = "조회된 데이터가 없습니다."; break;
                    case "MSGBD00104": retStr = "변경된 데이터가 있습니다.<br>페이지 전환을 하시겠습니까?"; break;
                    case "MSGBD00105": retStr = "서버와 통신중입니다."; break;
                    case "MSGBD00106": retStr = "개발 준비중입니다."; break;
                    case "MSGBD00107": retStr = "현재 페이지를 새로 불러옵니다."; break;
                    case "MSGBD00108": retStr = "資料を照会中です。"; break;
                    case "MSGBD00109": retStr = "언어 변경중입니다. 잠시만 기다려 주세요."; break;
                    case "MSGBD00110": retStr = "변경된 데이터가 없습니다."; break;
                    case "MSGBD00111": retStr = "검색된 데이터가 없습니다."; break;
                    case "MSGBD00112": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00113": retStr = "변경된 데이터가 있습니다.<br>모든 데이터가 초기화 됩니다.<br>계속하시겠습니까?"; break;
                    case "MSGBD00114": retStr = "Ajax 요청이 잘못되었습니다."; break;
                    case "MSGBD00115": retStr = "Ajax 요청에 대한 데이터를 파싱하지 못하였습니다."; break;
                    case "MSGBD00116": retStr = "Ajax 요청 대기시간을 초과하였습니다."; break;
                    case "MSGBD00117": retStr = "조건이 변경되어서 다시 조회하여야합니다."; break;
                    case "MSGBD00118": retStr = "필수 입력사항이 비어있습니다."; break;
                    case "MSGBD00119": retStr = "저장부터 먼저 하세요."; break;
                    case "MSGBD00120": retStr = "는 필수 입력 사항입니다."; break;
                    case "MSGBD00121": retStr = "오늘보다 이전일일순 없습니다."; break;
                    case "MSGBD00122": retStr = "이번달보다 이전달일순 없습니다."; break;
                    case "MSGBD00123": retStr = "0 보다 큰 수를 입력하세요."; break;
                    case "MSGBD00124": retStr = "초기화 중입니다."; break;
                    case "MSGBD00125": retStr = "모든 데이터가 삭제됩니다 계속 하시겠습니까?"; break;
                    case "MSGBD00126": retStr = "조회부터 먼저하세요."; break;
                    case "MSGBD00127": retStr = "선택된 데이터가 없습니다."; break;
                    case "MSGBD00128": retStr = "부터 먼저 입력하세요."; break;
                    default: retStr = ""; break;
                }
            };

            if (window.lgLang) {
                switch (String(window.lgLang).toLowerCase()) {
                    default: case "ko": dfLang(); break;
                    case "en": enLang(); break;
                    case "cn": cnLang(); break;
                    case "jp": jpLang(); break;
                }
            } else {
                dfLang();
            }

            return retStr;
        };

        this.DisplayMsgBox = function (pTitle, pMessage, pMessageBoxButtons, pWindowSize, pCallback) {
            if (window.Ext && Ext.Msg) { //ext 사용
                var callback = function (btn) {
                    var dr = null;
                    switch (btn) {
                        case "ok":
                            dr = DialogResult.Ok;
                            break;
                        case "cancel":
                            dr = DialogResult.Cancel;
                            break;
                        case "yes":
                            dr = DialogResult.Yes;
                            break;
                        case "no":
                            dr = DialogResult.No;
                            break;
                    }

                    if (pCallback) {
                        window.setTimeout(function () { pCallback(dr); }, 0);
                    }
                };

                if (pMessageBoxButtons) {
                    var ext_msg_btn;
                    switch (pMessageBoxButtons) {
                        case MessageBoxButtons.Ok:
                            ext_msg_btn = Ext.Msg.OK;
                            break;
                        case MessageBoxButtons.OkCancel:
                            ext_msg_btn = Ext.Msg.OKCANCEL;
                            break;
                        case MessageBoxButtons.YesNo:
                            ext_msg_btn = Ext.Msg.YESNO;
                            break;
                        case MessageBoxButtons.YesNoCancel:
                            ext_msg_btn = Ext.Msg.YESNOCANCEL;
                            break;
                    }
                    Ext.Msg.show({ modal: false, title: pTitle, msg: pMessage, buttons: ext_msg_btn, icon: Ext.MessageBox.INFO, fn: callback });
                } else {
                    Ext.Msg.show({ modal: false, title: pTitle, msg: pMessage, buttons: Ext.Msg.OK, icon: Ext.MessageBox.INFO, fn: callback });
                }
            } else { //ext 관련 메세지 라이브러리가 없을때
                if (lgDisplayMessageBox) return;

                if (lgDisplayStatusLoadingBox) {
                    if (eni.Loading) {
                        eni.Loading.DisplayStatusLoading(false);
                    }
                }

                if (window.gMessageBox) {
                    var frmViewMsgBox = ASPxClientPopupControl.Cast(gMessageBox);

                    if (pTitle) {
                        frmViewMsgBox.SetHeaderText(pTitle);
                    }

                    if (!pMessageBoxButtons) {
                        pMessageBoxButtons = MessageBoxButtons.Ok;
                    }

                    window.setTimeout(function () { frmViewMsgBox.ShowMessage(pMessage, pMessageBoxButtons, pWindowSize, pCallback); }.aspxBind(this), 0);
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("Common Message was not initialized in the box.", LogType.Error);
                    } else {
                        top.window.console.error("Common Message was not initialized in the box.");
                    }
                }
            }
        };

        //this.DisplayMsgBoxAfterHistoryBack = function (pTitle, pMessage, pMessageBoxButtons, pWindowSize, pCallback) {

        //};

        this.DisplayBundleMsgBox = function (pStrTitleBundleID, pStrMessageBudleID, pMessageBoxButtons, pWindowSize, pCallback) {
            if (window.Ext && Ext.Msg) { //ext 사용
                var callback = function (btn) {
                    var dr = null;
                    switch (btn) {
                        case "ok":
                            dr = DialogResult.Ok;
                            break;
                        case "cancel":
                            dr = DialogResult.Cancel;
                            break;
                        case "yes":
                            dr = DialogResult.Yes;
                            break;
                        case "no":
                            dr = DialogResult.No;
                            break;
                    }
                    
                    if (pCallback) {
                        //pCallback(dr);
                        window.setTimeout(function () { pCallback(dr); }, 0);
                    }
                };

                if (pMessageBoxButtons) {
                    var ext_msg_btn;
                    switch (pMessageBoxButtons) {
                        case MessageBoxButtons.Ok:
                            ext_msg_btn = Ext.Msg.OK;
                            break;
                        case MessageBoxButtons.OkCancel:
                            ext_msg_btn = Ext.Msg.OKCANCEL;
                            break;
                        case MessageBoxButtons.YesNo:
                            ext_msg_btn = Ext.Msg.YESNO;
                            break;
                        case MessageBoxButtons.YesNoCancel:
                            ext_msg_btn = Ext.Msg.YESNOCANCEL;
                            break;
                    }
                    Ext.Msg.show({ modal: false, title: this.StrBundle(pStrTitleBundleID), msg: this.StrBundle(pStrMessageBudleID), buttons: ext_msg_btn, icon: Ext.MessageBox.INFO, fn: callback });
                } else {
                    Ext.Msg.show({ modal: false, title: this.StrBundle(pStrTitleBundleID), msg: this.StrBundle(pStrMessageBudleID), buttons: Ext.Msg.OK, icon: Ext.MessageBox.INFO, fn: callback });
                }
            } else {
                if (lgDisplayMessageBox) return;

                if (window.gMessageBox) {
                    var frmViewMsgBox = ASPxClientPopupControl.Cast(gMessageBox);

                    frmViewMsgBox.SetHeaderText(this.StrBundle(pStrTitleBundleID));

                    if (!pMessageBoxButtons) {
                        pMessageBoxButtons = MessageBoxButtons.Ok;
                    }

                    var bdMsg = this.StrBundle(pStrMessageBudleID);

                    window.setTimeout(function () { frmViewMsgBox.ShowMessage(bdMsg, pMessageBoxButtons, pWindowSize, pCallback); }.aspxBind(this), 0);
                } else {
                    if (eni.Log && LogType) {
                        eni.Log.WriteLog("Common Message was not initialized in the box.", LogType.Error);
                    } else {
                        top.window.console.error("Common Message was not initialized in the box.");
                    }
                }
            }
            
        };

        //this.DisplayCodeMsgBox = function (pTitle, pMessageCode, pMessageBoxButtons, pWindowSize, pCallback) {
        //    if (lgDisplayMessageBox) return;

        //    if (window.gMessageBox) {
        //        var frmViewMsgBox = ASPxClientPopupControl.Cast(gMessageBox);
        //        if (pTitle) {
        //            frmViewMsgBox.SetHeaderText(pTitle);
        //        }

        //        if (!pMessageBoxButtons) {
        //            pMessageBoxButtons = MessageBoxButtons.Ok;
        //        }

        //        eni.Ajax.GetJson("/Ajax", { Cmd: "GetMessage", Code: pMessageCode }, function (retData) {
        //            window.setTimeout(function () { frmViewMsgBox.ShowMessage("[" + retData.Code + "] " + retData.Message, pMessageBoxButtons, pWindowSize, pCallback); }.aspxBind(this), 0);
        //        });
        //    } else {
        //        if (eni.Log && LogType) {
        //            eni.Log.WriteLog("Common Message was not initialized in the box.", LogType.Error);
        //        } else {
        //            top.window.console.error("Common Message was not initialized in the box.");
        //        }
        //    }
        //};

        this.DisplayCodeMsgBox = function (strTitleBundleIdOrTitle, pMessageCode, pMessageBoxButtons, pWindowSize, pCallback) {
            var strTitle = (this.StrBundle(strTitleBundleIdOrTitle) || strTitleBundleIdOrTitle);
            var strMessageObj = eni.DbAccess.DbMessage(pMessageCode);
            strTitle += " (" + strMessageObj.Code + ")";
            strMessageObj = strMessageObj.Message;
            this.DisplayMsgBox(strTitle, strMessageObj, pMessageBoxButtons, pWindowSize, pCallback);
        };

        this.DisplayConfirmBox = function (pTitle, pConfirmMessage, pWindowSize, pCallback) {
            if (lgDisplayMessageBox) return;

            if (window.gConfirmBox) {
                var frmViewCofBox = ASPxClientPopupControl.Cast(gConfirmBox);
                var args = {
                    Title: pTitle,
                    ConfirmMessage: pConfirmMessage,
                    WindowSize: pWindowSize
                };
                frmViewCofBox.ShowConfirm(args, pCallback);
            } else {
                if (eni.Log && LogType) {
                    eni.Log.WriteLog("Common Message was not initialized in the box.", LogType.Error);
                } else {
                    top.window.console.error("Common Message was not initialized in the box.");
                }
            }
        };
    }
})();
