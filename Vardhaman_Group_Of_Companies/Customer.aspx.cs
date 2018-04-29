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

public partial class Customer : System.Web.UI.Page
{
    public string val, val1,x,y,z,l,m,s,s1,s2,s3,s4,sp;
    static string f, k, a, c, d;
    protected void Page_Load(object sender, EventArgs e)
    {
        show();
        pan1.Visible=true;
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
        
        if (!IsPostBack)
        {

            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Customer Entry Has Successfully Been Updated');</script>");

            }
            string status1 = Request.QueryString["success1"];
            if (status1 != null)
            {
                Response.Write("<script>alert('Customer Entry Has Successfully Been Deleted');</script>");

            }
            string status2 = Request.QueryString["success3"];
            if (status2 != null)
            {
                Response.Write("<script>alert('Customer Entry Has Successfully Been Added');</script>");

            }
        }
       
    }
  private void show()
  {
      pan1.Visible=false;
      pan2.Visible=false;
    
  }





  protected void btnSub_Click(object sender, EventArgs e)
  {
      show();
      pan2.Visible = true;
  }
}