using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;

public partial class displayEvent : System.Web.UI.Page
{
    int eventID;
    protected void Page_Load(object sender, EventArgs e)
    {

        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {
            User cur_user = UserDB.get_user(Int32.Parse(myuser.Identity.Name));
            //user.InnerHtml = "hello Mr." + cur_user.Username;
            

        }


        string id_s = Request.Params.Get("id");
        if (id_s != null && id_s != "")
        {
            eventID = Int32.Parse(id_s);

            Event cur_event = EventDB.getEvent_test(eventID);

            event_name.InnerHtml = "Event Name        :" + cur_event.Name;
            event_desc.InnerHtml = "Event Description :" + cur_event.Description;
            event_date.InnerHtml = "Event Date        :" + cur_event.Date;
            event_start.InnerHtml = "Event Start time  :" + cur_event.Start_time;
            event_end.InnerHtml = "Event Ending time :" + cur_event.End_time;
            event_type.InnerHtml = "Event Type        :" + cur_event.Type;
            event_fee.InnerHtml = "Event Fee         :" + cur_event.Fee;
            event_location.InnerHtml = "Event Location    :" + cur_event.Location;
            print_attendees();

        }
        else
        {
            err.InnerHtml = "<h1> Parameter Missing </h1>";
        }
        

        
    }

    protected void SignoutButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx", true);

    }


    protected void print_attendees()
    {
        string result = "";
        IPrincipal myuser = this.User;

        edu.upenn.seas.palmer_vm.Attending myService = new edu.upenn.seas.palmer_vm.Attending();
        string[] people = myService.People(eventID).Split(';');
        foreach (string s in people)
            if (!s.Equals(""))
            {
                string[] entry = s.Split('=');
                string id = entry[0];
                string name = entry[1];
                result += "<div id=\"" + id + "\">" + name + "<div>";
                if (id == (myuser.Identity.Name))
                {
                    attend.Visible = false;
                    dontAttend.Visible = true;
                }

            }

        attendees_list.InnerHtml = "";
        attendees_list.InnerHtml = result;
    }
    protected void attend_Click(object sender, EventArgs e)
    {
        err.InnerHtml = "";
        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {

            if (EventAttendDB.attend_event(eventID, Int32.Parse(myuser.Identity.Name)))
            {
                attend.Visible = false;
                print_attendees();
                err.InnerHtml = "you have been registered to the Event";
                dontAttend.Visible = true;
            }
            else
            {
                err.InnerHtml = "";
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx", true);
    }
    protected void dontAttend_Click(object sender, EventArgs e)
    {
        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {

            if (EventAttendDB.not_attend_event(eventID, Int32.Parse(myuser.Identity.Name)))
            {
                dontAttend.Visible = false;
                print_attendees();
                err.InnerHtml = "You have been Removed from the Attendees list of the Event";
                attend.Visible = true;
            }
            else
            {
                err.InnerHtml = "";
            }

        }
    }
}