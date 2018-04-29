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

public partial class Add_Account : System.Web.UI.Page
{
    public string s1;
    int i, i1;
    static string val44, val45, val46;
    protected void Page_Load(object sender, EventArgs e)
    {
        val44 = Session["project_id"].ToString() + "_ledger_account";
        val45 = Session["project_id"].ToString() + "_material";
        val46 = Session["project_id"].ToString() + "_account";
    }
    protected void btn2_Click1(object sender, EventArgs e)
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
                i1 = Convert.ToInt32(dr1.GetValue(0));
            }
            dr1.Close();
            int r;
            Random ro = new Random();
            r = ro.Next();
            string m = txtba.Text + r;
            string strq1 = "insert into "+val46+" values('" + m + "','" + txtba.Text + "','" + txtbal.Text + "','" + i1 + "','" + txt.Text + "')";
            SqlCommand cmd111 = new SqlCommand(strq1, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd111);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1, val46);
            Response.Write("<script>window.close()</script>");

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
    public static List<string> SearchCustomers2(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select ac_name from "+val46+" where " +
                "ac_name like '%'+@SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["ac_name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
}