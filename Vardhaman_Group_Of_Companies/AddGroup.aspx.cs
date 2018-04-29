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
    public string s1;
    int i,i1;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        
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
            string strq = "insert into ledger values('" + txt1.Text + "','" + i1 + "')";
            SqlCommand cmd1 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, "ledger");
            string s = "select max(id) from ledger";
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(s, con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                i = Convert.ToInt32(dr.GetValue(0));
            }
            dr.Close();
            Response.Write("<script>window.close()</script>");
           
        }
        else
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            string strq = "insert into ledger values('" + txt1.Text + "','0')";
            SqlCommand cmd1 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, "ledger");
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
}