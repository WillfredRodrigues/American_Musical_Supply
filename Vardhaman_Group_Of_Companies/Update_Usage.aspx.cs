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

public partial class Update_Usage : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2;
    int i1, i2, i3;
    string h;
    static string h4,val44,val45,val46;
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
                bp1.Value = bp;
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
                    mat1.Value = dr.GetString(3).ToLower();
                    txtqty.Text = dr.GetValue(4).ToString();
                    i11.Value = dr.GetValue(4).ToString();
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
                    avail.Text = dr3.GetValue(0).ToString();
                }
                dr3.Close();
            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        i1 = Convert.ToInt32(i11.Value);
        mat = mat1.Value;
        String strConnString = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        string s = "select name from  "+val44+"  where name='" + txtuby.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            sp = dr.GetString(0);

        }
        dr.Close();
        if (sp != txtuby.Text)
        {
            Response.Write("<script>alert('Not Valid  Name')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtuby&id1=" + val + "&id2=Used By');", true);
        }
        else
        {
            if (txtmname.Text.ToLower() == mat)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total10();", true);
                i2 = Convert.ToInt32(txtqty.Text);

                i3 = i1 - i2;
                string strq2 = "update  "+val45+" set quantity=quantity+'" + i1 + "' where  id='" + bp1.Value + "'";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val45);
                string strq4 = "update  " + val45 + " set quantity=quantity-'" + i2 + "' where  id='" + bp1.Value + "'";
                SqlCommand cmd4 = new SqlCommand(strq4, con);
                SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
                DataSet ds4 = new DataSet();
                da4.Fill(ds4, val45);
                string strq3 = "update " + val + " set material_name='" + txtmname.Text + "',quantity='" + txtqty.Text + "',quantity_type='" + txtqtype.Text + "',used_by='" + txtuby.Text + "',balance_material='" + bal.Value + "',balance_material_type='" + type.SelectedItem.Text+ "',use_date='" + txtudate.Text+ "',comment='" + txtcomment.InnerText + "' where use_id='" + bp1.Value + "'";
                SqlCommand cmd3 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val);
                Response.Redirect("Usage_Home.aspx?success=true");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total10();", true);
                i2 = Convert.ToInt32(txtqty.Text);
                string strq2 = "update  " + val45 + " set quantity=quantity+'" + i1 + "' where id='" + bp1.Value + "'";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val45);
                string s11 = "select name from " + val45 + " where name='" + txtmname.Text + "'";
                SqlDataReader dr11;
                SqlCommand cmd11 = new SqlCommand(s11, con);
                dr11 = cmd11.ExecuteReader();
                while (dr11.Read())
                {
                    sp2 = dr11.GetString(0).ToLower();

                }
                dr11.Close();
                if (sp2 == txtmname.Text.ToLower())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total10();", true);
                    i2 = Convert.ToInt32(txtqty.Text);

                    i3 = i2 - i1;
                    string strq22 = "update  " + val45 + " set quantity=quantity-'" + i2 + "' where  name='" + sp2 + "'";
                    SqlCommand cmd22 = new SqlCommand(strq22, con);
                    SqlDataAdapter da22 = new SqlDataAdapter(cmd22);
                    DataSet ds22 = new DataSet();
                    da22.Fill(ds22, val45);
                    string strq3 = "update " + val + " set material_name='" + txtmname.Text + "',quantity='" + txtqty.Text + "',quantity_type='" + txtqtype.Text + "',used_by='" + txtuby.Text + "',balance_material='" + bal.Value + "',balance_material_type='" + type.SelectedItem.Text + "',use_date='" + txtudate.Text + "',comment='" + txtcomment.InnerText + "' where use_id='" + bp1.Value + "'";
                    SqlCommand cmd3 = new SqlCommand(strq3, con);
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    DataSet ds3 = new DataSet();
                    da3.Fill(ds3, val);
                    Response.Redirect("Usage_Home.aspx?success=true");
                }
                else
                {
                    txtmname.Focus();
                }
            }



        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers2(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(name) from " + val45 + " where " +
                "name like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers1(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(type) from " + val45 + " where " +
                "type like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["type"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers3(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(name) from "+val44+" where " +
                " name  like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["used_by"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }

}