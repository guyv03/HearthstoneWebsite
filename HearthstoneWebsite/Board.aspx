<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Board.aspx.cs" Inherits="Board" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Board</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        td{
            font-size: 50px;
        }
        textarea{
            font-size: 45px;
            resize: none
        }
        input{
            font-size: 45px;
        }
        body {
            height: 20000px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("Images/lich-king-arthas-artwork.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
    <script type="text/jscript">

        function checkInput()
        {
            var input = document.getElementById("message").value;
            var i = 0;

            for (i=0;i<input.length;i++)
            {
                if (input[i] == "'")
                {
                    document.getElementById("input").innerHTML = "Don't even think about it Ido!";
                    return false;
                }
            }

            if (input.length < 1)
            {
                document.getElementById("input").innerHTML = "Message must be at least 1 character";
                return false;
            }
            else
            {
                return true;
            }
        }

    </script>
</head>
<body>
    <div id="background">
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
                        if (Session["user"].ToString() == "Gingi Gadol")
                        {
                            Response.Write("<li style='float:right'> <a href='https://www.youtube.com/user/TheLogin41'>" + "Hello " + user_name + "!" + "</a> </li>");
                        }
                        else if (Session["user"].ToString() == "admin" || Session["user"].ToString() == "Admin")
                        {
                            Response.Write("<li style='float:right'> <a href='Admin.aspx'>" + "Hello " + user_name + "!" + "</a> </li>");
                        }
                        else
                        {
                            Response.Write("<li style='float:right'> <a>" + "Hello " + user_name + "!" + "</a> </li>");
                        }
                        Response.Write("<li> <a href='Gallery.aspx'> <i class='fa fa-fw fa-image'> </i> Gallery </a> </li>");
                        Response.Write("<li> <a href='Board.aspx' class='active'> <i class='fa fa-fw fa-commenting'> </i> Board </a> </li>");
                        Response.Write("<li> <a href='User.aspx'> <i class='fa fa-fw fa-user'> </i> User </a> </li>");
                    }
                     %>
            </ul>
            <%
                if (Session["user"] == null)
                {
                    Response.Write("<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>");
                    Response.Write("<b><font style='font-size:100px ; color:red'>" + "This page is only for registered users" + "</font></b>");
                    Response.End();
                }
                %>
            <%Response.Write("<br/><br/><br/><br/>"); %>
            <%=table %>
            <form method="post" name="form" id="form" onsubmit="return checkInput();">
                <table border="1" width="80%" style="background-color: rgba(255, 255, 255, 0.5)">
                    <tr>
                        <td width="25%">
                            Enter message:
                        </td>
                        <td width="35%">
                            <textarea id="message" name="message" rows="2" cols="30"></textarea>
                        </td>
                        <td width="24%">
                            <div class="msg" id="input" style="display: inline ; font-size: 35px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input style="border-width: 2px ; margin-left:35%" type="submit" value="Submit" name="submit"/>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </div>
</body>
</html>
