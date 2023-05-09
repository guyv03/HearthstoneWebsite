<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="StyleSheetLinks.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style type="text/css">
        table,select,input,textarea{
            font-size: 40px
        }
        table {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 50px;
        }
        input[type='radio'],input[type='checkbox']{
            transform: scale(2);
            position: relative;
            bottom: 13px;
        }
        textarea,input,select{
            border-width: 2px
        }
        .msg{
            font-size: 35px;
        }
        textarea{
            resize: none;
        }
        input{
            border-radius: 10px;
        }
        input[type=submit], input[type=reset] {
            width: 200px;
            height: 80px;
        }
        body { 
            background-image: url("Images/2_Hearthstone-Heroes-Of-Warcraft.jpg");
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <script type="text/javascript">

        function checkAll()
        {
            var userName = checkUserName();
            var pass = checkPass();
            var mail = checkEmail();
            var gender = checkGender();
            var text = checkText();

            if (userName && pass && mail && gender && text)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        function checkUserName()
        {
            var name = document.getElementById("name").value;
            var i = 0;

            if (name.length <= 2 || name.length >= 12)
            {
                document.getElementById("nameMsg").innerHTML = "* Username must be between 3-12 digits";
                return false;
            }
            else
            {
                document.getElementById("nameMsg").innerHTML = "";
                return true;
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

            // pass length check
            if (pass.length < 8)
            {
                document.getElementById("passMsg").innerHTML = "* Password must be at least 8 letters";
                return false;
            }

            // loop to check all conditions
            for (i = 0; i < pass.length && (!numFlag || !lowercase/* || !uppercase || !special*/);i++)
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
                // check if a uppercase letter exists
                //else if (pass[i] >= 'A' && pass[i] <= 'Z')
                //{
                //    uppercase = true;
                //}
                //check if a special char exists
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
            // if no upper case letter was found
            //else if (!uppercase)
            //{
            //    document.getElementById("passMsg").innerHTML = "* Password must contain at least one uppercase letter";
            //    return false;
            //}
            // if no special char was found
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
                document.getElementById("mailMsg").innerHTML = "* Enter a mail with a @";
                return false;
            }
            // if the first char is a shtrudel
            if (mail[0] == '@')
            {
                document.getElementById("mailMsg").innerHTML = "* First char mustn't be a @";
                return false;
            }
            // if there are more than 1 shtrudel
            if (counter > 1)
            {
                document.getElementById("mailMsg").innerHTML = "* Enter a mail with only one @";
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
                document.getElementById("mailMsg").innerHTML = "* Enter a mail with at least one dot";
                return false;
            }
            // if there's a dot right after the shtrudel
            if (!dotAfterShtrudel)
            {
                document.getElementById("mailMsg").innerHTML = "* There can't be a dot after the @";
                return false;
            }
            // if there's a dot before the shtrudel
            if (!dotBeforeShtrudel)
            {
                document.getElementById("mailMsg").innerHTML = "* The dot must be after the @";
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
                document.getElementById("mailMsg").innerHTML = "* Enter a mail without any spaces";
                return false;
            }
            else
            {
                document.getElementById("mailMsg").innerHTML = "";
                return true;
            }
        }

        function checkGender()
        {
            var gender1 = document.getElementById("gender1").checked;
            var gender2 = document.getElementById("gender2").checked;
            var gender3 = document.getElementById("gender3").checked;

            //if no gender was entered
            if (!gender1 && !gender2 && !gender3)
            {
                document.getElementById("genderMsg").innerHTML = "* Please select a gender";
                return false;
            }
            else
            {
                document.getElementById("genderMsg").innerHTML = "";
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

            return true;
        }

    </script>
</head>
<body>
    <center>
        <ul>
            <li> <a href="Main.aspx"> <i class="fa fa-fw fa-home"> </i> Main </a> </li>
            <li style="float:right"> <a href="Register.aspx" class="active"> <i class="fa fa-fw fa-user-plus"> </i> Register </a> </li>
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
                if (color)
                {
                    Response.Write("<li style='float:right'> <a> <font color='green'>" + str + "</font> </a> </li>");
                }
                else
                {
                    Response.Write("<li style='float:right'> <a> <font color='red'>" + str + "</font> </a> </li>");
                }
                 %>
        </ul>
        <br/><br/><br/>
        <form method="post" onsubmit="return checkAll();" >
            <table width="70%">
                <tr>
                    <td colspan="2" height="100">
                        <div style="font-size: 60px">Sign Up</div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" height="65">
                        <div style="position: relative; bottom: 20px">It's free and always will be.</div>
                    </td>
                </tr>
                <tr>
                    <td height="65" width="46%">
                        <input id="name" name="name" type="text" placeholder="User Name"/>
                    </td>
                    <td width="51%"><div class="msg" id="nameMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td height="65">
                        <input id="password" name="password" type="password" placeholder="Password" onkeyup="passStrength()" />
                        <div id="passStrength" style="display: inline; font-size: 20px"></div>
                    </td>
                    <td><div class="msg" id="passMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td height="65">
                        <input id="mail" name="mail" type="text" placeholder="Email"/>
                    </td>
                    <td><div class="msg" id="mailMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td>
                        <span style="font-size: 45px">Choose Your Gender:</span>
                        <br />
                        <input type="radio" id="gender1" name="gender" value="male" /> Male
                        <input type="radio" id="gender2" name="gender" value="female" style="margin-left: 40px" /> Female
                        <br />
                        <input type="radio" id="gender3" name="gender" value="attack_helicopter" /> Attack Helicopter
                        <input type="radio" id="gender4" name="gender" value="other" style="margin-left: 40px" /> Other
                    </td>
                    <td><div class="msg" id="genderMsg" align="left"></div></td>
                </tr>
                <tr>
                    <td colspan="2" height="90">
                        <div style="position: relative; top: 15px; font-size: 50px">What Kind Of Food Do You Like?</div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" id="food1" name="food" value="salads" /> Salads
                        <input type="checkbox" id="food2" name="food" value="chocolate" style="margin-left: 40px" /> Chocolate
                        <input type="checkbox" id="food3" name="food" value="schnitzel" style="margin-left: 40px" /> Schnitzel
                        <input type="checkbox" id="food4" name="food" value="well... what is in the fridge?" style="margin-left: 40px" /> Well... what is in the fridge?
                        <br />

                        <input type="checkbox" id="food5" name="food" value="sushi" /> Sushi
                        <input type="checkbox" id="food6" name="food" value="pizza" style="margin-left: 40px" /> Pizza
                        <input type="checkbox" id="food7" name="food" value="steak" style="margin-left: 40px" /> Steak
                        <input type="checkbox" id="food8" name="food" value="beef" style="margin-left: 40px" /> Beef
                        <input type="checkbox" id="food9" name="food" value="pasta" style="margin-left: 40px" /> Pasta
                        <input type="checkbox" id="food10" name="food" value="shrimp" style="margin-left: 40px" /> Shrimp
                        <input type="checkbox" id="food11" name="food" value="orange" style="margin-left: 40px" /> Orange
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <textarea rows="3" cols="20" id="text" name="animal" placeholder="Favorite Animal"></textarea>
                    </td>
                    <td>
                        <div style="font-size: 50px">Favorite Class</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <select name="class">
                            <option>Math</option>
                            <option>Computing</option>
                            <option>Sports</option>
                            <option>English</option>
                            <option>Physics</option>
                            <option>Studying Sucks</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 20px" height="80">
                        By clicking Sign Up, you agree to our Terms, Data Policy and Cookies Policy.<br />
                        You may receive SMS Notifications from us and can opt out any time.
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input style="border-width: 2px ; margin-left:25%" type="submit" value="Submit" name="submit" />
                        <input style="border-width: 2px ; margin-left:15%" type="reset" value="Reset" name="reset" />
                    </td>
                </tr>
            </table>
        </form>
    <br/><br/><br/>
    </center>
</body>
</html>
