using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Update_Complex1 : System.Web.UI.Page
{
    public string val, val1, a,b,c,d,e2,f;
    static string h;
    int i1;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn1.Focus();
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            h = val;
            val1 = Session["project_id"].ToString();
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
        a = Request.QueryString["id"];
        b = Request.QueryString["id1"];
        c = Request.QueryString["id2"];
        d = Request.QueryString["id3"];
        e2 = Request.QueryString["id4"];
        f = Request.QueryString["id5"];
      
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(complex_name) from "+h+"";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["complex_name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                         .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string strq11 = "update  " + val + "   set complex_name='" + cn.Text + "',building_name='" + bn.Text + "',complex_location='" + cl.Text + "' where complex_name='" + cn1.Text + "'";
        SqlCommand cmd111 = new SqlCommand(strq11, con);
        SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
        DataSet ds11 = new DataSet();
        da11.Fill(ds11, val);
        con.Close();
        Response.Redirect("Complex_Home.aspx?success=true");
    }
    protected void cn1_TextChanged(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                           .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s1 = "select complex_name,building_name,complex_location from "+h+" where complex_name='" + cn1.Text + "'";
        SqlDataReader dr1;
        SqlCommand cmd22 = new SqlCommand(s1, con);
        dr1 = cmd22.ExecuteReader();
        while (dr1.Read())
        {
            cn.Text = dr1.GetString(0);
            cl.Text = dr1.GetString(2);
            bn.Text = dr1.GetString(1);
        }
        dr1.Close();
    }
}