using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        IPrincipal myuser = this.User;
        if (myuser.Identity.IsAuthenticated)
        {            
            User cur_user = UserDB.get_user(Int32.Parse(myuser.Identity.Name));
            un.InnerHtml = "User Name       :" + cur_user.Username;
            fn.InnerHtml = "First Name      :" + cur_user.Firstname;
            ln.InnerHtml = "Last Name       :" + cur_user.Lastname;
            ph.InnerHtml = "Phone Number    :" + cur_user.Phone;
            em.InnerHtml = "Email           :" + cur_user.Email;
            sh.InnerHtml = "School          :" + cur_user.School;
            uv.InnerHtml = "University      :" + cur_user.Univ;
        }


      
    }
}