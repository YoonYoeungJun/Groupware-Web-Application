using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using eniFramework.WebApp.WS.Security;

namespace eniFramework.WebApp.WS.Mail {
    /// <summary>
    /// MailSender의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    // [System.Web.Script.Services.ScriptService]
    public class MailSender : System.Web.Services.WebService {

        public WSAuthentication authentication;

        [WebMethod]
        [SoapHeader("authentication")]
        public string ValidUser() {
            if(User.IsInRole("Customer"))
                return "User is in role customer";

            if(User.Identity.IsAuthenticated)
                return "User is a valid user";
            return "not authenticated";
        }

    //    // Create a new instance of a Web service proxy class.
    //SecureWebService s = new SecureWebService();

    //// Create the Authentication SOAP header and set values.
    //Authentication a = new Authentication();
    //a.User = user.Value;
    //a.Password = password.Value;

    //// Assign the Header.
    //s.AuthenticationValue = a;

    //  string result = s.ValidUser();


        [WebMethod]
        [SoapHeader("authentication")]
        public string HelloWorld() {
            return "Hello World";
        }

        [WebMethod]
        [SoapHeader("authentication")]
        public string Send(string from, string to, string cc, string bcc, string subject, string body) {

            return from + " " + to + " " + cc + " " + bcc + " " + subject + " " + body;
        }

//        <%
//Dim objXMLHTTP : set objXMLHTTP = Server.CreateObject("Msxml2.XMLHTTP.3.0")
//Dim strRequest, strResult, strFunction, strURL, strNamespace

//'URL to SOAP namespace and connection URL
//strNamespace = "http://capwiz.com/CapWiz/SOAP/Services"
//strURL = "http://capwiz.com/soap/"

//'function you want to call
//strFunction = "get_demographics_electeddistricts"
//'strFunction = "test" 'no parameters required

//strRequest ="<?xml version=""1.0"" encoding=""utf-8""?>" _
//& "<SOAP-ENV:Envelope xmlns:SOAP-ENV=""http://schemas.xmlsoap.org/soap/envelope/""  xmlns:SOAP-ENC=""http://schemas.xmlsoap.org/soap/encoding/""" _
//& "        xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema"">" _
//& "    <SOAP-ENV:Body>" _
//& "        <m:" & strFunction & " xmlns:m=""" & strNamespace & """>" _
//& "            <authuser>YOUR_USERNAME_HERE</authuser>" _
//& "            <authpass>YOUR_PASSWORD_HERE</authpass>" _
//& "            <street>2751 Prosperity Ave</street>" _
//& "            <city>Fairfax</city>" _
//& "            <state>VA</state>" _
//& "            <zip5>22031</zip5>" _
//& "        </m:" & strFunction & ">" _
//& "    </SOAP-ENV:Body>" _
//& "</SOAP-ENV:Envelope>"

//objXMLHTTP.open "post", "" & strURL & "", False

//objXMLHTTP.setRequestHeader "Content-Type", "text/xml; charset=utf-8"
//objXMLHTTP.setRequestHeader "Content-Length", Len(strRequest)

//objXMLHTTP.setRequestHeader "SOAPAction", strNamespace & "#" & strFunction

//'send the request and capture the result
//Call objXMLHTTP.send(strRequest)
//strResult = objXMLHTTP.responseText

//'display the XML
//response.write strResult
//%>
    }
}
