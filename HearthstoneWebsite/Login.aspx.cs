using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public static string str;

    protected void Page_Load(object sender, EventArgs e)
    {   
        str = "";
        if (Request.Form["submit"] != null)
        {
            
            string user_name = Request.Form["name"];
            string user_password = Request.Form["password"];

            string sql = "select * from [users] where username='" + user_name + "' AND [password]='" + user_password + "'";

            if (MyAdoHelper.IsExist("Database.accdb", sql))
            {
                Response.Redirect("Main.aspx", false);
                Session["user"] = user_name;
                str = "";
            }
            else
            {
                str = "Login Failed!";
            }
        }
    }
}