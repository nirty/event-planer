<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="testpageload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <title></title>
    <link rel="stylesheet" href="appCss/home.css" />
    <script type="text/javascript" src="appScripts/test.js"></script>
    <script type="text/javascript" src="appScripts/home.js"></script>
    <style type="text/css">
        #createEvent
        {
            width: 109px;
        }
        .floatRight
        {
            float: right;
        }
        .style1
        {
            width: 765px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="heading" align="center">
        <asp:Label ID="Label1" runat="server" Text="Welcome to Event Planner!" Font-Bold="True"
            Font-Size="XX-Large" ForeColor="#FF9900"></asp:Label>
    </div>
    <div id="user" runat="server" align="left" 
        style="font-family: 'Trebuchet MS'; font-size: medium; font-weight: bold; font-style: italic; color: #FF0000; float: left;">
    </div>
    <div class="floatRight">
      <div style="width: 81px">
        <asp:Button ID="signin" runat="server" Text="Sign in / Register" Width="151px" Height="26px"
              OnClick="signin_Click" Font-Size="Small" />
    </div>
   
    <div style="width: 81px">
        <asp:Button ID="signout" runat="server" Text="Signout" Width="151px" Height="26px"
            OnClick="signout_Click" style="margin-bottom: 6px" />
    </div>
    <asp:Button ID="Button1" runat="server" Text="Create Event" 
        onclick="Button1_Click" Width="151px" Height="26px" />
    </div>
    <br />
    <br />
  <br /><br />
  
  <hr /> 
    
    <h3 align="center" style="font-size: medium">Search Events</h3>
    <table>
        <tr>
            <td class="style1">
                <asp:Label ID="keyword_label" runat="server" Text="name or description contains">
                </asp:Label>
                <asp:TextBox ID="keyword" runat="server" Style="margin-left: 0px"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Label ID="university_label" runat="server" Text="university name contains">
                </asp:Label>
                <asp:TextBox ID="university" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Label ID="date_label" runat="server" Text="date"></asp:Label>
                <asp:TextBox ID="date" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Label ID="category_label" runat="server" Text="category"></asp:Label>
                <asp:DropDownList ID="category" runat="server" DataSourceID="classification" DataTextField="classification_name"
                    DataValueField="classification_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
        <tr>
            <td class="style1" align="center" colspan="4">
                <asp:Button ID="search_button" runat="server" Text="search" OnClientClick="return home_scripts.search_click()"
                    Height="31px" Width="105px" style="margin-left: 0px" />
                <asp:Button ID="clear_button" runat="server" Text="clear search" PostBackUrl="~/home.aspx"
                    OnClick="clear_button_Click" Height="31px" />
            </td>
        </tr>
    </table>
    

    <asp:SqlDataSource ID="classification" runat="server" ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>"
        SelectCommand="SELECT [classification_id], [classification_name] FROM [classification]
                        UNION SELECT NULL as classification_id, '(none chosen)' as 
                        classification_name"></asp:SqlDataSource>
    <div id="test">
        <hr size="2" noshade="noshade" />
    </div>
   <div id="divlist" runat="server"></div>
  <asp:SqlDataSource ID="events" runat="server" ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>"
        SelectCommand="get_allevents" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:Repeater ID="events_repeater" runat="server" DataSourceID="events">
     <HeaderTemplate>
            <table id="events_table">
                <tr>
                    <th>
                        event name
                    </th>
                    <th>
                        description
                    </th>
                    <th>
                        date
                    </th>
                    <th>
                        start time
                    </th>
                    <th>
                        end time
                    </th>
                    <th>
                        university
                    </th>
                    <th>
                        category
                    </th>
                    <th>
                        Host Name
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr id='<%#Eval("id") %>'>
                <td>
                    <a href="http://palmer-vm.seas.upenn.edu/User23/EventProject/displayEvent.aspx?id=<%#Eval("id") %>">
                        <%#Eval("name") %></a>
                </td>
                <td>
                    <%#Eval("description") %>
                </td>
                <td>
                    <%#Eval("date") %>
                </td>
                <td>
                    <%#Eval("start_time") %>
                </td>
                <td>
                    <%#Eval("end_time") %>
                </td>
                <td>
                    <%#Eval("university") %>
                </td>
                <td>
                    <%#Eval("typename") %>
                </td>
                <td>
                    <a href="http://palmer-vm.seas.upenn.edu/User23/EventProject/UserDetails.aspx?id=<%#Eval("host_id") %>">
                        <%#Eval("host_uname")%></a>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="alternating" id='<%#Eval("id") %>'>
                <td>
                    <a href="http://palmer-vm.seas.upenn.edu/User23/EventProject/displayEvent.aspx?id=<%#Eval("id") %>">
                        <%#Eval("name") %></a>
                </td>
                <td>
                    <%#Eval("description") %>
                </td>
                <td>
                    <%#Eval("date") %>
                </td>
                <td>
                    <%#Eval("start_time") %>
                </td>
                <td>
                    <%#Eval("end_time") %>
                </td>
                <td>
                    <%#Eval("university") %>
                </td>
                <td>
                    <%#Eval("typename") %>
                </td>
                <td>
                    <a href="http://palmer-vm.seas.upenn.edu/User23/EventProject/UserDetails.aspx?id=<%#Eval("host_id") %>">
                        <%#Eval("host_uname")%></a>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    </form>
</body>
</html>
