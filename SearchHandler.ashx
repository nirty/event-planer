<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections;
using System.Collections.Generic;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        HttpRequest request = context.Request;
        
        Hashtable criteria = new Hashtable();
        criteria.Add("type_id_varchar", request["type_id_varchar"]);
        criteria.Add("date", request["date"]);
        criteria.Add("university", request["university"]);
        criteria.Add("keyword", request["keyword"]);

        List<string> eventIds;
        
        try 
	    {	        
            eventIds = EventDB.searchEvents(criteria);
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string serializedEventIds = serializer.Serialize(eventIds);
            context.Response.ContentType = "application/json";
            context.Response.Write(serializedEventIds);
            return;
	    }
	    catch (Exception e)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write(e.Message);
            context.Response.Write(e.StackTrace);
            return;
        }

    }
 
    public bool IsReusable {
        get {
            return true;
        }
    }

}