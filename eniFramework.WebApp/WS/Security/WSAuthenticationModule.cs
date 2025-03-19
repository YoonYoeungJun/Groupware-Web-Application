
using System;
using System.Web;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using System.Text;
using System.Web.Services.Protocols;

namespace eniFramework.WebApp.WS.Security {
    public sealed class WSAuthenticationModule : IHttpModule {
        private WSAuthenticationEventHandler _eventHandler = null;

        public event WSAuthenticationEventHandler Authenticate {
            add { _eventHandler += value; }
            remove { _eventHandler -= value; }
        }

        public void Dispose() {
        }

        public void Init(HttpApplication app) {
            app.AuthenticateRequest += new EventHandler(this.OnEnter);
        }

        private void OnAuthenticate(WSAuthenticationEvent e) {
            if(_eventHandler == null)
                return;

            _eventHandler(this, e);
            if(e.User != null)
                e.Context.User = e.Principal;
        }

        public string ModuleName {
            get { return "WSAuthentication"; }
        }

        void OnEnter(Object source, EventArgs eventArgs) {
            HttpApplication app = (HttpApplication)source;
            HttpContext context = app.Context;
            Stream HttpStream = context.Request.InputStream;

            // Save the current position of stream.
            long posStream = HttpStream.Position;

            // If the request contains an HTTP_SOAPACTION 
            // header, look at this message.
            if(context.Request.ServerVariables["HTTP_SOAPACTION"]
                           == null)
                return;

            // Load the body of the HTTP message
            // into an XML document.
            XmlDocument dom = new XmlDocument();
            string soapUser;
            string soapPassword;

            try {
                dom.Load(HttpStream);

                // Reset the stream position.
                HttpStream.Position = posStream;

                // Bind to the Authentication header.
                soapUser = dom.GetElementsByTagName("User").Item(0).InnerText;
                soapPassword = dom.GetElementsByTagName("Password").Item(0).InnerText;
            } catch(System.Exception e) {
                // Reset the position of stream.
                HttpStream.Position = posStream;

                // Throw a SOAP exception.
                XmlQualifiedName name = new XmlQualifiedName("Load");
                SoapException soapException = new SoapException("Unable to read SOAP request", name, e);
                throw soapException;
            }

            // Raise the custom global.asax event.
            OnAuthenticate(new WSAuthenticationEvent(context, soapUser, soapPassword));
            return;
        }
    }

}

