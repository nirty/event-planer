using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for EventAttendDB
/// </summary>
public static class EventAttendDB
{
    static string myConnection_string = ConfigurationManager.ConnectionStrings["event_con"].ConnectionString;
    static SqlConnection myConn = new SqlConnection();


	static EventAttendDB()
	{
        setup_connection();
	}

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

    public static List<User>get_Attendees(int eventid)
    {

        string query = "get_attendees";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlParameter event_id = new SqlParameter("@eventid", SqlDbType.Int);


        event_id.Value = eventid;
        cm.Parameters.Add(event_id);

        List<User> attendees = new List<User>();
        SqlDataReader reader;
        try
        {
            reader = cm.ExecuteReader();
            int uid;
            string fn, un, ln, em, sh, lv, uv, ph;
            while (reader.Read())
            {
                uid = reader.GetInt32(0);
                un = reader.GetString(1);
                fn = reader.GetString(2);
                ln = reader.GetString(3);
                em = reader.GetString(4);
                ph = reader.GetString(5);
                sh = reader.GetString(6);
                lv = reader.GetString(7);
                uv = reader.GetString(8);
                User user = new User(uid, un, fn, ln, "" , ph, em, sh, uv, lv);
                attendees.Add(user);
            }
            reader.Close();
        }
        catch (Exception e)
        {
           
        }

        return attendees;
    }

    public static bool attend_event(int eventid, int attendeeid)
    {
        string query = "attend_event";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlParameter event_id = new SqlParameter("@eventid", SqlDbType.Int);
        SqlParameter attendee_id = new SqlParameter("@attendeeid", SqlDbType.Int);
        

        event_id.Value = eventid;
        attendee_id.Value = attendeeid;       

        cm.Parameters.Add(event_id);
        cm.Parameters.Add(attendee_id); 
  
        try
        {
            cm.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }


    public static bool not_attend_event(int eventid, int attendeeid)
    {
        string query = "not_attend_event";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlParameter event_id = new SqlParameter("@eventid", SqlDbType.Int);
        SqlParameter attendee_id = new SqlParameter("@attendeeid", SqlDbType.Int);


        event_id.Value = eventid;
        attendee_id.Value = attendeeid;

        cm.Parameters.Add(event_id);
        cm.Parameters.Add(attendee_id);

        try
        {
            cm.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }
}