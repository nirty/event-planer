<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="testpageload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <title></title>
    <link rel="stylesheet" href="appCss/test.css"/>    
    <script type="text/javascript" src="appScripts/test.js"></script>
    <script type="text/javascript" src="appScripts/home.js"></script>
    <style type="text/css" id="searchbut">
        #Text1
        {
            height: 26px;
            width: 217px;
        }
        #Button1
        {
            height: 27px;
            width: 79px;
        }
        #searchbut
        {
            height: 29px;
            width: 64px;
        }
        #user
        {
            float:left;
            width: 165px;
        }
        #signoutbtn
        {
            float:right;
            margin-left: 564px;
        }

    </style>
</head>
<body>  
    <div id="heading" align="center">
        <asp:Label ID="Label1" runat="server" Text="Welcome to Event Planner!" 
            Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="XX-Large" 
            ForeColor="#FF9900"></asp:Label>
    </div>
    <div id="user" runat="server" align="left"></div>
    <form id="form1" runat="server">
    
    <div id="signoutbtn" align="right">
        <asp:Button ID="signout" runat="server" onclick="signout_Click" 
            Text="Sign Out" Visible="False" />
    </div>
    <br />
    <div style="width: 81px">
        <asp:Button ID="Button1" runat="server" Text="Sign in" />
    </div>
    <br />
    <hr />
    <h3 align="center">Search Events</h3>
    <asp:Label ID="keyword_label" runat="server" Text="name or description contains"></asp:Label><br />
    <asp:TextBox ID="keyword" runat="server"></asp:TextBox><br />
    <asp:Label ID="university_label" runat="server" Text="university name contains"></asp:Label><br />
    <asp:TextBox ID="university" runat="server"></asp:TextBox><br />
    <asp:Label ID="date_label" runat="server" Text="date"></asp:Label><br />
    <asp:TextBox ID="date" runat="server"></asp:TextBox><br />
    <asp:Label ID="category_label" runat="server" Text="category"></asp:Label><br />
    <asp:SqlDataSource ID="classification" runat="server" 
        ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>" 
        SelectCommand="SELECT [classification_id], [classification_name] FROM [classification]">
    </asp:SqlDataSource>
    <asp:DropDownList
        ID="category" 
        runat="server"
        DataSourceID="classification" 
        DataTextField="classification_name" 
        DataValueField="classification_id">
    </asp:DropDownList><br />
    <asp:Button ID="search_button" runat="server" Text="search" 
        OnClientClick="return home_scripts.search_click()" Height="31px" 
        Width="121px"/>
    <br />
    <asp:Button ID="clear_button" runat="server" Text="clear search" 
        PostBackUrl="~/home.aspx" onclick="clear_button_Click"/>
    <br /><br />
    <div id="test">
        <hr size="2" noshade="noshade" />
    </div>
    

    <%--<div id="divlist" runat="server"></div>--%> 
    <asp:SqlDataSource ID="events" runat="server" 
        ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>" 
        SelectCommand="get_allevents" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:Repeater ID="events_repeater" runat="server" DataSourceID="events">
    <HeaderTemplate>
    <table id="events_table">
        <tr>
            <th>event name</th>
            <th>description</th>
            <th>date</th>
            <th>start time</th>
            <th>end time</th>
            <th>university</th>
            <th>category</th>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr id='<%#Eval("id") %>'>
            <td><a href="http://palmer-vm.seas.upenn.edu/User23/EventProject/displayEvent.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a></td>
            <td><%#Eval("description") %></td>
            <td><%#Eval("date") %></td>
            <td><%#Eval("start_time") %></td>
            <td><%#Eval("end_time") %></td>
            <td><%#Eval("university") %></td>
            <td><%#Eval("typename") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    </form>
    <hr />
    </body>

</html>
