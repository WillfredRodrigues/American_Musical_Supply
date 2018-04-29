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

public partial class P_L : System.Web.UI.Page
{
    public string val, val1, x, y, z, l, m, s, s1, s2, s3, s4, sp, stat,proj,name,val78,val79,val80,val81;
    public string f, k, a, c, d;

    public int n, o, p, q;
    public double r = 0, r1 = 0,name1=0,name2=0,name3=0,name4=0,name5=0,name6=0,name7=0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            val1 = Session["project_id"].ToString() + "_ledger_account";
            val78 = Session["project_id"].ToString() + "_customer";
            val79 = Session["project_id"].ToString() + "_sales";
            val80 = Session["project_id"].ToString() + "_purchase";
           
            f = val;
            string val3 = Session["project_id"].ToString();
            proj = val3;
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
}