using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Delete_User : System.Web.UI.Page
{
    string s1, s2, s3;
    public string val, val1, x, y, z, l, m, s4, sp;
    static string f, k, a, d;
    string s, g, c, c1, c2, c3;
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
                Response.Write("<script>alert('User Has Successfully Been Deleted');</script>");

            }
           
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        string strQuery = "update user_management set  user_status='Disabled',deletion_date='" + DateTime.Now + "' where user_id ='" + DropDownList1.Text + "'";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "user_management");
        
        Response.Redirect("Delete_User.aspx?success=true");
    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery = "select user_name,type,user_status from user_management where user_id = @CustomerID";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@CustomerID", DropDownList1.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtuserfullname.Text = sdr.GetString(0);
                type.Text = sdr.GetString(1);
                status.Text = sdr.GetString(2);


            }
        }

        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
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
                cmd.CommandText = "select user_id from user_management where " +
                "proj_id ='" + k + "' and user_status='active' and user_name like '%'+@SearchText+'%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["user_id"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
}