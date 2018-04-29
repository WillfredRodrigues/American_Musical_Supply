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

public partial class Delete_Usage : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2;
    int i1, i2, i3;
    string h;
    static string h4,val45,val44,val46;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Usage";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
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
            bp = Request.QueryString["id"];
            if (bp != null)
            {
                string strquery = "select * from " + val + " where use_id='" + bp + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtmname.Text = dr.GetString(3);
                    mat = dr.GetString(3).ToLower();
                    txtqty.Text = dr.GetValue(4).ToString();
                    i1 = Convert.ToInt32(dr.GetValue(4));
                    txtqtype.Text = dr.GetString(5);
                    txtuby.Text = dr.GetString(6);
                    txtbmat.Text = dr.GetString(7);

                    txtudate.Text = dr.GetString(1);
                    txtcomment.InnerText = dr.GetString(10);

                    if (dr.GetString(8) == "Site")
                    {
                        type.SelectedIndex = 0;
                    }
                    else
                    {
                        type.SelectedIndex = 1;
                    }
                }
                dr.Close();
                string strquery3 = "select quantity from "+val45+" where id='" + bp + "'";
                SqlConnection con3 = new SqlConnection(strConnString1);
                con3.Open();
                SqlDataReader dr3;
                SqlCommand cmd3 = new SqlCommand(strquery3, con3);
                dr3 = cmd3.ExecuteReader();
                while (dr3.Read())
                {
                    avail.Text = dr.GetValue(0).ToString();
                }
                dr3.Close();
            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                         .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        i2 = Convert.ToInt32(txtqty.Text);
        string strq2 = "update  "+val45+" set quantity=quantity+'" + i1 + "' where  id='" + bp + "'";
        SqlCommand cmd2 = new SqlCommand(strq2, con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2, val45);
        string strq3 = "delete from " + val + "  where use_id='" + bp + "'";
        SqlCommand cmd3 = new SqlCommand(strq3, con);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataSet ds3 = new DataSet();
        da3.Fill(ds3, val);
        Response.Redirect("Usage_Home.aspx?success1=true");
    }
}