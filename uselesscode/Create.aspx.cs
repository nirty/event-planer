using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Create : System.Web.UI.Page
{
    String nameText = "Enter Event Name";
    String descriptionText = "Enter Event Description";
    String locationText = "Enter Event Location";
    String feeText = "Fee";

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void createButton_Click(object sender, EventArgs e)
    {
        /*string strScript = "<script language=JavaScript>alert('Event Created')</script>";
        if (!(this.IsStartupScriptRegistered("alertKey")))
            this.RegisterStartupScript("alertKey", strScript);*/
        eventDescription.Text = EventList.testing();
    }
    protected void clearButton_Click(object sender, EventArgs e)
    {
        eventDescription.Text = descriptionText;
        eventName.Text = nameText;
        eventLocation.Text = locationText;
        eventFee.Text = feeText;
    }
    protected void cancelButton_Click(object sender, EventArgs e)
    {

    }
}