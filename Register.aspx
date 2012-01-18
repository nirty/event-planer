<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Password1
        {
            height: 29px;
            width: 209px;
        }
        #Password2
        {
            height: 29px;
            width: 209px;
        }
        .style2
        {
            height: 468px;
            width: 481px;
        }
        #Submit1
        {
            height: 36px;
            width: 116px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="height: 556px">
    
        <div align="center">
            <asp:Label ID="Label1" runat="server" Text="Create a New User" Font-Bold="True" 
                Font-Size="XX-Large" ForeColor="#FF6600"></asp:Label>
            </div>
        <hr />
        <br />
        <br />
        <table class="style2">
            <tr>
                <td> User Name*</td>                
                 <td> <asp:TextBox ID="uname" runat="server" Height="29px" Width="209px"></asp:TextBox></td>
            </tr>
            <tr>
                
                    <td>Password*</td>
                
        <td><asp:TextBox id="Password1" TextMode="password" runat="server" /></td>
            </tr>
            <tr>
                <td>
        Confirm Password*</td>
                <td>
        <asp:TextBox id="Password2" TextMode="password" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    First Name&nbsp;*&nbsp;</td>
                <td>
        <asp:TextBox ID="fname" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name*&nbsp;&nbsp;</td>
                <td>
        <asp:TextBox ID="lname" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    E-mail&nbsp;&nbsp;&nbsp;</td>
                <td>
        <asp:TextBox ID="email" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone</td>
                <td>
        <asp:TextBox ID="phone" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Degree Level</td>
                <td>
                    <asp:TextBox ID="level" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    School&nbsp;&nbsp;&nbsp;</td>
                <td>
        <asp:TextBox ID="school" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    University&nbsp;&nbsp;</td>
                <td>
        <asp:TextBox ID="univ" runat="server" Height="29px" Width="209px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="2" align="center">
                    <asp:Button ID="submit" runat="server" Height="34px" onclick="submit_Click" 
                        Text="submit" Width="111px" />
                </td>
            </tr>
            <tr>
                <td class="style6" colspan="2" align="right">
                   <div id="red">*Required Fields</div> </td>
            </tr>
        </table>
        <br />
        
        &nbsp;&nbsp;
&nbsp;<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        <br />
        &nbsp;<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    </div>
    
    </form>
   <div id="msg" runat="server"></div> 
</body>
</html>
