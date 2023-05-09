<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        body, html {
            margin: 0;
            height: 1700px;
        }
        img {
            width: 200px;
            height: 270px;
        }
        #background { 
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("Images/hearthstone-heroes-of-warcraft-hearthstone-heroes-warcraft-wallpaper.jpg");
            height: 1700px; 
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .gallery img:hover{
            transition: 1s;
            transform: scale(1.2);
        }
    </style>
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
                        Response.Write("<li> <a href='Gallery.aspx' class='active'> <i class='fa fa-fw fa-image'> </i> Gallery </a> </li>");
                        Response.Write("<li> <a href='Board.aspx'> <i class='fa fa-fw fa-commenting'> </i> Board </a> </li>");
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
            <br /><br /><br /><br /><br />
            <div class="gallery">
            <table>
                <tr>
                    <td>
                        <img style="padding: 0 0 20px 0; height: 290px" alt="espionage" src="Images/200px-Academic_Espionage(89859)_Gold.png" />
                    </td>
                    <td>
                        <img alt="berserker" src="Images/200px-Amani_Berserker(641)_Gold.png" />
                    </td>
                    <td>
                        <a href="https://youtu.be/km5FAAQLUT8?t=83" target="_blank">
                            <img alt="leeroy" src="Images/200px-Leeroy_Jenkins(674)_Gold.png" />
                        </a>
                    </td>
                    <td>
                        <img alt="shredder" src="Images/200px-Sneed_s_Old_Shredder(12187)_Gold.png" />
                    </td>
                    <td>
                        <img alt="mooneater" src="Images/200px-Baku_the_Mooneater(89335)_Gold.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="noggen" src="Images/200px-Mayor_Noggenfogger(49756)_Gold.png" />
                    </td>
                    <td>
                        <a href="https://youtu.be/nEFfWKA6WXk?t=64" target="_blank">
                            <img alt="millhouse" src="Images/200px-Millhouse_Manastorm(339)_Gold.png" />
                        </a>
                    </td>
                    <td>
                        <img alt="rotface" src="Images/200px-Rotface(62898)_Gold.png" />
                    </td>
                    <td>
                        <img alt="patron" src="Images/200px-Grim_Patron(14435)_Gold.png" />
                    </td>
                    <td>
                        <img alt="nzoth" src="Images/200px-N_Zoth,_the_Corruptor(33134)_Gold.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="whizbang" src="Images/200px-Whizbang_the_Wonderful(89813)_Gold.png" />
                    </td>
                    <td>
                        <img alt="boom" src="Images/200px-Dr._Boom,_Mad_Genius(89827)_Gold.png" />
                    </td>
                    <td>
                        <img alt="gibberer" src="Images/200px-Feral_Gibberer(76864)_Gold.png" />
                    </td>
                    <td>
                        <img alt="pain" src="Images/200px-Acolyte_of_Pain(428)_Gold.png" />
                    </td>
                    <td>
                        <img alt="bolf" src="Images/200px-Bolf_Ramshield(22346)_Gold.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="cthun" src="Images/200px-C_Thun(31110)_Gold.png" />
                    </td>
                    <td>
                        <img alt="genn" src="Images/200px-Genn_Greymane(89336)_Gold.png" />
                    </td>
                    <td>
                        <a href="https://youtu.be/rru8TOXJP7E?t=56" target="_blank">
                            <img alt="jaraxxus" src="Images/200px-Lord_Jaraxxus(482)_Gold.png" />
                        </a>
                    </td>
                    <td>
                        <img alt="cho" src="Images/200px-Lorewalker_Cho(456)_Gold.png" />
                    </td>
                    <td>
                        <a href="https://youtu.be/TsR88xRScsg?t=18" target="_blank">
                            <img alt="reno" src="Images/200px-Reno_Jackson(27228)_Gold.png" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="garrosh" src="Images/200px-Scourgelord_Garrosh(62927)_Gold.png" />
                    </td>
                    <td>
                        <a href="https://www.youtube.com/watch?v=BCr7y4SLhck" target="_blank">
                            <img alt="lich" src="Images/200px-The_Lich_King(62922)_Gold.png" />
                        </a>
                    </td>
                    <td>
                        <img alt="ysera" src="Images/200px-Ysera(495)_Gold.png" />
                    </td>
                    <td>
                        <img alt="keleseth" src="Images/200px-Prince_Keleseth(58723)_Gold.png" />
                    </td>
                    <td>
                        <img alt="palestress" src="Images/200px-Confessor_Paletress(22368)_Gold.png" />
                    </td>
                </tr>
            </table>
            </div>
        </center>
    </div>
</body>
</html>
