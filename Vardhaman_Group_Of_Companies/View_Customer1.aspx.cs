using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class View_Customer1 : System.Web.UI.Page
{
    public string val, val1, a;
    int i1;
    static string val44;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_customer";
            val1 = Session["project_id"].ToString() + "_complex";
            val44 = Session["project_id"].ToString() + "_ledger_account";
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
        a = Request.QueryString["id"];
        if (!IsPostBack)
        {

            if (a != null)
            {
                string strquery = "select * from " + val + " where cust_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtname.Text = dr.GetString(2);
                    txtmob1.Text = dr.GetString(3);
                    txtmob2.Text = dr.GetString(4);
                    txtcaddress.InnerText = dr.GetString(5);
                    txtpaddress.InnerText = dr.GetString(6);
                    txtemail.Text = dr.GetString(7);
                    txtbdate.Text = dr.GetString(8);
                    cn.Text = dr.GetString(10);
                    bn.Text = dr.GetString(12);
                    txtbldgno.Text = dr.GetString(13);
                    wing.Text = dr.GetString(14);
                    ff.Text = dr.GetString(15);
                    fn.Text = dr.GetString(16);
                    txtflattype.Text = dr.GetString(17);
                    txtarea.Text = dr.GetValue(18).ToString();
                    txtrate.Text = dr.GetValue(19).ToString();
                    txtamount.Text = dr.GetValue(20).ToString();
                    txtdevchrg.Text = dr.GetValue(21).ToString();
                    txtsctchrg.Text = dr.GetValue(22).ToString();
                    txtstvat.Text = dr.GetValue(23).ToString();
                    txtagree.Text = dr.GetValue(24).ToString();
                    txtdocu.Text = dr.GetValue(25).ToString();
                    txtmain10.Text = dr.GetValue(26).ToString();
                    txtduty.Text = dr.GetValue(27).ToString();
                    txtother.Text = dr.GetValue(28).ToString();
                    txttotal.Text = dr.GetValue(29).ToString();
                    TextBox1.Text = dr.GetValue(30).ToString();
                    TextBox2.Text = dr.GetValue(31).ToString();
                    av.Text = dr.GetValue(32).ToString();
                    ocr.Text = dr.GetValue(33).ToString();
                    em.Text = dr.GetValue(34).ToString();
                    loan.Text=dr.GetValue(35).ToString();
                    txtcomment.InnerText = dr.GetString(37);
                }
                dr.Close();
                string strquery1 = "select ledger_name from "+val44+" where id='" + a + "'";
                SqlDataReader dr1;
                SqlCommand cmd1 = new SqlCommand(strquery1, con1);
                dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    ledger.Text = dr1.GetString(0);
                }
                dr1.Close();
            }
        }
    }
    protected void btned_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update_Customer1.aspx?id="+a);
    }
}