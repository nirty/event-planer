<%@ WebHandler Language="C#" Class="getuserH" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;

public class getuserH : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        EventAttendDB.attend_event(1, 7);
         List<User> attendees = EventAttendDB.get_Attendees(1);

         string result = "";
         foreach (User user in attendees)
         {
             result += user.Username;
         }
        context.Response.Write(result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}