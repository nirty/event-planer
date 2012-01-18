<%@ WebHandler Language="C#" Class="createUser" %>

using System;
using System.Web;

public class createUser : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";


        string username = context.Request.Params.Get("uname").ToString();
        string firstname = context.Request.Params.Get("fname").ToString();
        string password = context.Request.Params.Get("Password1").ToString();
        string lastname = context.Request.Params.Get("lname").ToString();
        string email = context.Request.Params.Get("email").ToString();
        string phone = context.Request.Params.Get("phone").ToString();
        string level = context.Request.Params.Get("level").ToString();
        string school = context.Request.Params.Get("school").ToString();
        string univ = context.Request.Params.Get("univ").ToString();

        //int userid = UserDB.create_user(username, password, firstname, lastname, email, phone, level, school, univ);
        //context.Response.Write(userid);
        int userid = 0 ;
        try
        {
             username = username.Trim();
             userid = UserDB.create_user(username, password, firstname, lastname, email, phone, level, school, univ);

        }
        catch (Exception e)
        {
            context.Response.Redirect("Register.aspx");
            context.Response.Write(e.ToString());
        }
        
            if (userid == 0)
            {               
                context.Response.Write("creation Failed" + username + password + firstname + lastname + email + phone + level + school + univ);
              
            }
            else
            {
               context.Response.Redirect("UserDetails.aspx?id="+userid);
               context.Response.Write("creation passed" + username + password + firstname + lastname + email + phone + level + school + univ);            
               
            }
     
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}