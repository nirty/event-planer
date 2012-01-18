using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://wren.cis.upenn.edu/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Attending : System.Web.Services.WebService
{
    public Attending()
    {

    }

    [WebMethod(Description = "Returns list of attendees for event given")]
    public string People(int eventID)
    {
        List<User> attendees = new List<User>();
        attendees = EventAttendDB.get_Attendees(eventID);
        string output = "";
        for(int i = 0; i < attendees.Count; i++)
        {
            output += attendees.ElementAt(i).Userid + "=" + attendees.ElementAt(i).Firstname + " " + attendees.ElementAt(i).Lastname + ";";
        }
        return output;
    }

}