<%@ WebHandler Language="C#" Class="EventHandler" %>

using System;
using System.Web;
//all this works good for AJAX CALLS    

public class EventHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string resp = "";

         
  

        if (context.Request.HttpMethod == "POST")
        {
            //resp += context.Request.Params.ToString();
            string name = context.Request.Params.Get("name");
            string desc = context.Request.Params.Get("desc");
            string loc = context.Request.Params.Get("loc");
            string type = context.Request.Params.Get("type");
            string date = context.Request.Params.Get("date");
            string fee = context.Request.Params.Get("fee");

            int fee_i = Int32.Parse(fee);
            int type_i = Int32.Parse(type);
            DateTime date_D = DateTime.Parse(date);

            if(EventDB.create_Event(name, type_i , desc, date_D, date_D, date_D, fee_i, loc, 1))
                resp += EventList.getAllEvents();
            else
                resp += "------------" + name + desc + loc + type + date + fee + fee_i.ToString() + type_i.ToString() + date_D.ToString() ;
        }
        else if (context.Request.HttpMethod == "GET")
        {
            //string event_id = context.Request.Params.Get("event_id");
            //int event_id_i;

            //if (event_id)
            //{
            //    event_id_i = Int32.Parse(event_id);
            //    resp = EventList.getEventbyID(event_id_i);
            //}
            //else
            //{
                resp += EventList.getAllEvents();

            //}
        }

        context.Response.Write(resp);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    

}