using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Routing;
using System.Text;
using System.Collections.Specialized;

using eniFramework.DataAccess;
using eniFramework.WebApp.Common;
using CommonResource = eniFramework.WebApp.Common.Properties.Resources;

namespace eniFramework.WebApp.Core {
    /// <summary>
    /// 요청 페이지의 정보를 관리합니다.
    /// </summary>
    public class PageInfo {
        /// <summary>
        /// 페이지 아이디를 가져옵니다.
        /// </summary>
        public string PageID { get; private set; }
        /// <summary>
        /// 라우트 아이디를 가져옵니다.
        /// </summary>
        public string RouteID { get; private set; }
        /// <summary>
        /// 라우트 명을 가져옵니다.
        /// </summary>
        public string RouteName { get; private set; }
        /// <summary>
        /// 라우트 설명글을 가져옵니다.
        /// </summary>
        public string RouteDescription { get; private set; }
        /// <summary>
        /// 라우트 요청 URL을 가져옵니다.
        /// </summary>
        public string RouteUrl { get; private set; }
        /// <summary>
        /// 라우트 가상 경로를 가져옵니다.
        /// </summary>
        public string VirtualPath { get; private set; }
        /// <summary>
        /// 요청 프로그램 상위 아이디를 가져옵니다.
        /// </summary>
        public string RequestParentMenuID { get; private set; }
        /// <summary>
        /// 요청 프로그램 아이디를 가져옵니다.
        /// </summary>
        public string RequestMenuID { get; private set; }
        /// <summary>
        /// 요청 프로그램 명을 가져옵니다.
        /// </summary>
        public string RequestMenuName { get; private set; }

        HttpServerUtility Server = null;
        HttpRequest Request = null;
        BaseUIACTPage BasePage = null;

        public PageInfo(BaseUIACTPage pBasePage) {
            Server      = pBasePage.Server;
            Request     = pBasePage.Request;
            BasePage    = pBasePage;
            
            var routingObj = pBasePage.RouteData.Route as Route;
            if (routingObj != null) {
                var routingDataObj = routingObj.RouteHandler as PageRouteHandler;

                if (routingDataObj != null) {
                    if (routingDataObj.CheckPhysicalUrlAccess) {
                        var vPath = routingDataObj.GetSubstitutedVirtualPath(Request.RequestContext);
                        var startSpIdx = vPath.LastIndexOf('/') + 1;
                        var endSpIdx = vPath.LastIndexOf('.') - startSpIdx;

                        this.PageID = vPath.Substring(startSpIdx, endSpIdx);

                        var route_obj = BasePage.Session[CommonResource.SessionPageInfo] as PageInfo;

                        if (route_obj == null || route_obj.RouteUrl != routingObj.Url) {
                            var routeinfo = RouteInfo.GetRouteByUrl(routingObj.Url);
                            if (routeinfo != null) {
                                this.RouteID            = routeinfo.RouteID;
                                switch (this.BasePage.lgLang) {
                                    case "KO":
                                        this.RouteName          = routeinfo.RouteNameKor;
                                        this.RouteDescription   = routeinfo.RouteDescriptionKor;
                                        break;
                                    case "EN":
                                        this.RouteName          = routeinfo.RouteNameEng;
                                        this.RouteDescription = routeinfo.RouteDescriptionEng;
                                        break;
                                    case "CN":
                                        this.RouteName          = routeinfo.RouteNameCha;
                                        this.RouteDescription   = routeinfo.RouteDescriptionCha;
                                        break;
                                    case "JP":
                                        this.RouteName          = routeinfo.RouteNameJpn;
                                        this.RouteDescription   = routeinfo.RouteDescriptionJpn;
                                        break;
                                    default:
                                        this.RouteName          = routeinfo.RouteName;
                                        this.RouteDescription   = routeinfo.RouteDescription;
                                        break;
                                }
                                this.RouteUrl           = routeinfo.RouteUrl;
                                this.VirtualPath        = routeinfo.VirtualPath;
                                //this.RequestMenuID      = this.RouteUrl;
                                //this.RequestParentMenuID = routeinfo.RouteGroupID;
                                //this.RequestMenuName    = this.RouteName;
                            }

                            BasePage.Session[CommonResource.SessionPageInfo] = this;
                        } else {
                            this.RouteID                = route_obj.RouteID;
                            this.RouteName              = route_obj.RouteName;
                            this.RouteDescription       = route_obj.RouteDescription;
                            this.RouteUrl               = route_obj.RouteUrl;
                            this.VirtualPath            = route_obj.VirtualPath;
                            //this.RequestMenuID          = route_obj.RequestMenuID;
                            //this.RequestParentMenuID    = route_obj.RequestParentMenuID;
                            //this.RequestMenuName        = route_obj.RequestMenuName;
                        }

                        if (string.IsNullOrWhiteSpace(this.BasePage.lgUrlInfo.RequestQueryString["strRequestParentMenuID"]) == false) {
                            this.RequestParentMenuID = this.BasePage.lgUrlInfo.RequestQueryString["strRequestParentMenuID"];
                        }
                        if (string.IsNullOrWhiteSpace(this.BasePage.lgUrlInfo.RequestQueryString["strRequestMenuID"]) == false) {
                            this.RequestMenuID = this.BasePage.lgUrlInfo.RequestQueryString["strRequestMenuID"];
                        }
                        if (string.IsNullOrWhiteSpace(this.BasePage.lgUrlInfo.RequestQueryString["strRequestMenuName"]) == false) {
                            this.RequestMenuName = this.BasePage.lgUrlInfo.RequestQueryString["strRequestMenuName"];
                        }

                        pBasePage.Title = RouteName;
                    } 
                }
            }
        }
    }
}