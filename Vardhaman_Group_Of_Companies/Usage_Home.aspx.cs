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

public partial class Usage_Home : System.Web.UI.Page
{
    public string val, val1;
    int i1;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Usage";
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
            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Usage Entry Has Successfully Been Updated');</script>");

            }
            string status1 = Request.QueryString["success1"];
            if (status1 != null)
            {
                Response.Write("<script>alert('Usage Entry Has Successfully Been Deleted');</script>");

            }
            string status2 = Request.QueryString["success2"];
            if (status2 != null)
            {
                Response.Write("<script>alert('Usage Entry Has Successfully Been Added');</script>");

            }
        }
    }
}