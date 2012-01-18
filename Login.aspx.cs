using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    string cur_user;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (YourValidationFunction(Login1.UserName, Login1.Password))
        {
            if (Request.QueryString["ReturnUrl"] != null)
            {
                FormsAuthentication.SetAuthCookie(cur_user, false);
                FormsAuthentication.RedirectFromLoginPage(cur_user, false);
            }
            else
            {
                FormsAuthentication.SetAuthCookie(cur_user, false);
                Response.Redirect("home.aspx");
            }
        }
        else
        {
            e.Authenticated = false;
        }
    }

    protected void Login1_LoginError(object sender, EventArgs e)
    {
        if (ViewState["LoginErrors"] == null)
            ViewState["LoginErrors"] = 0;

        int ErrorCount = (int)ViewState["LoginErrors"] + 1;
        ViewState["LoginErrors"] = ErrorCount;

        if ((ErrorCount > 3) && (Login1.PasswordRecoveryUrl != string.Empty))
            Response.Redirect(Login1.PasswordRecoveryUrl);
    }

    private bool YourValidationFunction(string UserName, string Password)
    {
        bool boolReturnValue = false;
        string strConnection = ConfigurationManager.ConnectionStrings["event_con"].ConnectionString;
        SqlConnection sqlConnection = new SqlConnection(strConnection);
        String SQLQuery = "SELECT userid, username, password FROM users";
        SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
        SqlDataReader Dr;
        sqlConnection.Open();
        Dr = command.ExecuteReader();

        
        while (Dr.Read())
        {     
            
            if ((UserName == Dr["username"].ToString()) & (Password == Dr["password"].ToString()))
            {
                boolReturnValue = true;
                cur_user = Dr["userid"].ToString();
                Dr.Close();
                return boolReturnValue;
            }
           
        }
        return boolReturnValue;
    }
}