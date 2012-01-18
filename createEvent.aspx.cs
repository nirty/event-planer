using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

public partial class createEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {
            user_id.Value = myuser.Identity.Name;
        }
    }
    protected void date_SelectionChanged(object sender, EventArgs e)
    {
        date_t.Text = date.SelectedDate.ToString();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void end_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void name_TextChanged(object sender, EventArgs e)
    {

    }

    protected void load_values()
    {
        
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}