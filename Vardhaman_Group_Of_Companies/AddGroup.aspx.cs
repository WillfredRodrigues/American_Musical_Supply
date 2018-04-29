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

public partial class Add : System.Web.UI.Page
{
    public string s1,c1,c2;
    int i,i1;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        
    }
    protected void btn2_Click1(object sender, EventArgs e)
    {
        String strConnString89 = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con89 = new SqlConnection(strConnString89);
        con89.Open();
        string s89 = "select name from  ledger  where name='" + txt1.Text + "'";
        SqlDataReader dr89;
        SqlCommand cmd89 = new SqlCommand(s89, con89);
        dr89 = cmd89.ExecuteReader();
        while (dr89.Read())
        {
            c2 = dr89.GetString(0).ToLower();

        }
        dr89.Close();
        if (c2 == txt1.Text.ToLower())
        {
            Response.Write("<script>alert('This Group Has Already Been Made');</script>");
            txt1.Text = "";
            txt1.Focus();
        }
        else
        {
            if (txt.Text != "")
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
                if (c1 != txt.Text)
                {

                    Response.Write("<script>alert('Group Name Invalid');</script>");
                    txt.Text = "";
                    txt.Focus();
                }
                else
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
                    string strq = "insert into ledger values('" + txt1.Text + "','" + i1 + "','')";
                    SqlCommand cmd1 = new SqlCommand(strq, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "ledger");

                    Response.Write("<script>window.close()</script>");

                }
            }
            else
            {
                String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string strq = "insert into ledger values('" + txt1.Text + "','0','" + ddl.SelectedItem.Text + "')";
                SqlCommand cmd1 = new SqlCommand(strq, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                DataSet ds = new DataSet();
                da.Fill(ds, "ledger");
                Response.Write("<script>window.close()</script>");
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
}