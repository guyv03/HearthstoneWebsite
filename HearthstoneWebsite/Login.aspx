<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        table,select,input{
            font-size: 40px
        }
        input,select{
            border-width: 3px
        }
        input{
            border-radius: 10px;
        }
        td{
            font-size: 50px
        }
        body {
            background-image: url('Images/thumb-1920-555058.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <center>
        <ul>
            <li> <a href="Main.aspx"> <i class="fa fa-fw fa-home"> </i> Main </a> </li>
            <li style="float:right"> <a href="Register.aspx"> <i class="fa fa-fw fa-user-plus"> </i> Register </a> </li>
            <li style="float:right"> <a href="Login.aspx" class="active"> <i class="fa fa-fw fa-sign-in"> </i> Login </a> </li>
            <li style="float:right"> <a> <font color="red"> <%=str %> </font> </a> </li>
        </ul>
        <br /><br /><br /><br /><br /><br /><br /><br />
        <form method="post">
            <table style="background-color: rgba(255, 255, 255, 0.6)">
                <tr>
                    <td width="600" height="80">
                        <input id="name" type="text" name="name" placeholder="Username" style="margin-left: 55px ; margin-top: 40px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="password" name="password" type="password" placeholder="Password" style="margin-left: 55px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="font-size: 25px ; margin-left: 55px ; margin-top: 10px">
                            Don't have an account yet? Register 
                            <a href="Register.aspx">
                                Here
                            </a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" height="90">
                        <input style="border-width: 2px ; margin-left:25%" type="submit" value="Login" name="submit" />
                        <input style="border-width: 2px ; margin-left:10%" type="reset" value="Reset" name="reset" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
