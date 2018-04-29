using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (type.SelectedIndex == 0)
        {
            string strQuery = "select user_name,password,admin_id,name from main_admin where user_name= '" + txtid.Text + "' and password='" + txtpass.Text + "'";
            f1(strQuery,1);

        }
        else if (type.SelectedIndex == 1)
        {
            string strQuery1 = "select proj_admin_user_name,proj_admin_password,proj_admin_id,proj_admin_name from project_registration where proj_admin_user_name='"+txtid.Text+"' and proj_admin_password='"+txtpass.Text+"' ";
            f1(strQuery1,2);
        }
        else
        {
            string strQuery2 = "select user_id,password,user_id,user_name from user_management where user_id= '" + txtid.Text + "' and password='" + txtpass.Text + "'";
            f1(strQuery2,3);
        }
       
               
    }
   private void f1(string s,int s1)
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
            }
            else if (s1 == 2)
            {
                txt1.Text = dr.GetString(0);
                txt2.Text = dr.GetString(1);
                HttpContext.Current.Session["project_admin_id"] = dr.GetString(2);
                HttpContext.Current.Session["project_admin_name"] = dr.GetString(3);
            }
            else
            {
                txt1.Text = dr.GetString(0);
                txt2.Text = dr.GetString(1);
                HttpContext.Current.Session["user_id"] = dr.GetString(2);
                HttpContext.Current.Session["user_name"] = dr.GetString(3);
            }
        }
        if (txtid.Text == txt1.Text && txtpass.Text == txt2.Text)
        {
            if (s1 == 1)
            {
                clear();
                Response.Redirect("Project_Registration.aspx");
               
            }
            else if (s1 == 2)
            {
                clear();
                Response.Redirect("User_Management.aspx");
            }
            else
            {
                clear();
                Response.Redirect("Default.aspx");
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



}