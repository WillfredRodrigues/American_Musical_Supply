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

public partial class Group_View : System.Web.UI.Page
{
    public string val, val1,val2, x, y, z, l, m, s, s1, s2, s3, s4, sp, stat, proj, name, val78, val79, val80, val81;
    public string f, k, a, c, d,va,va1,va2,va3,nf,ln;

    public int n, o, p, q,gl,sa;
    public double r = 0, r1 = 0, name1 = 0, name2 = 0, name3 = 0, name4 = 0, name5 = 0, name6 = 0, name7 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            val1 = Session["project_id"].ToString() + "_ledger_account";
            val78 = Session["project_id"].ToString() + "_customer";
            val79 = Session["project_id"].ToString() + "_sales";
            val80 = Session["project_id"].ToString() + "_purchase";
            va = Session["project_id"].ToString() + "_bank_book";
            va1 = Session["project_id"].ToString() + "_contra";
            va2 = Session["project_id"].ToString() + "_journal";
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

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                d = Request.QueryString["id"].ToString();
                if (d == "Sales Accounts")
                {
                    sa = 1;
                }
                string strquery1 = "select main_name from " + val1 + " where main_name='" + d + "'";
                String strConnString11 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con11 = new SqlConnection(strConnString11);
                con11.Open();
                SqlDataReader dr11;
                SqlCommand cmd11 = new SqlCommand(strquery1, con11);
                dr11 = cmd11.ExecuteReader();
                while (dr11.Read())
                {
                    nf = dr11.GetString(0);
                }
                if (nf == d)
                {
                    o = 1;
                }
                else
                {
                    o = 0;
                }
                string strquery = "select name from " + val1 + " where name='" + d + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    k = dr.GetString(0);
                }
                if (k == d)
                {
                    q = 1;
                }
                else
                {
                    q = 0;
                }
                string strquery3 = "select ledger_name from " + val1+ " where ledger_name='" + d + "'";
                String strConnString33 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con33 = new SqlConnection(strConnString33);
                con33.Open();
                SqlDataReader dr33;
                SqlCommand cmd33 = new SqlCommand(strquery3, con33);
                dr33 = cmd33.ExecuteReader();
                while (dr33.Read())
                {
                    ln = dr33.GetString(0);
                }
                if (ln == nf)
                {
                    gl = 1;
                }
                else
                {
                    gl = 0;
                }
            }
        }
    }
}