<%@ WebHandler Language="C#" Class="DBHandler" %>

using System;
using System.Web;

public class DBHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.Write(createEvent());

        //context.Response.Write("Hola!");
        //string result = "";
        //string str = context.Request.HttpMethod;
        /*
        if (str == "POST")
        {
            //string name = context.Request.Form["name"];
            string name = context.Request.Params["name"];
            string description = context.Request.Params["description"];
            int type_id = Int32.Parse(context.Request.Params["type_id"]);
            DateTime date = DateTime.Parse(context.Request.Params["date"]);
            DateTime start_time = DateTime.Parse(context.Request.Params["start_time"]);
            DateTime end_time = DateTime.Parse(context.Request.Params["end_time"]);
            int fee = Int32.Parse(context.Request.Params["fee"]);
            string location = context.Request.Params["location"];
            int host_id = Int32.Parse(context.Request.Params["host_id"]);
            result = createEvent(name, type_id, date, start_time, end_time, fee, location, host_id).ToString;
        }
        else
        {
            context.Response.Write("Hola!");
            //result = getAllEvents();
        }
         * */
        //context.Response.ContentType = "text/plain";
        //context.Response.Write(result);
        //context.Response.Redirect("Default.aspx");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    /*
    public static string getAllEvents()
    {
        List<Event> totalEvents = EventDB.getAllEvents();
        string ret = "";

        // this conversion is just to see in the browser
        foreach (Event e in totalEvents)
        {
            ret += e.Id.ToString();
            ret += e.Name.ToString() + e.Location + e.Host_id.ToString() + e.Start_time.ToString() + e.End_time.ToString() + e.Fee.ToString() + e.Type_id.ToString();
        }

        return ret;
        //should return List<Event> 
    }
    

    // need not be here.. can access DB one directly ..this method queries for the event based on the passed in event ID. (used in display of a particular event get the Id form aspx and pass here)
    public static string getEventbyID(int id)
    {
        Event e = EventDB.getEvent(id);

        string ret = e.Id.ToString();
        ret += e.Name.ToString();
        // this is just to see in the browser
        return ret;
    }
    */

    public bool createEvent()
    {
        //string name,string description,int type_id,DateTime date,DateTime start_time,DateTime end_time,int fee,string location,int host_id
        //Hashtable h = new Hashtable();
        //h.Add("name", name);
        //h.Add("description", description);
        //h.Add("type_id", type_id);
        //h.Add("date", date);
        //h.Add("start_time", start_time);
        //h.Add("end_time", end_time);
        //h.Add("fee", fee);
        //h.Add("location", location);
        //h.Add("host_id", host_id);     
        //return EventDB.create_Event(h);
        return true;
    }
    
}