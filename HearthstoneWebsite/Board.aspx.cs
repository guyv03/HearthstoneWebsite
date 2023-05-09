using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Board : System.Web.UI.Page
{
    public static string table = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            DataTable dt = MyAdoHelper.ExecuteDataTable("Database.accdb", "select * from [board] order by post_date asc");
            DataTable usersdt;

            table = "";
            int id = 0;
            string sql = "";
            string message = "";
            string username = "";

            table += "<center><table border='1' style='background-color: rgba(255, 255, 255, 0.5)'  width='80%'>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sql = "select board.user_id, users.username from [board] inner join [users] on board.user_id = users.id";
                usersdt = MyAdoHelper.ExecuteDataTable("Database.accdb", sql);
                table += "<tr><td width='580px'>" + dt.Rows[i]["post_date"].ToString() + "</td><td align='center'>" + usersdt.Rows[i]["username"] + "</td></tr><tr><td colspan='2'>" + dt.Rows[i]["content"].ToString() + "</td></tr>";
            }

            table += "</table></center>";

            if (Request.Form["submit"] != null)
            {
                username = Session["user"].ToString();
                sql = "select * from [users] where username='" + username + "'";
                usersdt = MyAdoHelper.ExecuteDataTable("Database.accdb", sql);
                id = (int)usersdt.Rows[0]["id"];

                message = Request.Form["message"];
                sql = "insert into board(user_id,content,post_date) VALUES ('" + id + "','" + message + "','" + DateTime.Now + "')";
                MyAdoHelper.DoQuery("Database.accdb", sql);
                Response.Redirect("Board.aspx");
            }
        }
    }
}