using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User : System.Web.UI.Page
{
    public static string username;
    public static string user_password;
    public static string user_mail;
    public static string fav_class;
    public static string user_gender;
    public static string fav_food;
    public static string fav_animal;
    public static string sql;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            username = Session["user"].ToString();
            sql = "select * from [users] where username='" + username + "'";
            DataTable dt = MyAdoHelper.ExecuteDataTable("Database.accdb", sql);
            user_password = dt.Rows[0]["password"].ToString();
            user_mail = dt.Rows[0]["email"].ToString();
            fav_class = dt.Rows[0]["fav_class"].ToString();
            user_gender = dt.Rows[0]["gender"].ToString();
            fav_food = dt.Rows[0]["fav_food"].ToString();
            fav_animal = dt.Rows[0]["fav_animal"].ToString();

            if (Request.Form["submit"] != null)
            {
                user_password = Request.Form["password"];
                user_mail = Request.Form["mail"];
                fav_class = Request.Form["class"];
                user_gender = Request.Form["gender"];
                fav_food = Request.Form["food"];
                fav_animal = Request.Form["animal"];

                sql = "Update users set [password]='" + user_password + "',email='" + user_mail + "',fav_class='" + fav_class + "',gender='" + user_gender + "',fav_food='" + fav_food + "',fav_animal='" + fav_animal + "' where username='" + username + "'";
                MyAdoHelper.DoQuery("Database.accdb", sql);
            }
        }
    }
}