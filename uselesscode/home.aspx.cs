using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Principal;

public partial class testpageload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {
            User cur_user = UserDB.get_user(Int32.Parse(myuser.Identity.Name));
            user.InnerHtml = "hello " + cur_user.Username;
            signout.Visible = true;
        }
       
    }
    protected void SignoutButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx", true);

    }
    protected void clear_button_Click(object sender, EventArgs e)
    {
        keyword.Text = "";
        university.Text = "";
        date.Text = "";
    }
    protected void signout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx", true);

    }
}