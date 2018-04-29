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

public partial class Complex_Home : System.Web.UI.Page
{
    public string val, val1, x, y, z, l, m, s, s1, s2, s3, s4, sp,stat;
    public string f, k, a, c, d;

    public int n, o, p, q, r;
    protected void Page_Load(object sender, EventArgs e)
    {
        show();
        pan1.Visible = true;
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            val1 = Session["project_id"].ToString() + "_customer";
            f = val;
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


       
            s = Request.QueryString["id"];
            s1 = Request.QueryString["id1"];
            s2 = Request.QueryString["id2"];
            s3 = Request.QueryString["id3"];
            s4 = Request.QueryString["id4"];
            if (s != "---Select Complex---" && s1 != "---Select Building---" && s2 != "---Select Wing---" && s3 != "---Select Floor---" && s4 != "---Select One---")
            {
               
                if (s4 == "View All")
                {
                    show();
                    pan2.Visible = true;
                }
                else if (s4 == "View Sold")
                {
                    show();
                    pan3.Visible = true;
                }
                else if (s4 == "View Unsold")
                {
                    show();
                    pan4.Visible = true;
                }
            }
            else if (s == "---Select Complex---" && s1 == "---Select Building---" && s2 == "---Select Wing---" && s3 == "---Select Floor---" && s4 == "---Select One---")
            {
               
                show();
                pan1.Visible = true;
            }
            else if (s == "---Select Complex---" || s1 == "---Select Building---" || s2 == "---Select Wing---" || s3 == "---Select Floor---" || s4 == "---Select One---")
            {
               
                show();
                pan5.Visible = true;
            }
           
                if (!IsPostBack)
            {
                view.Items.Clear();
                view.Items.Add("---Select One---");
                view.Items.Add("View All");
                view.Items.Add("View Sold");
                view.Items.Add("View Unsold");
            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Complex Has Successfully Been Updated');</script>");

            }
            string status1 = Request.QueryString["success1"];
            if (status1 != null)
            {
                Response.Write("<script>alert('Complex Has Successfully Been Deleted');</script>");

            }
            string status2 = Request.QueryString["status"];
            if (status2 != null)
            {
                Response.Write("<script>alert('Complex Details Has Successfully Been Added');</script>");

            }
            cn.AppendDataBoundItems = true;
            string s5 = "select distinct(complex_name) from " + val + "";
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = s5;
            cmd.Connection = con;
            try
            {
                con.Open();
                cn.DataSource = cmd.ExecuteReader();
                cn.DataTextField = "complex_name";
             
                cn.DataBind();
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

    }
    private void show()
    {
        pan1.Visible = false;
        pan2.Visible = false;
        pan3.Visible = false;
        pan4.Visible = false;
        pan5.Visible = false;
    }


    protected void cn_SelectedIndexChanged(object sender, EventArgs e)
    {
        bn.Items.Clear();
        bn.AppendDataBoundItems = true;
        bn.Items.Add("---Select Building---");
        string s = "select distinct(building_name) from " + val + " where complex_name=@id";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@id", cn.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            bn.DataSource = cmd.ExecuteReader();
            bn.DataTextField = "building_name";
            bn.DataBind();
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
    protected void bn_SelectedIndexChanged(object sender, EventArgs e)
    {
        wing.Items.Clear();
        wing.AppendDataBoundItems = true;
        wing.Items.Add("---Select Wing---");
        string s = "select distinct(wing) from  " + val + "  where complex_Name='" + cn.SelectedItem.Text + "' and  building_name=@id ";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();

        cmd.Parameters.AddWithValue("@id", bn.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            wing.DataSource = cmd.ExecuteReader();
            wing.DataTextField = "wing";

            wing.DataBind();
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
    protected void wing_SelectedIndexChanged(object sender, EventArgs e)
    {
        floor.Items.Clear();
        floor.AppendDataBoundItems = true;
        floor.Items.Add("---Select Floor---");
        string s = "select distinct(flat_floor) from  " + val + "  where complex_name='" + cn.SelectedItem.Text + "' and building_name='" + bn.SelectedItem.Text + "' and wing=@id";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();

        cmd.Parameters.AddWithValue("@id", wing.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            floor.DataSource = cmd.ExecuteReader();
            floor.DataTextField = "flat_floor";

            floor.DataBind();
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
}