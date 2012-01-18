<%@ Page Language="C#" AutoEventWireup="true" CodeFile="displayEvent.aspx.cs" Inherits="displayEvent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #home
        {
            float:left;
            width: 319px;
        }
        #signout
        {
            float:right;
            margin-left: 535px;
        }
    </style>
</head>
<body>
    <div id="heading" align="center">
        <asp:Label ID="Label1" runat="server" Text="Event Details" Font-Bold="True" 
            Font-Names="Trebuchet MS" Font-Size="XX-Large" ForeColor="#FF9933"></asp:Label></div>
   
    <form id="Form1" runat="server">
    <div id="home" ><a href="home.aspx">Back to List of Events</a></div><div id="signout" align="right"> <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Sign Out" /></div>
   
    
   
   &nbsp;<div id="err" runat="server"></div>
   <hr />
   <h1>Event Details:</h1> 
    <div id="event_name" runat="server"></div>
    <div id="event_type" runat="server"></div>
    <div id="event_desc" runat="server"></div>
    <div id="event_date" runat="server"></div>
    <div id="event_start" runat="server"></div>
    <div id="event_end" runat="server"></div>
     <div id="event_location" runat="server"></div>
    <div id="event_fee" runat="server"></div>
    <div id="event_school" runat="server"></div>
    <div id="event_univ" runat="server"></div>
    <br />
     <hr />
   <h1>Users Attending the Event:</h1> 

    <div id= "attendees_list" runat="server"></div>
   <hr />
    <br /><asp:Button ID="attend" runat="server" Text="Attend the Event" 
        onclick="attend_Click" />
        <br />
    <asp:Button ID="dontAttend" runat="server" onclick="dontAttend_Click" 
        Text="Not Attending " Visible="False" Width="145px" />
        </form>
</body>
</html>
