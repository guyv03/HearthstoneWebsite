<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style type="text/css">
        body, html {
            height: 100%;
            margin: 0;
        }
        #background {
            background: linear-gradient(rgba(0, 0, 0, 0.60), rgba(0, 0, 0, 0.60)), url('Images/886166.jpg');
            height: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <div id="background">
        <center>
            <ul>
                <li> <a href="Main.aspx" class="active"> <i class="fa fa-fw fa-home"> </i> Main </a> </li>
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
                        Response.Write("<li> <a href='Board.aspx'> <i class='fa fa-fw fa-commenting'> </i> Board </a> </li>");
                        Response.Write("<li> <a href='User.aspx'> <i class='fa fa-fw fa-user'> </i> User </a> </li>");
                    }
                     %>
            </ul>
            <br /><br /><br /><br /><br /><br />
            <a href="https://www.youtube.com/watch?v=YG35phnCKRc" target="_blank">
                <img alt="hearthstone" src="Images/HearthStone_logo_2016.png" width="800" height="300" />
            </a>
            <br/>
            <div style="text-shadow: 2px 2px black, 0 0 1em cyan, 0 0 0.2em darkorange; color:orange; font-size: 55px">
                Hearthstone is a free mobile/pc multiplayer card game. <br />
                You deploy units on the board, cast spells and defeat your opponent, <br />
                While also looking at the epic animations, listening to funny voice lines <br />
                And trying your hardest not to waste real money on the game :)
            </div>
        </center>
    </div>
</body>
</html>
