<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        You have been successfully Registered.
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Click here to login</asp:HyperLink>
    </div>
    </form>
    <div id="msg" runat="server"></div>


     <form id="form2" runat="server">
    <div>
        Name of the Event:
        <asp:TextBox ID="name" runat="server" Height="25px" Width="200px" 
            ontextchanged="name_TextChanged"></asp:TextBox>
        <br />
        <br />
        Description:&nbsp;
        <asp:TextBox ID="desc" runat="server" Height="95px" Width="257px"></asp:TextBox>
        <br />
        <br />
        Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="loc" runat="server" Height="31px" Width="260px"></asp:TextBox>
        <br />
        <br />
        Fee - int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="fee" runat="server" Height="34px" Width="259px"></asp:TextBox>
        <br />
        <br />
        type - int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="type" runat="server" DataSourceID="getclassification" 
            DataTextField="classification_name" DataValueField="classification_id" 
            Height="18px" onselectedindexchanged="DropDownList1_SelectedIndexChanged1" 
            Width="242px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="getclassification" runat="server" 
            ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>" 
            SelectCommand="SELECT [classification_name], [classification_id] FROM [classification] ORDER BY [classification_name]">
        </asp:SqlDataSource>
        <asp:HiddenField ID="user_id" runat="server" />
        <br />
        <br />
        Date<asp:TextBox ID="date_t" runat="server"></asp:TextBox>
        <asp:Calendar ID="date" runat="server" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            ShowGridLines="True" Width="220px" 
            onselectionchanged="date_SelectionChanged">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <br />
        start&nbsp; 
        Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="start" runat="server" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem Text="0:00"></asp:ListItem>
    <asp:ListItem Text="0:30"></asp:ListItem>
    <asp:ListItem Text="1:00"></asp:ListItem>
    <asp:ListItem Text="1:30"></asp:ListItem>
    <asp:ListItem Text="2:00"></asp:ListItem>
    <asp:ListItem Text="2:30"></asp:ListItem>
    <asp:ListItem Text="3:00"></asp:ListItem>
    <asp:ListItem Text="3:30"></asp:ListItem>
    <asp:ListItem Text="4:00"></asp:ListItem>
    <asp:ListItem Text="4:30"></asp:ListItem>
    <asp:ListItem Text="5:00"></asp:ListItem>
    <asp:ListItem Text="5:30"></asp:ListItem>
    <asp:ListItem Text="6:00"></asp:ListItem>
    <asp:ListItem Text="6:30"></asp:ListItem>
    <asp:ListItem Text="7:00"></asp:ListItem>
    <asp:ListItem Text="7:30"></asp:ListItem>
    <asp:ListItem Text="8:00"></asp:ListItem>
    <asp:ListItem Text="8:30"></asp:ListItem>
    <asp:ListItem Text="9:00"></asp:ListItem>
    <asp:ListItem Text="9:30"></asp:ListItem>
    <asp:ListItem Text="10:00"></asp:ListItem>
    <asp:ListItem Text="10:30"></asp:ListItem>
    <asp:ListItem Text="11:00"></asp:ListItem>
    <asp:ListItem Text="11:30"></asp:ListItem>
    <asp:ListItem Text="12:00"></asp:ListItem>
    <asp:ListItem Text="12:30"></asp:ListItem>
    <asp:ListItem Text="13:00"></asp:ListItem>
    <asp:ListItem Text="13:30"></asp:ListItem>
    <asp:ListItem Text="14:00"></asp:ListItem>
    <asp:ListItem Text="14:30"></asp:ListItem>
    <asp:ListItem Text="15:00"></asp:ListItem>
    <asp:ListItem Text="15:30"></asp:ListItem>
    <asp:ListItem Text="16:00"></asp:ListItem>
    <asp:ListItem Text="16:30"></asp:ListItem>
    <asp:ListItem Text="17:00"></asp:ListItem>
    <asp:ListItem Text="17:30"></asp:ListItem>
    <asp:ListItem Text="18:00"></asp:ListItem>
    <asp:ListItem Text="18:30"></asp:ListItem>
    <asp:ListItem Text="19:00"></asp:ListItem>
    <asp:ListItem Text="19:30"></asp:ListItem>
    <asp:ListItem Text="20:00"></asp:ListItem>
    <asp:ListItem Text="20:30"></asp:ListItem>
    <asp:ListItem Text="21:00"></asp:ListItem>
    <asp:ListItem Text="21:30"></asp:ListItem>
    <asp:ListItem Text="22:00"></asp:ListItem>
    <asp:ListItem Text="22:30"></asp:ListItem>
    <asp:ListItem Text="23:00"></asp:ListItem>
    <asp:ListItem Text="23:30"></asp:ListItem>
    <asp:ListItem Text="23:59"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        End Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <asp:DropDownList ID="end" runat="server" 
            onselectedindexchanged="end_SelectedIndexChanged">
    <asp:ListItem Text="0:00"></asp:ListItem>
    <asp:ListItem Text="0:30"></asp:ListItem>
    <asp:ListItem Text="1:00"></asp:ListItem>
    <asp:ListItem Text="1:30"></asp:ListItem>
    <asp:ListItem Text="2:00"></asp:ListItem>
    <asp:ListItem Text="2:30"></asp:ListItem>
    <asp:ListItem Text="3:00"></asp:ListItem>
    <asp:ListItem Text="3:30"></asp:ListItem>
    <asp:ListItem Text="4:00"></asp:ListItem>
    <asp:ListItem Text="4:30"></asp:ListItem>
    <asp:ListItem Text="5:00"></asp:ListItem>
    <asp:ListItem Text="5:30"></asp:ListItem>
    <asp:ListItem Text="6:00"></asp:ListItem>
    <asp:ListItem Text="6:30"></asp:ListItem>
    <asp:ListItem Text="7:00"></asp:ListItem>
    <asp:ListItem Text="7:30"></asp:ListItem>
    <asp:ListItem Text="8:00"></asp:ListItem>
    <asp:ListItem Text="8:30"></asp:ListItem>
    <asp:ListItem Text="9:00"></asp:ListItem>
    <asp:ListItem Text="9:30"></asp:ListItem>
    <asp:ListItem Text="10:00"></asp:ListItem>
    <asp:ListItem Text="10:30"></asp:ListItem>
    <asp:ListItem Text="11:00"></asp:ListItem>
    <asp:ListItem Text="11:30"></asp:ListItem>
    <asp:ListItem Text="12:00"></asp:ListItem>
    <asp:ListItem Text="12:30"></asp:ListItem>
    <asp:ListItem Text="13:00"></asp:ListItem>
    <asp:ListItem Text="13:30"></asp:ListItem>
    <asp:ListItem Text="14:00"></asp:ListItem>
    <asp:ListItem Text="14:30"></asp:ListItem>
    <asp:ListItem Text="15:00"></asp:ListItem>
    <asp:ListItem Text="15:30"></asp:ListItem>
    <asp:ListItem Text="16:00"></asp:ListItem>
    <asp:ListItem Text="16:30"></asp:ListItem>
    <asp:ListItem Text="17:00"></asp:ListItem>
    <asp:ListItem Text="17:30"></asp:ListItem>
    <asp:ListItem Text="18:00"></asp:ListItem>
    <asp:ListItem Text="18:30"></asp:ListItem>
    <asp:ListItem Text="19:00"></asp:ListItem>
    <asp:ListItem Text="19:30"></asp:ListItem>
    <asp:ListItem Text="20:00"></asp:ListItem>
    <asp:ListItem Text="20:30"></asp:ListItem>
    <asp:ListItem Text="21:00"></asp:ListItem>
    <asp:ListItem Text="21:30"></asp:ListItem>
    <asp:ListItem Text="22:00"></asp:ListItem>
    <asp:ListItem Text="22:30"></asp:ListItem>
    <asp:ListItem Text="23:00"></asp:ListItem>
    <asp:ListItem Text="23:30"></asp:ListItem>
    <asp:ListItem Text="23:59"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" postbackurl="createEventH.ashx" Text="Button" />
        <br />
        
    </div>
    </form>
</body>
</html>
