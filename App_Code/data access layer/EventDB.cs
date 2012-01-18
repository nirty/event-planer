using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Diagnostics;
using System.Text;

/// <summary>
/// Summary description for EventDB
/// </summary>
public static class EventDB
{
    // connection string and sql connection. this should be used to query all results
    //static string myConnection_string = "Data Source=tcp:palmer-vm.seas.upenn.edu;Initial Catalog=*********;User ID=*********;Password=********;";
    static string myConnection_string = ConfigurationManager.ConnectionStrings["event_con"].ConnectionString;
    static SqlConnection myConn = new SqlConnection();


	static EventDB()
	{
        setup_connection();
	}


    //this is used to setup and open connections
    private static void setup_connection()
    {
        try
        {
            myConn.Close();
            myConn.ConnectionString = myConnection_string;
            myConn.Open();

        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex);
        }
    }

    public static void validateSearchCriteria(Hashtable criteria)
    {
        string[] expectedKeys = { "type_id_varchar", "date", "university", "keyword" };
        foreach (string key in expectedKeys) Debug.Assert(criteria.Contains(key));
        Debug.Assert(criteria.Count == expectedKeys.Length);
    }

    public static Hashtable makeParameterMap(Hashtable criteria)
    {
        Hashtable parameterMap = new Hashtable();

        foreach (string key in criteria.Keys)
        {
            if (((string)criteria[key] == null) || ((string)criteria[key] == ""))
            {
                parameterMap.Add("@" + key, "%");
            }
            else parameterMap.Add("@" + key, "%" + (string)criteria[key] + "%");
        }

        return parameterMap;
    }

    public static string synthesizeSearchQuery(Hashtable parameterMap)
    {
        StringBuilder query = new StringBuilder("select id ");
        //query.Append("from events, classification, users ");
        query.Append("from events ");
        //query.Append("where (events.type_id = classification.classification_id) " + 
        //    "and (events.host_id = users.userid) ");
        //query.Append("and (date like @date");
        query.Append("where (date like @date");
        if ((string)parameterMap["@date"] == "%") query.Append(" or date is null");
        query.Append(")");
        query.Append(" and (convert(varchar, type_id) like @type_id_varchar)");
        query.Append(" and (name like @keyword or description like @keyword");
        if ((string)parameterMap["@keyword"] == "%") query.Append(" or description is null");
        query.Append(")");
        query.Append(" and (events.university like @university");
        if ((string)parameterMap["@university"] == "%") query.Append(" or events.university is null");
        query.Append(")");
        query.Append(" order by start_time");

        return query.ToString();
    }

    public static SqlCommand makeSearchCommand(string query, Hashtable parameterMap)
    {
        SqlCommand cmd = new SqlCommand(query, myConn);
        foreach (string paramName in parameterMap.Keys)
        {
            SqlParameter param = new SqlParameter(paramName, parameterMap[paramName]);
            cmd.Parameters.Add(param);
        }

        return cmd;
    }

    public static int getInt(SqlDataReader reader, string fieldName)
    {
        int index = reader.GetOrdinal(fieldName);
        if (reader.IsDBNull(index)) return -1;
        else return reader.GetInt32(index);
    }

    public static string getString(SqlDataReader reader, string fieldName)
    {
        int index = reader.GetOrdinal(fieldName);
        if (reader.IsDBNull(index)) return null;
        else return reader.GetString(index);
    }

    //retrieves events satisfying the arguments' parameterMap.
    public static List<string> searchEvents(Hashtable criteria)
    {
        validateSearchCriteria(criteria);
        Hashtable parameterMap = makeParameterMap(criteria);
        string query = synthesizeSearchQuery(parameterMap);
        SqlCommand cmd = makeSearchCommand(query, parameterMap);

        List<string> eventIds = new List<string>();
        SqlDataReader reader;
        try
        {
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                //string name, descrip, location, type_name, tags, school, univ, host_uname, host_fname, 
                //    host_lname;
                //int id, host_id, fee, type_id;
                //DateTime date, start, end;

                //type_id = getInt(reader, "type_id");
                //fee = getInt(reader, "fee");
                //date = (DateTime)reader["date"];
                //start = (DateTime)reader["start_time"];
                //end = (DateTime)reader["end_time"];
                //host_id = getInt(reader, "host_id");
                //id = getInt(reader, "id");
                //name = getString(reader, "name");
                //descrip = getString(reader, "description");
                //location = getString(reader, "location");
                //host_uname = getString(reader, "firstname");
                //univ = getString(reader, "university");
                //school = getString(reader, "school");
                //tags = getString(reader, "tags");
                //type_name = getString(reader, "classification_name");
                //host_fname = getString(reader, "firstname");
                //host_lname = getString(reader, "lastname");
                
                //Event ev = new Event(id, name, descrip, location, date, start, end, fee, type_id, 
                //    host_id);
                //ev.host_Uname = host_uname;
                //ev.host_Fname = host_fname;
                //ev.host_Lname = host_lname;
                //ev.type_Name = type_name;
                //events.Add(ev);

                string eventId = getInt(reader, "id").ToString();
                eventIds.Add(eventId);
            }
            reader.Close();
        }
        catch (Exception e) { Console.WriteLine(e.StackTrace); }
        return eventIds;
    }
    
    //static method which queries DB to get a set of results of ALL Events : Select * from Events
    public static List<Event> getAllEvents()
    {


        string query = "get_allevents";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        List<Event> totalEvents = new List<Event>();
        SqlDataReader reader;
        try
        {
            reader = cm.ExecuteReader();

            while (reader.Read())
            {
                string des = "", loc = "", type_name = "", tags = "", school = "", univ = "", host_uname = "", host_fname = "", host_lname = "";
                int host_id,fee,type_id;
                DateTime date, start, end;

                type_id = (int)reader.GetInt32(8);
                fee = (int)reader.GetInt32(6);
                date = reader.GetDateTime(3);
                start = reader.GetDateTime(4);
                end = reader.GetDateTime(5);
                host_id = (int)reader.GetInt32(13);

                int id = (int)reader.GetInt32(0);
                string name = reader.GetString(1);

                try
                {
                    des = reader.GetString(2);
                }
                catch (Exception e)
                {
                    des = null;
                }

                
           
                try
                {
                    loc = reader.GetString(7);
                }
                catch (Exception e)
                {

                }

                try
                {
                    host_uname = reader.GetString(14);
                }
                catch (Exception e)
                {

                }

            
                    
            

                try
                {
                    univ = reader.GetString(12);
                }
                catch (Exception e)
                {

                }

                try
                {
                    school = reader.GetString(11);
                }
                catch (Exception e)
                {

                }

                try
                {
                    tags = reader.GetString(10);
                }
                catch (Exception e)
                {

                }


                try
                {
                    type_name = reader.GetString(9);
                }
                catch (Exception e)
                {

                }
                 try
                {
                     host_fname = reader.GetString(15);
                }
                catch (Exception e)
                {

                }
                 try
                {
                     host_lname = reader.GetString(16);
                }
                catch (Exception e)
                {

                }
              
                Event q = new Event(id,name,des,loc,date,start,end,fee,type_id,host_id);
                q.host_Uname = host_uname;
                q.host_Fname = host_fname;
                q.host_Lname = host_lname;
                q.type_Name = type_name;
                totalEvents.Add(q);

                
            
               
            }
            reader.Close();
        }
        catch (Exception e)
        {

        }
        return totalEvents;
    }




    // this is just for testing.. returns string
    #region MyRegion
    public static String getAllEvents_s()
    {
        List<Event> totalEvents = new List<Event>();
        string ret = "";
        string query = "SELECT id, name FROM events";

        SqlCommand allevent_query = new SqlCommand(query, myConn);
        SqlDataReader reader;
        reader = allevent_query.ExecuteReader();
        try
        {
            while (reader.Read())
            {

                int id = (int)reader["id"];
                string name = reader["name"].ToString();

                Event q = new Event();
                q.Id = id;
                q.Name = name;

                totalEvents.Add(q);
            }

        }
        catch (SqlException ex)
        {
            ret += ex + "this is sql exception";
        }
        catch (Exception e)
        {
            ret += e;
        }

        foreach (Event e in totalEvents)
        {
            ret += e.Id.ToString();
            ret += e.Name.ToString();
        }
        reader.Close();
        return ret;
    }  
    #endregion

    // this method queries for the event based on the passed in event ID. (used in display of a particular event)
    public static Event getEvent(int id_t)
    {

        Event q_event = null;
        string query = "SELECT * FROM events where events.id= 1";
        query = query.Replace("?", id_t.ToString());
        SqlCommand allevent_query = new SqlCommand(query, myConn);
        SqlDataReader reader = null;
        try
        {
            reader = allevent_query.ExecuteReader();
            while (reader.Read())
            {

                int id = (int)reader["id"];
                string name = reader["name"].ToString();
                q_event = new Event(id, name);
            }

        }
        catch (Exception e)
        {
        }
        finally
        {
            reader.Close();
        }

        return q_event;
    }

    public static Event getEvent_test(int id_t)
    {


        string query = "get_event";
        SqlCommand cm1 = null;

       
        Event eventd = new Event();

        cm1 = new SqlCommand(query, myConn);
        cm1.CommandType = System.Data.CommandType.StoredProcedure;


        SqlParameter event_id = new SqlParameter("@eventID", SqlDbType.Int);
        event_id.Value = id_t;
        cm1.Parameters.Add(event_id);
        SqlDataReader reader1;
        reader1 = cm1.ExecuteReader();

        
        try
        {

            
            int fee,id;
            string name, desc, loc, type;
            DateTime start, end, date;
            while (reader1.Read())
            {
                id = reader1.GetInt32(0);
                name = reader1.GetString(1);
                desc = reader1.GetString(2);
                start = reader1.GetDateTime(3);
                end = reader1.GetDateTime(4);
                date = reader1.GetDateTime(5);
                loc = reader1.GetString(6);
                fee = reader1.GetInt32(7);
                type = reader1.GetString(8);

           
                eventd.Id = id;
                eventd.Name = name;
                eventd.Description = desc;
                eventd.Start_time = start;
                eventd.End_time = end;
                eventd.Date = date;
                eventd.Location = loc;
                eventd.Fee = fee;
                eventd.Type = type;

           
            }
            
        }
        catch (Exception e)
        {
            
           // eventd.Name += e;

        }
        reader1.Close();
        return eventd;
    }


    // this creates a new Event based on the input values from the from obtained and passed
    public static bool create_Event(string name, int type_id, string description, DateTime date, DateTime start_time, DateTime end_time, int fee, string location, int host_id)
        //string name,int type_id,DateTime date,DateTime start_time,DateTime end_time,int fee,string location,int host_id)
    {

        string query = "INSERT INTO events (name,type_id,description,date,start_time,end_time,fee,location,host_id) VALUES ('%NAME',%TYPE,'%DESCRIPTION','%DATE','%START_TIME','%END_TIME',%FEE,'%LOCATION','%HOST')";
       // string query = "INSERT INTO classification(classification_name) VALUES('?')";
        query = query.Replace("%NAME", name);
        query = query.Replace("%TYPE", type_id.ToString());
        query = query.Replace("%DESCRIPTION", description);
        query = query.Replace("%DATE", date.ToString());
        query = query.Replace("%START_TIME", start_time.ToString());
        query = query.Replace("%END_TIME", end_time.ToString());
        query = query.Replace("%FEE", fee.ToString());
        query = query.Replace("%LOCATION", location.ToString());
        query = query.Replace("%HOST", host_id.ToString());


        SqlCommand allevent_query = new SqlCommand();
        allevent_query.CommandText = query;
        allevent_query.Connection = myConn;
        try
        {
             allevent_query.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            return false;
        }
        return true;
    }


    //update event needs to be implemented
    public static string update_Event(int event_id, Hashtable param)
    {
        string ret = "";
        string query = "UPDATE events SET name = '%NAME',type_id = '%TYPE',date = '%DATE',start_time = '%START_TIME',end_time = '%END_TIME',fee = '%FEE',location ='%LOCATION',university = '%UNIV',school = '%SCHOOL',tags = '%TAGS' WHERE id = %EVENT_ID";
        // string query = "INSERT INTO classification(classification_name) VALUES('?')";
        query = query.Replace("%NAME", param["name"].ToString());
        query = query.Replace("%TYPE", param["type"].ToString());
        query = query.Replace("%DATE", param["date"].ToString());
        query = query.Replace("%START_TIME", param["start"].ToString());
        query = query.Replace("%END_TIME", param["end"].ToString());
        query = query.Replace("%FEE", param["fee"].ToString());
        query = query.Replace("%LOCATION", param["location"].ToString());
        query = query.Replace("%UNIV", param["univ"].ToString());
        query = query.Replace("%SCHOOL", param["school"].ToString());
        query = query.Replace("%TAGS", param["tags"].ToString());
        query = query.Replace("%EVENT_ID",event_id.ToString());
        

        SqlCommand allevent_query = new SqlCommand();
        allevent_query.CommandText = query;
        allevent_query.Connection = myConn;
        try
        {
            allevent_query.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            ret = e.ToString();

        }
        return ret;
    }
}