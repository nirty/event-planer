using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (Password1.Text == Password2.Text && Password1.Text != null && Password2.Text != null && Password1.Text != "" && Password2.Text != "")
        {
            if (uname.Text == null || uname.Text == "" || fname.Text == null || fname.Text == "" || lname.Text == null || lname.Text == "")
            {

                msg.InnerHtml = "please fill in Required Fields";
            }
            else
            {
                submit.PostBackUrl = "createUserH.ashx";
               // Server.Transfer("createUserH.ashx");
            }
        }
        else
        {
            Password1.Text = null;
            Password2.Text = null;
            msg.InnerHtml = "Passwords Mismatch";
        }
    }
}