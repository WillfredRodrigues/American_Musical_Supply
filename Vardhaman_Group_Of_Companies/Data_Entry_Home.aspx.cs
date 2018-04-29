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


public partial class Data_Entry_Home : System.Web.UI.Page
{
  public string val, val1, sp, vn, pb, mat, bp, sp1, sp2,val2;
    int i1, i2, i3;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {
        pan1.Visible = true;
        pan2.Visible = false;
        pan3.Visible = false;
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_bank_book";
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
            string stats = Request.QueryString["success"];
            if (stats != null)
            {
                Response.Write("<script>alert('Receipt Entry Has Successfully Been Made');</script>");
            }
            string stats1 = Request.QueryString["success1"];
            if (stats1 != null)
            {
                Response.Write("<script>alert('Purchase Entry Has Successfully Been Made');</script>");
            }
            string stats2 = Request.QueryString["success2"];
            if (stats2 != null)
            {
                Response.Write("<script>alert('Contra Entry Has Successfully Been Made');</script>");
            }
            string stats3 = Request.QueryString["success3"];
            if (stats3 != null)
            {
                Response.Write("<script>alert('Payment Entry Has Successfully Been Deleted');</script>");
            }
            string stats4 = Request.QueryString["success4"];
            if (stats4 != null)
            {
                Response.Write("<script>alert('Receipt Entry Has Successfully Been Deleted');</script>");
            }
            string stats5 = Request.QueryString["success5"];
            if (stats5 != null)
            {
                Response.Write("<script>alert('Contra Entry Has Successfully Been Deleted');</script>");
            }
            string stats11 = Request.QueryString["success11"];
            if (stats11 != null)
            {
                Response.Write("<script>alert('Payment Entry Has Successfully Been Updated');</script>");
            }
            string stats10 = Request.QueryString["success10"];
            if (stats10 != null)
            {
                Response.Write("<script>alert('Receipt Entry Has Successfully Been Updated');</script>");
            }
            string stats13 = Request.QueryString["success13"];
            if (stats13 != null)
            {
                Response.Write("<script>alert('Contra Entry Has Successfully Been Updated');</script>");
            }
            string stats14 = Request.QueryString["success14"];
            if (stats14 != null)
            {
                Response.Write("<script>alert('Journal Entry Has Successfully Been Made');</script>");
            }
            string stats15 = Request.QueryString["success15"];
            if (stats15 != null)
            {
                Response.Write("<script>alert('Journal Entry Has Successfully Been Updated');</script>");
            }
            string stats16 = Request.QueryString["success16"];
            if (stats16 != null)
            {
                Response.Write("<script>alert('Journal Entry Has Successfully Been Deleted');</script>");
            }
        }
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        pan2.Visible = true;
        pan1.Visible = false;
        pan3.Visible = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pan3.Visible = true;
        pan1.Visible = false;
        pan2.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        pan2.Visible = false;
        pan3.Visible = false;
        pan1.Visible = true;
        from.Text = "";
        from1.Text = "";
        to.Text = "";
    }
}