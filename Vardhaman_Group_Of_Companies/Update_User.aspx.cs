using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Update_User : System.Web.UI.Page
{
    string  s1, s2, s3;
    public string val, val1, x, y, z, l, m, s4, sp;
    static string f, k, a, d;
    string s,g,c,c1,c2,c3;
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
                Response.Write("<script>alert('User Has Successfully Been Updated');</script>");

            }
           
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (chk1.Checked == true)
        {
            c = "1";
        }
        else
        {
            c = "0";
        }
        if (chk2.Checked == true)
        {
            c1 = "1";
        }
        else
        {
            c1 = "0";
        }
        if (chk3.Checked == true)
        {
            c2 = "1";
        }
        else
        {
            c2 = "0";
        }
        if (chk4.Checked == true)
        {
            c3 = "1";
        }
        else
        {
            c3 = "0";
        }
        string strQuery = "update user_management set type='" + type.SelectedItem.Text + "', user_name='" + txtuserfullname.Text + "',password='" + txtuserpassword.Text + "', user_status='" + status.SelectedItem.Text + "',user_updated_date='" + DateTime.Now + "' where user_id ='" + DropDownList1.Text + "'";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "user_management");
        string strQuery1 = "update rights set user_name='" + txtuserfullname.Text + "',user_type='" + type.SelectedItem.Text + "',view_r='" + c + "',insert_r='" + c1 + "',update_r='" + c2 + "',delete_r='" + c3 + "',right__update_date='"+DateTime.Now+"' where user_id ='" + DropDownList1.Text + "'";
        SqlCommand cmd1 = new SqlCommand(strQuery1, con);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1, "rights");
        con.Close();
        Response.Redirect("Update_User.aspx?success=true");
    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery = "select user_name,password,type,user_status from user_management where user_id = @CustomerID";
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
                txtuserpassword.Text = sdr.GetString(1);
                s = sdr.GetString(2);
                g = sdr.GetString(3);
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
        if (s == "Project Admin")
        {
            type.SelectedIndex = 0;
        }
        else
        {
            type.SelectedIndex = 1;
        }
        if (g == "Active")
        {
            status.SelectedIndex = 0;
        }
        else
        {
            status.SelectedIndex = 1;
        }
        String strConnString1 = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery1 = "select view_r,insert_r,update_r,delete_r from rights where user_id = @CustomerID";
        SqlConnection con1 = new SqlConnection(strConnString1);
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Parameters.AddWithValue("@CustomerID", DropDownList1.Text);
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = strQuery1;
        cmd1.Connection = con1;
        try
        {
            con1.Open();
            SqlDataReader sdr1 = cmd1.ExecuteReader();
            while (sdr1.Read())
            {
                if (Convert.ToDouble(sdr1.GetValue(0)) == 1)
                {
                    chk1.Checked = true;
                }
                else
                {
                    chk1.Checked = false;
                }
                if (Convert.ToDouble(sdr1.GetValue(1)) == 1)
                {
                    chk2.Checked = true;
                }
                else
                {
                    chk2.Checked = false;
                }
                if (Convert.ToDouble(sdr1.GetValue(2)) == 1)
                {
                    chk3.Checked = true;
                }
                else
                {
                    chk3.Checked = false;
                }
                if (Convert.ToDouble(sdr1.GetValue(3)) == 1)
                {
                    chk4.Checked = true;
                }
                else
                {
                    chk4.Checked = false;
                }
            }
        }

        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con1.Close();
            con1.Dispose();
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
                "proj_id ='" + k + "' and user_name like '%'+@SearchText+'%'";
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