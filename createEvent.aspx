<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createEvent.aspx.cs" Inherits="createEvent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <style type="text/css">
        .style6
        {
            width: 525px;
            height: 586px;
        }
        .style11
        {
            height: 59px;
        }
        .style19
        {
            height: 83px;
            width: 149px;
        }
        .style20
        {
            height: 83px;
            width: 125px;
        }
        .style21
        {
            height: 34px;
            width: 125px;
        }
        .style22
        {
            height: 34px;
            width: 149px;
        }
        .style25
        {
            height: 31px;
            width: 125px;
        }
        .style26
        {
            height: 31px;
            width: 149px;
        }
        .style27
        {
            height: 17px;
            width: 125px;
        }
        .style28
        {
            height: 17px;
            width: 149px;
        }
        .style29
        {
            height: 22px;
            width: 125px;
        }
        .style30
        {
            height: 22px;
            width: 149px;
        }
        .style31
        {
            height: 29px;
            }
        .style32
        {
            height: 29px;
            width: 149px;
        }
        .style34
        {
            height: 39px;
            width: 149px;
        }
        .style35
        {
            height: 39px;
            width: 125px;
        }
        .style36
        {
            height: 43px;
            width: 125px;
        }
        .style37
        {
            height: 43px;
            width: 149px;
        }
    </style>
   
</head>
<body>   

    <div align="center">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                ForeColor="#FF6600" Text="Create a New Event!"></asp:Label>
        </div>
    <hr /> 
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/home.aspx">Back to Home Page</asp:HyperLink>
<div id="table" align="center">
        
    
    <form id="form1" runat="server">
    <table class="style6">
        <tr>
            <td class="style21" align="left">
                Name of the Event*</td>
            <td class="style22">
            <asp:TextBox ID="name" runat="server" Height="31px" Width="260px" 
            ontextchanged="name_TextChanged" style="margin-left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style21" align="left">
                Description</td>
            <td class="style22">
                
            <asp:TextBox ID="desc" runat="server" Height="38px" Width="260px" 
                    style="margin-left: 0px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style25" align="left">
              
                Location</td>
            <td class="style26">
                <asp:TextBox ID="loc" runat="server" Height="31px" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style27" align="left">
                Fee (in $)</td>
            <td class="style28">
        <asp:TextBox ID="fee" runat="server" Height="31px" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36" align="left">
                Event
                Type</td>
            <td class="style37">
        <asp:DropDownList ID="type" runat="server" DataSourceID="getclassification" 
            DataTextField="classification_name" DataValueField="classification_id" 
            Height="35px" onselectedindexchanged="DropDownList1_SelectedIndexChanged1" 
            Width="260px">
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style35" align="left">
        Date</td>
            <td class="style34">
                <asp:TextBox ID="date_t" runat="server" Height="31px" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style20" align="left">
                </td>
            <td class="style19">
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
            </td>
        </tr>
        <tr>
            <td class="style29" align="left">
                StartTime</td>
            <td class="style30">
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
            </td>
        </tr>
        <tr>
            <td class="style31" align="left">
                End Time</td>
            <td class="style32">
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
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
        <asp:Button ID="Button1" runat="server" postbackurl="createEventH.ashx" Text="Register" 
                    Height="33px" Width="118px" />
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                *Required Fields</td>
        </tr>
        <tr>
            <td class="style11" colspan="2" align="center">
                <div>
        <asp:SqlDataSource ID="getclassification" runat="server" 
            ConnectionString="<%$ ConnectionStrings:User23ConnectionString %>" 
            SelectCommand="SELECT [classification_name], [classification_id] FROM [classification] ORDER BY [classification_name]">
        </asp:SqlDataSource>
        <asp:HiddenField ID="user_id" runat="server" />
                </div>
            </td>
        </tr>
    </table>

    
        </form>
        </div>
</body>
</html>
