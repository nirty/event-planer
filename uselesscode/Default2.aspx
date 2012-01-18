<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
   </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
    </div>
    <p>
    
        <asp:Label ID="label" runat="server" Text="Create a New Event"></asp:Label>
        </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="eventName" runat="server" Width="500px" 
            ontextchanged="eventName_TextChanged">Enter Event Name</asp:TextBox>
        </p>
    <p>
        <asp:TextBox ID="eventDescription" runat="server" Height="100px" 
            TextMode="MultiLine" Width="500px" 
            ontextchanged="eventDescription_TextChanged">Enter Event Description</asp:TextBox>
        </p>
    <p>
        <asp:TextBox ID="eventLocation" runat="server" Width="500px" 
            ontextchanged="eventLocation_TextChanged">Enter Event Location</asp:TextBox>
    
        </p>
    <p>
        <asp:TextBox ID="eventFee" runat="server" Width="77px">Fee</asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged">type</asp:TextBox>
    </p>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
        Text="Button" />
    <asp:Calendar ID="Calendar1" runat="server" 
        onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
</form>
</body>
</html>
