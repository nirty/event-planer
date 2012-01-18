using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserDB
/// </summary>
public class UserDB
{
    static string myConnection_string = ConfigurationManager.ConnectionStrings["event_con"].ConnectionString;
    static SqlConnection myConn = new SqlConnection();

	static UserDB()
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

    public static int create_user(string uname,string pass,string fname,string lname,string email,string phone,string level,string school,string univ)
    {
        string query = "create_user";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlParameter user_name = new SqlParameter("@username", SqlDbType.VarChar, 50);
        SqlParameter first_name = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
        SqlParameter last_name = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
        SqlParameter pass_word = new SqlParameter("@password", SqlDbType.VarChar, 50);
        SqlParameter e_mail = new SqlParameter("@email", SqlDbType.VarChar, 50);
        SqlParameter p_hone = new SqlParameter("@phone", SqlDbType.VarChar, 50);
        SqlParameter s_chool = new SqlParameter("@school", SqlDbType.VarChar, 50);
        SqlParameter l_evel = new SqlParameter("@level", SqlDbType.VarChar, 50);
        SqlParameter u_niv = new SqlParameter("@university", SqlDbType.VarChar, 50);
       

        user_name.Value = uname;
        first_name.Value = fname;
        last_name.Value = lname;
        e_mail.Value = email;
        pass_word.Value = pass;
        p_hone.Value = phone;
        s_chool.Value = school;
        l_evel.Value = level;
        u_niv.Value = univ;

        cm.Parameters.Add(user_name);
        cm.Parameters.Add(first_name);
        cm.Parameters.Add(last_name);
        cm.Parameters.Add(e_mail);
        cm.Parameters.Add(pass_word);
        cm.Parameters.Add(p_hone);
        cm.Parameters.Add(s_chool);
        cm.Parameters.Add(l_evel);
        cm.Parameters.Add(u_niv);

        
        cm.Parameters.Add("@ret_userid", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
   

        try
        {
      
            cm.ExecuteScalar();
            Int32 user_id = (Int32)cm.Parameters["@ret_userid"].Value;
            return ((int)user_id);
        }
        catch (Exception e)
        {
            return 0;
        }

        
    }


    public static User get_user(int id)
    {

        string query = "get_user";
        SqlCommand cm = null;

        cm = new SqlCommand(query, myConn);
        cm.CommandType = System.Data.CommandType.StoredProcedure;

        SqlParameter user_id = new SqlParameter("@id", SqlDbType.Int);
       

        user_id.Value = id;
        cm.Parameters.Add(user_id);

        User user;
        SqlDataReader reader;
        try
        {
            reader = cm.ExecuteReader();
            int uid;
            string  fn, un, ln, pw, em, sh, lv, uv,ph;
            while (reader.Read())
            {                
               uid= reader.GetInt32(0);
               un = reader.GetString(1);
               fn = reader.GetString(2);
               ln = reader.GetString(3);
               pw = reader.GetString(4);
               em = reader.GetString(5);
               ph = reader.GetString(6);
               sh = reader.GetString(7);
               lv = reader.GetString(8);
               uv = reader.GetString(9);
               user = new User(uid, un, fn, ln, pw, ph, em, sh, uv, lv);
               reader.Close();
               return user;              
            }
            user = new User();
            return user;
            
            
        }
        catch (Exception e)
        {
            user = new User();
            return user;
        }
        //
        

        
    }
}