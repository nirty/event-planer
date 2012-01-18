using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event
{
    int id;
    String name;
    String description;
    String location;
    DateTime date;
    DateTime start_time;
    DateTime end_time;
    int fee;
    int type_id;
    int host_id;


    private String type;

    public String Type
    {
        get { return type; }
        set { type = value; }
    }
    
   
    
    public Event()
	{
		
	}

    public Event(int id1,string name)
    {
        this.id = id1;
        this.name = name;
    }

    public Event(int id1,String nam,String desc,String loc,DateTime dat, DateTime start_tim,DateTime end_tim,int fe,int type,int host)
    {
        this.id = id1;
        this.name = nam;
        this.description = desc;
        this.location = loc;
        this.date = dat;
        this.start_time = start_tim;
        this.end_time = end_tim;
        this.fee = fe;
        this.type_id = type;
        this.host_id = host;
    }

    public string Name
    {
        get { return this.name; }
        set { this.name = value; }
    }

    public string Description
    {
        get { return this.description; }
        set { this.description = value; }
    }

    public string Location
    {
        get { return this.location; }
        set { this.location = value; }
    }

    public DateTime Date
    {
        get { return this.date; }
        set { this.date = value; }
    }

    public DateTime Start_time
    {
        get { return this.start_time; }
        set { this.start_time = value; }
    }

    public DateTime End_time
    {
        get { return this.end_time; }
        set { this.end_time = value; }
    }

    public int Fee
    {
        get { return this.fee; }
        set { this.fee = value; }
    }

    public int Type_id
    {
        get { return this.type_id; }
        set { this.type_id = value; }
    }

    public int Host_id
    {
        get { return this.host_id; }
        set { this.host_id = value; }
    }

    public int Id
    {
        get { return this.id; }
        set { this.id = value; }
    }

    //additional feature for host of the event
    private string host_uname;

    public string host_Uname
    {
        get { return this.host_uname; }
        set { this.host_uname = value; }
    }

    private string host_fname;

    public string host_Fname
    {
        get { return this.host_fname; }
        set { this.host_fname = value; }
    }

    private string host_lname;

    public string host_Lname
    {
        get { return this.host_lname; }
        set { this.host_lname = value; }
    }

    private string type_name;

    public string type_Name
    {
        get { return this.type_name; }
        set { this.type_name = value; }
    }
    
    
    
    

}