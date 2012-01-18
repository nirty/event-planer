<%@ WebHandler Language="C#" Class="createEventH" %>

using System;
using System.Web;

public class createEventH : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string req = "";
        int fee_i = 0;
        int type_i = 0;
        
            string name = context.Request.Params.Get("name");
            string desc = context.Request.Params.Get("desc");
            string loc = context.Request.Params.Get("loc");
            string type = context.Request.Params.Get("type");
            string date = context.Request.Params.Get("date_t");
            string fee = context.Request.Params.Get("fee");
            string start = context.Request.Params.Get("start");
            string end= context.Request.Params.Get("end");
            string user_id = context.Request.Params.Get("user_id");

            int user = Int16.Parse(user_id);




            if (name == "" || loc == "" || type == "" || date == "" || start == "" || end == "" || (start == "0:00" && end == "0:00"))
            {
                context.Response.Redirect("createEvent.aspx");
            }
            else
            {
                try
                {
                    if (fee != "" || fee != null)
                    {
                        fee_i = Int32.Parse(fee);
                    }
                    type_i = Int32.Parse(type);
                    DateTime date_D = DateTime.Parse(date);

                    String[] starting = start.Split(':');

                    Double Shours = Double.Parse(starting[0]);
                    Double Smins = Double.Parse(starting[1]);

                    DateTime Sadded = date_D.AddHours(Shours);
                    DateTime Saddedmins = Sadded.AddMinutes(Smins);

                    String[] ending = end.Split(':');

                    Double Ehours = Double.Parse(ending[0]);
                    Double Emins = Double.Parse(ending[1]);

                    DateTime Eadded = date_D.AddHours(Ehours);
                    DateTime Eaddedmins = Eadded.AddMinutes(Emins);

                    context.Response.Write(Saddedmins + "  " + Eaddedmins);

                    context.Response.Write(date_D + "  " + start + "   " + end);
                    if (EventDB.create_Event(name, type_i, desc, date_D, Saddedmins, Eaddedmins, fee_i, loc, user))
                    {
                        context.Response.Redirect("home.aspx");
                    }
                }
                catch (Exception e)
                {
                    context.Response.Write(e.ToString());

                }

            }
            //req += context.Request.Params.ToString();
          //  context.Response.Write(req);       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}