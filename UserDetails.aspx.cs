using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string id_s = Request.Params.Get("id");
        int id = 1;
        if (id_s != null && id_s != "")
        {
            
            User cur_user = UserDB.get_user(Int32.Parse(id_s));
           
                if(cur_user.Username != null)
                    un.InnerHtml = "User Name       :" + cur_user.Username;
                if(cur_user.Firstname != null)
                    fn.InnerHtml = "First Name      :" + cur_user.Firstname;
                if(cur_user.Lastname != null)
                    ln.InnerHtml = "Last Name       :" + cur_user.Lastname;
                if (cur_user.Phone != null)
                     ph.InnerHtml = "Phone Number    :" + cur_user.Phone;
                if (cur_user.Email != null)
                     em.InnerHtml = "Email           :" + cur_user.Email;
                if (cur_user.School != null)
                     sh.InnerHtml = "School          :" + cur_user.School;
                if (cur_user.Univ != null)
                     uv.InnerHtml = "University      :" + cur_user.Univ;
          

        }
        else
        {
            //err.InnerHtml = "<h1> Parameter Missing </h1>";
        }
    }
}