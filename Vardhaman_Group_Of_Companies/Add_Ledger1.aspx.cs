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
using System.Web.Script.Serialization;

public partial class Add_Ledger1 : System.Web.UI.Page
{
    public string s1;
    static string val44, val45;
    protected void Page_Load(object sender, EventArgs e)
    {
        val44 = Session["project_id"].ToString() + "_ledger_account";
        val45 = Session["project_id"].ToString() + "_material";
        txt1.Focus();
        string s, s3, s2, s4;
        s = Request.QueryString["id"];
        if (s != "")
        {
            txttt.Value = s;
        }
        s2 = Request.QueryString["id1"];
        if (s2 != "")
        {
            txttt1.Value = s2;
        }
        s3 = Request.QueryString["id2"];
        if (s3 != "")
        {
            txttt2.Value = s3;
        }
        s4 = Request.QueryString["id3"];
        if (s4 != "")
        {
            gf1.Value = s4;
        }

    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers1(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select name from ledger where " +
                "name like '%'+@SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers3(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select name from  "+val44+"  where name like @SearchText + '%' ";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        if (txt.Text != "")
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            string s1 = "select id from ledger where name='" + txt.Text + "'";
            SqlDataReader dr1;
            SqlCommand cmd11 = new SqlCommand(s1, con);
            dr1 = cmd11.ExecuteReader();
            while (dr1.Read())
            {
                hf.Value = dr1.GetValue(0).ToString();
            }
            dr1.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "mname();", true);
        }
    }
}
