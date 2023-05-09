using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    public static string str = "";
    public static bool color;

    protected void Page_Load(object sender, EventArgs e)
    {
        str = "";
        if (Request.Form["submit"] != null)
        {
            string user_name = Request.Form["name"]; 
            string user_mail = Request.Form["mail"];
            
            string sql = "select * from [users] where username='" + user_name + "'";

            if (MyAdoHelper.IsExist("Database.accdb", sql) == true)
            {
                str = "Username already taken!";
                color = false;
            }

            else
            {
                sql = "select * from [users] where email='" + user_mail + "'";

                if (MyAdoHelper.IsExist("Database.accdb", sql) == true)
                {
                    str = "Email already exists!";
                    color = false;
                }

                else
                {
                    string user_password = Request.Form["password"];
                    string fav_class = Request.Form["class"];
                    string user_gender = Request.Form["gender"];
                    string fav_food = Request.Form["food"];
                    string fav_animal = Request.Form["animal"];
                    str = "Success!";
                    color = true;

                    sql = "insert into users(userName,[password],email,fav_class,gender,fav_food,fav_animal) VALUES ('" + user_name + "','" + user_password + "' , '" + user_mail + "' , '" + fav_class + "' , '" + user_gender + "' , '" + fav_food + "' , '" + fav_animal + "')";
                    MyAdoHelper.DoQuery("Database.accdb", sql);
                }
            }
        }


    }
}