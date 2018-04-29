using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    string y,er=null;
    protected void Page_Load(object sender, EventArgs e)
    {
       
       
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {

        y = DropDownList1.Text;
        for (int i = 0; i < y.Length; i++)
        {
            if (y.ElementAt(i) == ':' || y.ElementAt(i) == ' ')
            {

            }
            else
            {
                er = er + y.ElementAt(i);
            }
          
        }
        if (type.SelectedIndex == 0)
        {
            string strQuery = "select user_name,password,admin_id,name from main_admin where user_name= '" + txtid.Text + "' and password='" + txtpass.Text + "'";
            f1(strQuery, 1);

        }
        else if (type.SelectedIndex == 1)
        {
            string strQuery1 = "select user_management.user_id,user_management.password,user_management.user_id,user_management.user_name,user_management.proj_id,rights.view_r,rights.insert_r,rights.update_r,rights.delete_r from user_management left join rights on user_management.user_id=rights.user_id where user_management.user_id= '" + txtid.Text + "' and user_management.password='" + txtpass.Text + "' and user_management.user_status='active' and user_management.type='Project Admin'";
            f1(strQuery1, 2);
        }
        else
        {
            string strQuery2 = "select user_management.user_id,user_management.password,user_management.user_id,user_management.user_name,user_management.proj_id,rights.view_r,rights.insert_r,rights.update_r,rights.delete_r from user_management left join rights on user_management.user_id=rights.user_id where user_id= '" + txtid.Text + "' and password='" + txtpass.Text + "' and user_status='active' and type='user'";
            f1(strQuery2, 3);
        }

    }
    private void f1(string s, int s1)
    {

        String strConnString = System.Configuration.ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (s1 == 1)
            {
                txt1.Text = dr.GetString(0);
                txt2.Text = dr.GetString(1);
                HttpContext.Current.Session["main_admin_id"] = dr.GetString(2);
                HttpContext.Current.Session["main_admin_name"] = dr.GetString(3);
                HttpContext.Current.Session["logged_in"] = "Main Admin:" + Session["main_admin_name"].ToString();
                HttpContext.Current.Session["menu"] = "1";
                HttpContext.Current.Session["project_id"] = er;
                HttpContext.Current.Session["rightview"] = "1";
                HttpContext.Current.Session["rightinsert"] = "1";
                HttpContext.Current.Session["rightupdate"] = "1";
                HttpContext.Current.Session["rightdelete"] = "1";
            }
            else if (s1 == 2)
            {
                txt1.Text = dr.GetString(0);
                txt2.Text = dr.GetString(1);
                HttpContext.Current.Session["project_admin_id"] = dr.GetString(2);
                HttpContext.Current.Session["project_admin_name"] = dr.GetString(3);
                HttpContext.Current.Session["logged_in"] = "Project Admin:" + Session["project_admin_name"].ToString();
                HttpContext.Current.Session["menu"] = "2";
                HttpContext.Current.Session["project_id"] =dr.GetString(4);
                HttpContext.Current.Session["rightview"] = dr.GetValue(5).ToString();
                HttpContext.Current.Session["rightinsert"] = dr.GetValue(6).ToString();
                HttpContext.Current.Session["rightupdate"] = dr.GetValue(7).ToString();
                HttpContext.Current.Session["rightdelete"] = dr.GetValue(8).ToString();
            }
            else
            {
                txt1.Text = dr.GetString(0);
                txt2.Text = dr.GetString(1);
                HttpContext.Current.Session["user_id"] = dr.GetString(2);
                HttpContext.Current.Session["user_name"] = dr.GetString(3);
                HttpContext.Current.Session["logged_in"] = "User:" + Session["user_name"].ToString();
                HttpContext.Current.Session["menu"] = "3";
                HttpContext.Current.Session["project_id"] = dr.GetString(4);
                HttpContext.Current.Session["rightview"] = dr.GetValue(5).ToString();
                HttpContext.Current.Session["rightinsert"] = dr.GetValue(6).ToString();
                HttpContext.Current.Session["rightupdate"] = dr.GetValue(7).ToString();
                HttpContext.Current.Session["rightdelete"] = dr.GetValue(8).ToString();
            }
        }
        if (txtid.Text == txt1.Text && txtpass.Text == txt2.Text)
        {
            if (s1 == 1)
            {
                clear();
                Response.Redirect("MainAdmin.aspx");

            }
            else if (s1 == 2)
            {
                clear();
                Response.Redirect("MainAdmin.aspx");
            }
            else
            {
                clear();
                Response.Redirect("MainAdmin.aspx");
            }
        }
        else
        {
            MessageBox.Show("WRONG CREDENTIALS");
        }



        dr.Close();
        con.Close();

    }
    public void clear()
    {
        txt1.Text = "";
        txt2.Text = "";
        txtpass.Text = "";
    }


    protected void type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (type.SelectedIndex == 0)
        {
            lbl.Visible = true;
            DropDownList1.Visible = true;
        }
        else
        {
            lbl.Visible = false;
            DropDownList1.Visible = false;
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
                "(proj_regi_id like @SearchText + '%' or proj_name like @SearchText + '%' or proj_location like @SearchText + '%') and proj_status='active'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["proj_name"].ToString()+" : "+sdr["proj_location"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
   
}