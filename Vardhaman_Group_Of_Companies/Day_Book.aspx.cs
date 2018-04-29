using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Configuration;

public partial class Day_Book : System.Web.UI.Page
{
   public string val, val1, sp, vn, pb, mat, bp, sp1, sp2;
    int i1, i2, i3;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {
        pan1.Visible = true;
        pan2.Visible = false;
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_bank_book";
            val1 = Session["project_id"].ToString() + "_contra";
            h4 = val;
            string val3 = Session["project_id"].ToString();
            string op;
            string strquery = "select proj_status from project_registration where proj_regi_id='" + val3 + "'";
            String strConnString1 = System.Configuration.ConfigurationManager
       .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(strConnString1);
            con1.Open();
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(strquery, con1);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                op = dr.GetString(0);
                if (op == "Disabled")
                {
                    Response.Redirect("Update_project.aspx?status=false");
                }
            }
            dr.Close();

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
          
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        pan2.Visible = true;
        pan1.Visible = false;
    }
}