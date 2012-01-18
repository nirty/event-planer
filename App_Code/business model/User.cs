using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{  

	public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public User(int user_id, string user_name, string first_name, string last_name, string p_ass, string p_hone, string e_mail, string s_chool, string u_niv, string l_evel)
    {
        this.userid = user_id;
        this.username = user_name;
        this.firstname = first_name;
        this.lastname = last_name;
        this.email = e_mail;
        this.pass = p_ass;
        this.phone = p_hone;
        this.level = l_evel;
        this.univ = u_niv;
        this.school = s_chool;
    }

    private int userid;
    public int Userid
    {
        get { return this.userid; }
        set { this.userid = value; }
    }

    private string username;
    public string Username
    {
        get { return this.username; }
        set { this.username = value; }
    }
    

    private string firstname;
    public string Firstname 
    {
        get{return this.firstname; }
        set { this.firstname = value; }
    }


    private string lastname;
    public string Lastname
    {
        get { return lastname; }
        set { this.lastname = value; }
    }

    private string email;
    public string Email
    {
        get { return this.email; }
        set { this.email = value; }
    }

    private string phone;
    public string Phone
    {
        get { return this.phone; }
        set { this.phone = value; }
    }

    private string school;
    public string School
    {
        get { return this.school; }
        set { this.school = value; }
    }

    private string level;
    public string Level
    {
        get { return this.level; }
        set { this.level = value; }
    }

    private string univ;
    public string Univ
    {
        get { return this.univ; }
        set { this.univ = value; }
    }

    private string pass;
    public string Pass
    {
        get { return this.pass; }
        set { this.pass = value; }
    }
    
    
    

    
    
    
}