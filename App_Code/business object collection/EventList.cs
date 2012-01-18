using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;

/// <summary>
/// Summary description for EventList
/// </summary>
public static class EventList
{
    private static ArrayList totalEvents = null;

	  static EventList()
	{
        if (totalEvents == null)
        {
            getAllEvents();
        }

	}

  
    // this will call EvenetDB and get all the events! this is called when this 
    public static string getAllEvents()
    {
        List<Event> totalEvents = EventDB.getAllEvents();
        string ret = "";

        // this conversion is just to see in the browser
        foreach (Event e in totalEvents)
        {
            ret += e.Id.ToString();
            ret += e.Name.ToString()+ e.Location + e.Host_id.ToString() + e.Start_time.ToString()+ e.End_time.ToString()+e.Fee.ToString()+e.Type_id.ToString();
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


    // this is only for testing purposes
    public static string testing()
    {
        
        //DateTime now = System.DateTime.Now;

        //Hashtable param = new Hashtable();
        //param.Add("name", "google + this is hash updating testing");
        //param.Add("type", 2);
        //param.Add("description", "this is updation");
        //param.Add("date", now);
        //param.Add("start", now);
        //param.Add("end", now);
        //param.Add("fee", 50);
        //param.Add("location", "33 walnut street, philadelphia,PA 19104");
        //param.Add("univ", "wharton");
        //param.Add("school", "wharton");
        //param.Add("tags", "superb website");

        //return EventDB.update_Event(1, param);

        //EventDB.create_Event("nirty third  Testing",3,now,now,now,100,"chennai",2); 
       
      return getAllEvents();
        
    }


    
}