using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Manage_Rights : System.Web.UI.Page
{
    string s,s1,s2,s3;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        

    }
    protected void btnupdate_Click1(object sender, EventArgs e)
    { 
        if (chk1.Checked == true || Chk11.Checked==true)
        {
            s = "1";
        }
        else
        {
            s = "0";
        }
        if (chk2.Checked == true || chk22.Checked==true)
        {
            s1 = "1";
        }
        else
        {
            s1 = "0";
        }
        if (chk3.Checked == true || chk33.Checked == true)
        {
            s2 = "1";
        }
        else
        {
            s2 = "0";
        }
        if (chk4.Checked == true || chk44.Checked == true)
        {
            s3 = "1";
        }
        else
        {
            s3 = "0";
        }
        string strQuery = "update rights set view_r='" + s + "',insert_r='" + s1 + "',update_r='" + s2 + "',delete_r='" + s3 + "',right__update_date='" + DateTime.Now + "' where project_id='" + Request.QueryString["id"].ToString() + "' and user_id='" + Request.QueryString["id1"].ToString() + "' ";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "rights");

        con.Close();
        Response.Redirect("Project_User.aspx");

    }
}