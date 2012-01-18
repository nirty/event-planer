<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="appCss/home.css"/>
    <style type="text/css">
     div.centered{
    display:block;

    /*set the div in the center of the screen*/
    position:absolute;
    top:37%;
    left:35%;
    width:350px;
  }
    </style>
</head>
<body>
 <div id="login" class="centered">
    <form id="form1" runat="server">
    
    
    
    <asp:Label ID="messageLabel" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Login ID="Login1" runat="server" CssClass="LoginControl"
     onauthenticate="Login1_Authenticate" CreateUserText="Register as a New User" 
        CreateUserUrl="~/Register.aspx" Height="215px" Width="324px">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                   <h3>Log In</h3> </td><br />
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                        Font-Size="Small">User Name:</asp:Label>
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Height="27px" Width="191px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr>
                            <br />
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                        Font-Size="Small">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Height="28px" 
                                        Width="192px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                        ValidationGroup="Login1" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Register.aspx">Register as a New User</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    </form>
   </div>
</body>
</html>
