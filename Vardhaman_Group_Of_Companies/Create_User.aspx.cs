using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class Create_User : System.Web.UI.Page
{
    string s, s1, s2, s3;
    public string val, val1, x, y, z, l, m, s4, sp,bp;
    static string f, k, a, c, d;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            val1 = Session["project_id"].ToString() + "_customer";
            f = val;
            string val3 = Session["project_id"].ToString();
            sp = val3;
            k = val3;
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

            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('User Has Successfully Been Created');</script>");

            }
        }

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (chk1.Checked == true)
        {
            s = "1";
        }
        else
        {
            s = "0";
        }
        if (chk2.Checked == true)
        {
            s1 = "1";
        }
        else
        {
            s1 = "0";
        }
        if (chk3.Checked == true)
        {
            s2 = "1";
        }
        else
        {
            s2 = "0";
        }
        if (chk4.Checked == true)
        {
            s3 = "1";
        }
        else
        {
            s3 = "0";
        }
        string strquery = "select user_id from user_management where user_id='" + txtusername.Text + "'";
        String strConnString1 = System.Configuration.ConfigurationManager
   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(strConnString1);
        con1.Open();
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(strquery, con1);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            bp = dr.GetString(0).ToLower();

        }
        dr.Close();
        if (bp == txtusername.Text.ToLower())
        {
            Response.Write("<script>alert('User ID Has  Been Taken');</script>");
        }
        else
        {
            String strConnString = System.Configuration.ConfigurationManager
                       .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            string strq11 = "insert into User_Management values('" + Session["main_admin_id"].ToString() + "','" + Session["main_admin_name"].ToString() + "','" + txtusername.Text + "', '" + txtuserfullname.Text + "','" + txtuserpassword.Text + "','" + status.SelectedItem.Text + "','" + sp + "','"+DateTime.Now+"','','" + type.SelectedItem.Text + "','')";
            SqlCommand cmd111 = new SqlCommand(strq11, con);
            SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
            DataSet ds11 = new DataSet();
            da11.Fill(ds11, "User_Management");


            string strq1 = "insert into rights values('" + sp + "','" + type.SelectedItem.Text + "','" + txtusername.Text + "','" + s + "','" + s1 + "','" + s2 + "','" + s3 + "','','','" + txtuserfullname.Text + "')";
            SqlCommand cmd11 = new SqlCommand(strq1, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd11);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1, "rights");
            Response.Redirect("Create_User.aspx?success=true");
        }
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
                cmd.CommandText = "select proj_name,proj_location from project_registration where " +
                "proj_regi_id ='" + k + "'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["proj_name"].ToString() + " : " + sdr["proj_location"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
}
