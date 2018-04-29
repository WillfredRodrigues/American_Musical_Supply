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
    public string s1,c1,c2;
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
        String strConnString89 = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con89 = new SqlConnection(strConnString89);
        con89.Open();
        string s89 = "select ac_name from  " + val46 + "  where ac_name='" + txtba.Text + "'";
        SqlDataReader dr89;
        SqlCommand cmd89 = new SqlCommand(s89, con89);
        dr89 = cmd89.ExecuteReader();
        while (dr89.Read())
        {
            c2 = dr89.GetString(0).ToLower();

        }
        dr89.Close();
        if (c2 == txtba.Text.ToLower())
        {
            Response.Write("<script>alert('Account Already Created');</script>");
            txtba.Text = "";
            txtba.Focus();
        }
        else
        {
            String strConnString6 = System.Configuration.ConfigurationManager
                              .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con6 = new SqlConnection(strConnString6);
            con6.Open();
            string s = "select name from ledger where name='" + txt.Text + "'";
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(s, con6);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                c1 = dr.GetString(0);

            }
            dr.Close();
            if (c1 == txt.Text)
            {
                string strquery = "select id,name,under from ledger where name='" + txt.Text + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr9;
                SqlCommand cmd9 = new SqlCommand(strquery, con1);
                dr9 = cmd9.ExecuteReader();
                while (dr9.Read())
                {
                    TextBox1.Text = dr9.GetValue(0).ToString();
                    TextBox3.Text = dr9.GetString(1);
                    TextBox2.Text = dr9.GetValue(2).ToString();
                }
                dr9.Close();
                if (TextBox2.Text != "0")
                {
                    while (Convert.ToInt32(TextBox2.Text) != 0)
                    {
                        string strquery1 = "select id,name,under from ledger where id='" + TextBox2.Text + "'";
                        SqlDataReader dr8;
                        SqlCommand cmd8 = new SqlCommand(strquery1, con1);
                        dr8 = cmd8.ExecuteReader();
                        while (dr8.Read())
                        {
                            TextBox1.Text = dr8.GetValue(0).ToString();
                            TextBox3.Text = dr8.GetString(1);
                            TextBox2.Text = dr8.GetValue(2).ToString();
                        }
                        dr8.Close();
                    }
                }
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
                string strq1 = "insert into " + val46 + " values('" + m + "','" + txtba.Text + "','" + txtbal.Text + "','" + i1 + "','" + txt.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "')";
                SqlCommand cmd111 = new SqlCommand(strq1, con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd111);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1, val46);
                Response.Write("<script>window.close()</script>");
            }
            else
            {
                Response.Write("<script>alert('Group Name Invalid');</script>");
                txt.Text = "";
                txt.Focus();
            }

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