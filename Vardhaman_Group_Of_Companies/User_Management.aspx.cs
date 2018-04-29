using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["project_admin_id"] == null && Session["project_admin_name"] ==null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
        
        
        //string strQuery = "select proj_site_master from project_registration";
        //String strConnString = System.Configuration.ConfigurationManager
        //           .ConnectionStrings["conString"].ConnectionString;
        //SqlConnection con = new SqlConnection(strConnString);
        //con.Open();
        //SqlDataReader dr;
        //SqlCommand cmd = new SqlCommand(strQuery, con);
        //dr = cmd.ExecuteReader();
        //while (dr.Read())
        //{
        //    sitemaster.Items.Add(dr.GetString(0));
        //}

    }
    protected void txtsearchproj_TextChanged(object sender, EventArgs e)
    {
        lstproj.Items.Clear();
        lstproj.Focus();
        string strQuery = "select proj_regi_id from project_registration where proj_regi_id like '%"+txtsearchproj.Text+"%' or proj_location like '%" + txtsearchproj.Text + "%' or proj_user_name like '%" + txtsearchproj.Text + "%'";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(strQuery, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            lstproj.Items.Add(dr.GetValue(0).ToString());
        }
       
    }
    protected void lstproj_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery = "select proj_regi_id,proj_user_name, proj_location from project_registration where proj_regi_id = @CustomerID";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@CustomerID", lstproj.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtprojid.Text = sdr.GetValue(0).ToString();
                txtprojuser.Text = sdr.GetString(1);
                txtlocation.Text = sdr.GetString(2);
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
    //protected void txtsearchadmin_TextChanged(object sender, EventArgs e)
    //{
    //    Lstadmin.Items.Clear();
    //    Lstadmin.Focus();
    //    string strQuery = "select proj_admin_id from project_registration where proj_admin_id like '%" + txtsearchadmin.Text + "%' or proj_admin_name like '%" + txtsearchadmin.Text + "%'";
    //    String strConnString = System.Configuration.ConfigurationManager
    //               .ConnectionStrings["conString"].ConnectionString;
    //    SqlConnection con = new SqlConnection(strConnString);
    //    con.Open();
    //    SqlDataReader dr;
    //    SqlCommand cmd = new SqlCommand(strQuery, con);
    //    dr = cmd.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        Lstadmin.Items.Add(dr.GetValue(0).ToString());
    //    }
       
    //}
    //protected void Lstadmin_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    //    String strQuery = "select proj_admin_id,proj_admin_name from project_registration where proj_admin_id = @CustomerID";
    //    SqlConnection con = new SqlConnection(strConnString);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Parameters.AddWithValue("@CustomerID", Lstadmin.SelectedItem.Text);
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = strQuery;
    //    cmd.Connection = con;
    //    try
    //    {
    //        con.Open();
    //        SqlDataReader sdr = cmd.ExecuteReader();
    //        while (sdr.Read())
    //        {
    //            txtadid.Text = sdr.GetValue(0).ToString();
    //            txtprojadname.Text = sdr.GetString(1);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //    finally
    //    {
    //        con.Close();
    //        con.Dispose();
    //    }

    //}
    protected void btnadd_Click(object sender, EventArgs e)
    {
        string strQuery = "insert into user_management values('" + Session["project_admin_id"].ToString() + "','" + Session["project_admin_name"].ToString() + "','" + txtusername.Text + "','" + txtuserfullname.Text + "','" + txtuserpassword.Text + "','" + status.SelectedItem.Text + "','" + sitemaster.SelectedItem.Text + "','" + txtprojid.Text + "','" + txtlocation.Text + "','" + txtprojuser.Text + "','" + userright.SelectedItem.Text + "','" + DateTime.Now + "','')";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "user_management");

        con.Close();
    }
}