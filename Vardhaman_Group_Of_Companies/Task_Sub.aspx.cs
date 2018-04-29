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


public partial class Task_Sub : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2, val2;
    int i1, i2, i3;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Task";
            val1 = Session["project_id"].ToString() + "_contra";
            val2 = Session["project_id"].ToString() + "_journal";
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
        if (!IsPostBack)
        {
            string s = Request.QueryString["id"];
            if (s != null)
            {
                Response.Write("<script>alert('Task Created Successfully');</script>");
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
                cmd.CommandText = "select name from " + h4 + " where " +
                "name like '%'+@SearchText + '%' and under=0";
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


    protected void Button1_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                            .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s12 = "select name from " + val + " where name='" + maint.Text + "'";
        SqlDataReader dr12;
        SqlCommand cmd222 = new SqlCommand(s12, con);
        dr12 = cmd222.ExecuteReader();
        while (dr12.Read())
        {
            h = dr12.GetString(0).ToLower();
        }
        dr12.Close();
        if (h == maint.Text.ToLower())
        {
            string s14 = "select id from " + val + " where name='" + maint.Text + "'";
            SqlDataReader dr14;
            SqlCommand cmd444 = new SqlCommand(s14, con);
            dr14 = cmd444.ExecuteReader();
            while (dr14.Read())
            {
                bp = dr14.GetValue(0).ToString();
            }
            dr14.Close();
            string strq = "insert into  " + val + "  values('" + name.Text + "','" + desc.InnerText + "','" + frmdate.Text + "','" + todate.Text + "','"+ass.Text+"','"+bp+"','0')";
            SqlCommand cmd11 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd11);
            DataSet ds = new DataSet();
            da.Fill(ds, val);
            Response.Redirect("Task_Sub.aspx?id=success");
        }
        else
        {
            Response.Write("<script>alert('Task Name Incorrect');</script>");
            maint.Text = "";
            maint.Focus();
        }
    }
}