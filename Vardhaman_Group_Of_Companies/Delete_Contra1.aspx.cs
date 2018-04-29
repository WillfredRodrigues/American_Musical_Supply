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

public partial class Delete_Contra1 : System.Web.UI.Page
{
    public string val, val1, a, type, val3;
    int i1;
    static string val46;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_contra";
            val1 = Session["project_id"].ToString() + "_complex";
          
            val46 = Session["project_id"].ToString() + "_account";
            val3 = Session["project_id"].ToString();
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
        a = Request.QueryString["id"];
        if (!IsPostBack)
        {

            if (a != null)
            {
                string strquery = "select * from " + val + " where pay_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtdate.Text = dr.GetString(2);
                    txtacc.Text = dr.GetString(3);
                    txtname.Text = dr.GetString(4);
                    txtamt.Text = dr.GetValue(5).ToString();
                    txtnara.InnerText = dr.GetString(12);
                    txtdesc.InnerText = dr.GetString(13);

                }
                dr.Close();

            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                        .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string strq11 = "delete from  " + val + "   where pay_id='" + a + "'";
        SqlCommand cmd111 = new SqlCommand(strq11, con);
        SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
        DataSet ds11 = new DataSet();
        da11.Fill(ds11, val);
        string strq4 = "update "+val46+" set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where ac_name='" + txtacc.Text + "'";
        SqlCommand cmd4 = new SqlCommand(strq4, con);
        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
        DataSet ds4 = new DataSet();
        da4.Fill(ds4, val46);
        string strq5 = "update "+val46+" set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where ac_name='" + txtname.Text + "'";
        SqlCommand cmd5 = new SqlCommand(strq5, con);
        SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
        DataSet ds5 = new DataSet();
        da5.Fill(ds5, val46);
        Response.Redirect("Data_Entry_Home.aspx?success5=true");
    }
}