<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        table,select,input{
            font-size: 30px
        }
        input,select{
            border-width: 3px
        }
        td{
            font-size: 30px
        }
        body {
            background-image: url('Images/872773-free-hearthstone-wallpapers-1920x1080.jpg');
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
            <%
                if (Session["user"] == null)
                {
                    Response.Write("<li style='float:right'> <a href='Login.aspx'> <i class='fa fa-fw fa-sign-in'> </i> Login </a> </li>");
                }
                else
                {
                    Response.Write("<li style='float:right'> <a href='Logout.aspx'> <i class='fa fa-fw fa-sign-out'> </i> Logout </a> </li>");
                    string user_name = Session["user"].ToString();
                    if (Session["user"].ToString() == "admin" || Session["user"].ToString() == "Admin")
                    {
                        Response.Write("<li style='float:right'> <a href='Admin.aspx' class='active'>" + "Hello " + user_name + "!" + "</a> </li>");
                    }
                    else
                    {
                        Response.Write("<li style='float:right'> <a>" + "Hello " + user_name + "!" + "</a> </li>");
                    }
                    Response.Write("<li> <a href='Gallery.aspx'> <i class='fa fa-fw fa-image'> </i> Gallery </a> </li>");
                    Response.Write("<li> <a href='Board.aspx'> <i class='fa fa-fw fa-commenting'> </i> Board </a> </li>");
                    Response.Write("<li> <a href='User.aspx'> <i class='fa fa-fw fa-user'> </i> User </a> </li>");
                }
                 %>
        </ul>
        <%
            if (Session["user"] == null)
            {
                Response.Write("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
                Response.Write("<b><font style='font-size:100px ; color:red'>" + "This page is only for the ADMIN" + "</font></b>");
                Response.End();
            }

            else if (Session["user"].ToString() != "admin" && Session["user"].ToString() != "Admin")
            {
                Response.Write("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
                Response.Write("<b><font style='font-size:100px ; color:red'>" + "This page is only for the ADMIN" + "</font></b>");
                Response.End();
            }
            
            %>
        <form method="post">
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <%=str %>
            <table style="background-color: rgba(255, 255, 255, 0.5)">
                <tr>
                    <td>
                        Enter user to delete:
                    </td>
                    <td>
                        <input id="name" type="text" name="name" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input style="border-width: 2px ; margin-left:25%" type="submit" value="Delete" name="submit"/>
                        <input style="border-width: 2px ; margin-left:10%" type="reset" value="Reset" name="reset" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
