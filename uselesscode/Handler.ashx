<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;


public class Handler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";


        EventDB.get_test();

        
            context.Response.Write(EventDB.get_test());
     
    }
    
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}