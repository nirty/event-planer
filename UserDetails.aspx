<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <div id="heading" align="center">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                ForeColor="#FF6600" Text="User Details Page"></asp:Label>
        </div>
         


    </div>
    <div id="home" ><a href="home.aspx">Back to List of Events</a></div>
    <hr />
    <div id = "table">
        <table style="width: 100%;" align="center">
            <tr>
                <td align="center">
                    <div id="fn" runat="server"></div>
                </td>
            </tr>
            <tr>
                <td align="center">
                   <div id="ln" runat="server"></div>
                </td>
            </tr>
            <tr>
                <td align="center">
                   <div id="ph" runat="server"></div>
                </td>
            </tr>
            <tr>
                <td align="center">
                   <div id="em" runat="server"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <div id="sh" runat="server"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <div id="lv" runat="server"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <div id="uv" runat="server"></div></td>
            </tr>
            <tr>
                <td align="center">
    <div id="un" runat="server">
       
        </div>


                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
