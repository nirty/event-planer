<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="getalEvents" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString-palmer %>" 
            SelectCommand="SELECT * FROM [events]"></asp:SqlDataSource>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="getalEvents" EnableModelValidation="True" 
        ConvertEmptyStringToNull="False">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                </td>
                <td>
                    <asp:Label ID="start_timeLabel" runat="server" 
                        Text='<%# Eval("start_time") %>' />
                </td>
                <td>
                    <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                </td>
                <td>
                    <asp:Label ID="feeLabel" runat="server" Text='<%# Eval("fee") %>' />
                </td>
                <td>
                    <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                </td>
                <td>
                    <asp:Label ID="host_idLabel" runat="server" Text='<%# Eval("host_id") %>' />
                </td>
                <td>
                    <asp:Label ID="universityLabel" runat="server" 
                        Text='<%# Eval("university") %>' />
                </td>
                <td>
                    <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                </td>
                <td>
                    <asp:Label ID="x_posLabel" runat="server" Text='<%# Eval("x_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="y_posLabel" runat="server" Text='<%# Eval("y_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="type_idTextBox" runat="server" Text='<%# Bind("type_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="start_timeTextBox" runat="server" 
                        Text='<%# Bind("start_time") %>' />
                </td>
                <td>
                    <asp:TextBox ID="end_timeTextBox" runat="server" 
                        Text='<%# Bind("end_time") %>' />
                </td>
                <td>
                    <asp:TextBox ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                </td>
                <td>
                    <asp:TextBox ID="locationTextBox" runat="server" 
                        Text='<%# Bind("location") %>' />
                </td>
                <td>
                    <asp:TextBox ID="host_idTextBox" runat="server" Text='<%# Bind("host_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="universityTextBox" runat="server" 
                        Text='<%# Bind("university") %>' />
                </td>
                <td>
                    <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                </td>
                <td>
                    <asp:TextBox ID="x_posTextBox" runat="server" Text='<%# Bind("x_pos") %>' />
                </td>
                <td>
                    <asp:TextBox ID="y_posTextBox" runat="server" Text='<%# Bind("y_pos") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="type_idTextBox" runat="server" Text='<%# Bind("type_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                </td>
                <td>
                    <asp:TextBox ID="start_timeTextBox" runat="server" 
                        Text='<%# Bind("start_time") %>' />
                </td>
                <td>
                    <asp:TextBox ID="end_timeTextBox" runat="server" 
                        Text='<%# Bind("end_time") %>' />
                </td>
                <td>
                    <asp:TextBox ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                </td>
                <td>
                    <asp:TextBox ID="locationTextBox" runat="server" 
                        Text='<%# Bind("location") %>' />
                </td>
                <td>
                    <asp:TextBox ID="host_idTextBox" runat="server" Text='<%# Bind("host_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="universityTextBox" runat="server" 
                        Text='<%# Bind("university") %>' />
                </td>
                <td>
                    <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                </td>
                <td>
                    <asp:TextBox ID="x_posTextBox" runat="server" Text='<%# Bind("x_pos") %>' />
                </td>
                <td>
                    <asp:TextBox ID="y_posTextBox" runat="server" Text='<%# Bind("y_pos") %>' />
                </td>
                <td>
                    <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                </td>
                <td>
                    <asp:Label ID="start_timeLabel" runat="server" 
                        Text='<%# Eval("start_time") %>' />
                </td>
                <td>
                    <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                </td>
                <td>
                    <asp:Label ID="feeLabel" runat="server" Text='<%# Eval("fee") %>' />
                </td>
                <td>
                    <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                </td>
                <td>
                    <asp:Label ID="host_idLabel" runat="server" Text='<%# Eval("host_id") %>' />
                </td>
                <td>
                    <asp:Label ID="universityLabel" runat="server" 
                        Text='<%# Eval("university") %>' />
                </td>
                <td>
                    <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                </td>
                <td>
                    <asp:Label ID="x_posLabel" runat="server" Text='<%# Eval("x_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="y_posLabel" runat="server" Text='<%# Eval("y_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">
                                    id</th>
                                <th runat="server">
                                    name</th>
                                <th runat="server">
                                    type_id</th>
                                <th runat="server">
                                    description</th>
                                <th runat="server">
                                    date</th>
                                <th runat="server">
                                    start_time</th>
                                <th runat="server">
                                    end_time</th>
                                <th runat="server">
                                    fee</th>
                                <th runat="server">
                                    location</th>
                                <th runat="server">
                                    host_id</th>
                                <th runat="server">
                                    university</th>
                                <th runat="server">
                                    school</th>
                                <th runat="server">
                                    x_pos</th>
                                <th runat="server">
                                    y_pos</th>
                                <th runat="server">
                                    tags</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="type_idLabel" runat="server" Text='<%# Eval("type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                </td>
                <td>
                    <asp:Label ID="start_timeLabel" runat="server" 
                        Text='<%# Eval("start_time") %>' />
                </td>
                <td>
                    <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                </td>
                <td>
                    <asp:Label ID="feeLabel" runat="server" Text='<%# Eval("fee") %>' />
                </td>
                <td>
                    <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                </td>
                <td>
                    <asp:Label ID="host_idLabel" runat="server" Text='<%# Eval("host_id") %>' />
                </td>
                <td>
                    <asp:Label ID="universityLabel" runat="server" 
                        Text='<%# Eval("university") %>' />
                </td>
                <td>
                    <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                </td>
                <td>
                    <asp:Label ID="x_posLabel" runat="server" Text='<%# Eval("x_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="y_posLabel" runat="server" Text='<%# Eval("y_pos") %>' />
                </td>
                <td>
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    </form>
</body>
</html>
