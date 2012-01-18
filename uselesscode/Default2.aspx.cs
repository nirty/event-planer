using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void eventName_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string name = eventName.Text;
        DateTime date = Calendar1.SelectedDate.Date;
        int type_id = Int32.Parse(TextBox1.Text);
        string description = eventDescription.Text;
        string location = eventLocation.Text;
        int host = 1;
        DateTime start = System.DateTime.Now;
        DateTime end = System.DateTime.Now;
        int fee = 10;
        EventDB.create_Event(name, type_id, description, date, start, end, fee, location, host);
        

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void eventDescription_TextChanged(object sender, EventArgs e)
    {

    }
    protected void eventLocation_TextChanged(object sender, EventArgs e)
    {

    }
}