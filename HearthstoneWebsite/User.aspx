<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        table,select,input,textarea,option{
            font-size: 40px
        }
        input[type='radio'],input[type='checkbox'] {
            transform: scale(2);
            position: relative;
            bottom: 13px;
        }
        textarea,input,select{
            border-width: 3px
        }
        textarea{
            resize: none
        }
        td{
            font-size: 40px;
        }
        input{
            border-radius: 10px;
        }
        input[type=submit]{
            width: 200px;  height: 80px;
        }
        .msg{
            font-size: 32px;
        }
        body {
            background-image: url(Images/Garrosh.jpg);
            height: 1100px;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <script type="text/javascript">

        function checkAll()
        {
            var pass = checkPass();
            var mail = checkEmail();
            var text = checkText();

            if (pass && mail && text)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        function checkPass()
        {
            var pass = document.getElementById("password").value;
            var numFlag = false;
            var lowercase = false;
            var uppercase = false;
            var special = false;
            var i = 0;
            var specialLetters = "!@#$%^&*";

            // Crash check
            for (i = 0; i < pass.length; i++)
            {
                if (pass[i] == "'")
                {
                    document.getElementById("passMsg").innerHTML = "Don't try this ;)";
                    return false;
                }
            }

            // pass length check
            if (pass.length < 8)
            {
                document.getElementById("passMsg").innerHTML = "* Password must be at least 8 letters";
                return false;
            }

            // loop to check all conditions
            for (i = 0; i < pass.length && (!numFlag || !lowercase || !uppercase || !special) ; i++)
            {
                // check if a number exists
                if (pass[i] >= '0' && pass[i] <= '9')
                {
                    numFlag = true;
                }
                // check if a lowercase letter exists
                else if (pass[i] >= 'a' && pass[i] <= 'z')
                {
                    lowercase = true;
                }
                //// check if a uppercase letter exists
                //else if (pass[i] >= 'A' && pass[i] <= 'Z')
                //{
                //    uppercase = true;
                //}
                ////check if a special char exists
                //else if (specialLetters.includes(pass[i]))
                //{
                //    special = true;
                //}
            }

            // if no number was found
            if (!numFlag)
            {
                document.getElementById("passMsg").innerHTML = "* Password must contain at least one digit";
                return false;
            }
            // if no lower case letter was found
            else if (!lowercase)
            {
                document.getElementById("passMsg").innerHTML = "* Password must contain at least one lowercase letter";
                return false;
            }
            //// if no upper case letter was found
            //else if (!uppercase)
            //{
            //    document.getElementById("passMsg").innerHTML = "* Password must contain at least one uppercase letter";
            //    return false;
            //}
            //// if no special char was found
            //else if (!special)
            //{
            //    document.getElementById("passMsg").innerHTML = "* Password must contain at least one special letter (!@#$%^&*)";
            //    return false;
            //}
            // if all conditions are met
            else
            {
                document.getElementById("passMsg").innerHTML = "";
                return true;
            }
        }

        function checkEmail()
        {
            var mail = document.getElementById("mail").value;
            var shtrudel = false;
            var dot = false;
            var space = false;
            var dotAfterShtrudel = true;
            var dotBeforeShtrudel = true;
            var counter = 0;
            var shtrudelPlace = 0;
            var i = 0;

            // Crash check
            for (i = 0; i < mail.length; i++)
            {
                if (name[i] == "'")
                {
                    document.getElementById("mailMsg").innerHTML = "Don't try this ;)";
                    return false;
                }
            }

            for (i = 0; i < mail.length; i++)
            {
                if (mail[i] == '@')
                {
                    shtrudel = true;
                    counter++;
                    shtrudelPlace = i;
                }
            }
            // if no shtrudel was found
            if (!shtrudel)
            {
                document.getElementById("mailMsg").innerHTML = "Enter a mail with a @";
                return false;
            }
            // if the first char is a shtrudel
            if (mail[0] == '@')
            {
                document.getElementById("mailMsg").innerHTML = "First char mustn't be a @";
                return false;
            }
            // if there are more than 1 shtrudel
            if (counter > 1)
            {
                document.getElementById("mailMsg").innerHTML = "Enter a mail with only one @";
                return false;
            }

            for (i = 0; i < mail.length; i++)
            {
                if (mail[i] == '.')
                {
                    dot = true;
                    if (i == shtrudelPlace + 1)
                    {
                        dotAfterShtrudel = false;
                    }
                    if (i < shtrudelPlace)
                    {
                        dotBeforeShtrudel = false;
                    }
                }
            }

            // if no dot was found
            if (!dot)
            {
                document.getElementById("mailMsg").innerHTML = "Enter a mail with at least one dot";
                return false;
            }
            // if there's a dot right after the shtrudel
            if (!dotAfterShtrudel)
            {
                document.getElementById("mailMsg").innerHTML = "There can't be a dot after the @";
                return false;
            }
            // if there's a dot before the shtrudel
            if (!dotBeforeShtrudel)
            {
                document.getElementById("mailMsg").innerHTML = "The dot must be after the @";
                return false;
            }

            for (i = 0; i < mail.length; i++)
            {
                if (mail[i] == ' ')
                {
                    space = true;
                }
            }

            // if a space was found
            if (space)
            {
                document.getElementById("mailMsg").innerHTML = "Enter a mail without any spaces";
                return false;
            }
            else
            {
                document.getElementById("mailMsg").innerHTML = "";
                return true;
            }
        }

        function passStrength()
        {
            var pass = document.getElementById("password").value;
            var weak = false;
            var moderate = false;
            var strong = false;
            var specialLetters = "!@#$%^&*";

            for (i = 0; i < pass.length; i++)
            {
                if (pass[i] >= 'a' && pass[i] <= 'z' && !weak)
                {
                    weak = true;
                }
                if (pass[i] >= 'A' && pass[i] <= 'Z' && !moderate)
                {
                    moderate = true;
                }
                if ((specialLetters.includes(pass[i])) && !strong)
                {
                    strong = true;
                }
            }

            if (weak)
            {
                if (moderate)
                {
                    if (strong)
                    {
                        document.getElementById("passStrength").innerHTML = "Strong";
                    }
                    else
                    {
                        document.getElementById("passStrength").innerHTML = "Moderate";
                    }
                }
                else
                {
                    document.getElementById("passStrength").innerHTML = "Weak";
                }
            }
            else
            {
                document.getElementById("passStrength").innerHTML = "";
            }
        }

        function checkText()
        {
            var text = document.getElementById("text").value;
            var i = 0;

            // Crash check
            for (i = 0; i < text.length; i++)
            {
                if (text[i] == "'")
                {
                      return false;
                }
            }
            return true;
        }

    </script>
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
                    Response.Write("<li> <a href='User.aspx' class='active'> <i class='fa fa-fw fa-user'> </i> User </a> </li>");
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
        <br /><br /><br />
        <form method="post" onsubmit="return checkAll();" >
            <table style="background-color: rgba(255, 255, 255, 0.5)" width="80%">
                <tr>
                    <td></td>
                    <td colspan="3" height="100">
                        <div style="font-size: 60px">Change Information</div>
                    </td>
                </tr>
                <tr>
                    <td width="4%"></td>
                    <td width="16%">
                        Password:
                    </td>
                    <td height="65" width="37%">
                        <input size="18" id="password" type="text" name="password" value="<%=user_password %>" onkeyup="passStrength()"/>
                        <div id="passStrength" style="display: inline; font-size: 20px"></div>
                    </td>
                    <td width="43%"><div class="msg" id="passMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        Email:
                    </td>
                    <td>
                        <input size="18" id="mail" type="text" name="mail" value="<%=user_mail %>" />
                    </td>
                    <td><div class="msg" id="mailMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        Gender:
                    </td>
                    <td colspan="2">
                        <%
                            string gender1 = "";
                            string gender2 = "";
                            string gender3 = "";
                            string gender4 = "";
                            if (user_gender == "male")
                            {
                                gender1 = "checked";
                            }
                            else if (user_gender == "female")
                            {
                                gender2 = "checked";
                            }
                            else if (user_gender == "attack_helicopter")
                            {
                                gender3 = "checked";
                            }
                            else
                            {
                                gender4 = "checked";
                            }
                             %>
                        <input type="radio" id="gender1" name="gender" value="male" <%=gender1%> /> Male
                        <input type="radio" id="gender2" name="gender" value="female" <%=gender2%> style="margin-left: 30px" /> Female
                        <input type="radio" id="gender3" name="gender" value="attack_helicopter" <%=gender3%> style="margin-left: 30px" /> Attack Helicopter
                        <input type="radio" id="gender4" name="gender" value="other" <%=gender4%> style="margin-left: 30px" /> Other
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3" height="90">
                        <div style="position: relative; top: 15px; font-size: 50px">What Kind Of Food Do You Like?</div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <%
                            string f1 = "", f2 = "", f3 = "", f4 = "", f5 = "", f6 = "", f7 = "", f8 = "", f9 = "", f10 = "", f11 = "";
                            string FEED = fav_food;
                            if (FEED != null)
                            {
                                string[] result = FEED.Split(',');
                                int i=0;
                                for (i=0; i<result.Length;i++)
                                {
                                    if (result[i] == "plants")
                                    {
                                        f1 = "checked";
                                    }
                                    else if (result[i] == "chocolate")
                                    {
                                        f2 = "checked";
                                    }
                                    else if (result[i] == "schnitzel")
                                    {
                                        f3 = "checked";
                                    }
                                    else if (result[i] == "well... what is in the fridge?")
                                    {
                                        f4 = "checked";
                                    }
                                    else if (result[i] == "Sushi")
                                    {
                                        f5 = "checked";
                                    }
                                    else if (result[i] == "Pizza")
                                    {
                                        f6 = "checked";
                                    }
                                    else if (result[i] == "Steak")
                                    {
                                        f7 = "checked";
                                    }
                                    else if (result[i] == "Beef")
                                    {
                                        f8 = "checked";
                                    }
                                    else if (result[i] == "Pasta")
                                    {
                                        f9 = "checked";
                                    }
                                    else if (result[i] == "Shrimp")
                                    {
                                        f10 = "checked";
                                    }
                                    else if (result[i] == "Orange")
                                    {
                                        f11 = "checked";
                                    }
                                }
                            }
                                                         %>

                        <input type="checkbox" id="food1" name="food" value="salads" <%=f1 %> /> Salads
                        <input type="checkbox" id="food2" name="food" value="chocolate" style="margin-left: 40px" <%=f2 %> /> Chocolate
                        <input type="checkbox" id="food3" name="food" value="schnitzel" style="margin-left: 40px" <%=f3 %> /> Schnitzel
                        <input type="checkbox" id="food4" name="food" value="well... what is in the fridge?" style="margin-left: 40px" <%=f4 %> /> Well... what is in the fridge? <br />

                        <input type="checkbox" id="food5" name="food" value="sushi" <%=f5 %> /> Sushi
                        <input type="checkbox" id="food6" name="food" value="pizza" style="margin-left: 40px" <%=f6 %> /> Pizza
                        <input type="checkbox" id="food7" name="food" value="steak" style="margin-left: 40px" <%=f7 %> /> Steak
                        <input type="checkbox" id="food8" name="food" value="beef" style="margin-left: 40px" <%=f8 %> /> Beef
                        <input type="checkbox" id="food9" name="food" value="pasta" style="margin-left: 40px" <%=f9 %> /> Pasta
                        <input type="checkbox" id="food10" name="food" value="shrimp" style="margin-left: 40px" <%=f10 %> /> Shrimp
                        <input type="checkbox" id="food11" name="food" value="orange" style="margin-left: 40px" <%=f11 %> /> Orange
                    </td>
                </tr>
                <tr>
                    <td height="200"></td>
                    <td></td>
                    <td>
                        Favorite animal: <br />
                        <textarea rows="2" cols="20" id="text" name="animal"><%=fav_animal %></textarea>
                    </td>
                    <td>
                        Favorite class: <br />
                        <%
                            string op1="";
                            string op2="";
                            string op3="";
                            string op4="";
                            string op5="";
                            string op6="";
                            if (fav_class == "Math")
                            {
                                op1 = "selected";
                            }
                            else if (fav_class == "Computing")
                            {
                                op2 = "selected";
                            }
                            else if (fav_class == "Sports")
                            {
                                op3 = "selected";
                            }
                            else if (fav_class == "English")
                            {
                                op4 = "selected";
                            }
                            else if (fav_class == "Physics-Hearthstone")
                            {
                                op5 = "selected";
                            }
                            else
                            {
                                op6 = "selected";
                            }
                             %>
                        <select name="class">
                            <option <%=op1 %>>Math</option>
                            <option <%=op2 %>>Computing</option>
                            <option <%=op3 %>>Sports</option>
                            <option <%=op4 %>>English</option>
                            <option <%=op5 %>>Physics-Hearthstone</option>
                            <option <%=op6 %>>Studying Sucks</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <input style="border-width: 2px ; margin-left:35%" type="submit" value="Change" name="submit" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
