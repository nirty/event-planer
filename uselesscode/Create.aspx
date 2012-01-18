<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="label" runat="server" Text="Create a New Event"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="eventName" runat="server" Width="500px" 
            ontextchanged="eventName_TextChanged">Enter Event Name</asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="eventDescription" runat="server" Height="100px" 
            TextMode="MultiLine" Width="500px">Enter Event Description</asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="eventLocation" runat="server" Width="500px">Enter Event Location</asp:TextBox>
    
        <br />
        <br />
        <asp:TextBox ID="eventFee" runat="server" Width="77px">Fee</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="createButton" runat="server" Text="Create" onclick="createButton_Click"/>
        &nbsp;<asp:Button ID="clearButton" runat="server" onclick="clearButton_Click" 
            Text="Clear" />
        &nbsp;<asp:Button ID="cancelButton" runat="server" onclick="cancelButton_Click" 
            Text="Cancel" Height="26px" />
    
    </div>
    </form>
</body>
</html>
