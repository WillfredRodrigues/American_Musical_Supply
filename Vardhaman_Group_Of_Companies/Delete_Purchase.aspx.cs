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

public partial class Delete_Purchase : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2;
    int i1, i2, i3;
    string h;
    static string h4,val45,val44;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_purchase";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
           
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
                bp1.Value = bp;
                string strquery = "select * from " + val + " where purchase_id='" + bp + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtmname.Text = dr.GetString(2);
                    mat1.Value = dr.GetString(2).ToLower();
                    i11.Value = dr.GetValue(3).ToString();
                    txtqty.Text = dr.GetValue(3).ToString();
                    txtqtype.Text = dr.GetString(4);
                    txtrate.Text = dr.GetValue(5).ToString();
                    txtamt.Text = dr.GetValue(6).ToString();
                    amt.Value = dr.GetValue(6).ToString();
                    txtvname.Text = dr.GetString(7);
                    vn1.Value = dr.GetString(7);
                    txtadd.InnerText = dr.GetString(8);
                    txtmob.Text = dr.GetString(9);
                    txtpurby.Text = dr.GetString(10);
                    pb1.Value = dr.GetString(10);
                    txtpdate.Text = dr.GetString(18);
                    challan.Text = dr.GetString(20);
                    bill.Text = dr.GetString(21);
                    txtcomment.InnerText = dr.GetString(22);

                    if (dr.GetString(17) == "Site")
                    {
                        type.SelectedIndex = 0;
                    }
                    else
                    {
                        type.SelectedIndex = 1;
                    }
                }
                dr.Close();
            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        i1 = Convert.ToInt32(i11.Value);
        mat = mat1.Value;
        pb = pb1.Value;
        vn = vn1.Value;
        String strConnString = System.Configuration.ConfigurationManager
                         .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        i2 = Convert.ToInt32(txtqty.Text);
        string strq2 = "update  "+val45+" set quantity=quantity-'" + i2 + "' where  id='" + bp1.Value + "'";
        SqlCommand cmd2 = new SqlCommand(strq2, con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2, val45);
        string strq3 = "delete from " + val + "  where purchase_id='" + bp1.Value + "'";
        SqlCommand cmd3 = new SqlCommand(strq3, con);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataSet ds3 = new DataSet();
        da3.Fill(ds3, val);
        string strq10000 = "update  " + val44 + "  set balance=balance-'" + txtamt.Text + "' where name='" + txtvname.Text + "' and type='Vendor'";
        SqlCommand cmd10000 = new SqlCommand(strq10000, con);
        SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
        DataSet ds10000 = new DataSet();
        da10000.Fill(ds10000, val44);
        Response.Redirect("Purchase_Home.aspx?success1=true");
    }
}