using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    public static string sql;
    public static string str;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string user_name = Request.Form["name"];
            sql = "delete * from [users] where username='" + user_name + "'";

            MyAdoHelper.DoQuery("Database.accdb", sql);
            str = MyAdoHelper.printDataTable("Database.accdb", sql);
        }

        sql="select * from [users]";
        str = MyAdoHelper.printDataTable("Database.accdb", sql);
    }
}