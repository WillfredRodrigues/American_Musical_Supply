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

public partial class Update_Sales : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2;
    int i1, i2, i3;
    string h;
    static string h4;
    static string val44, val45;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Sales";
            h4 = val;
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
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
                    fama.Value = dr.GetValue(6).ToString();
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

        String strConnString = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        string s = "select name from " + val44 + " where  name='" + txtvname.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            sp = dr.GetString(0);

        }
        dr.Close();
        string s1 = "select name from " + val44 + " where  name='" + txtpurby.Text + "'";
        SqlDataReader dr1;
        SqlCommand cmd1 = new SqlCommand(s1, con);
        dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            sp1 = dr1.GetString(0);

        }
        dr1.Close();
        if (sp != txtvname.Text)
        {
            Response.Write("<script>alert('Not Valid Vendor Name')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtvname&id1=" + val + "&id2=Buyer');", true);
        }

        else if (sp1 != txtpurby.Text)
        {
            Response.Write("<script>alert('Not Valid Purchaser')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtpurby&id1=" + val + "&id2=Seller');", true);
        }
        else
        {
            string strq99 = "update  " + val44 + "  set balance=balance-'" + fama.Value + "' where name='" + vn1.Value + "' and type='Buyer'";
            SqlCommand cmd99 = new SqlCommand(strq99, con);
            SqlDataAdapter da99 = new SqlDataAdapter(cmd99);
            DataSet ds99 = new DataSet();
            da99.Fill(ds99, val44);
            if (txtmname.Text.ToLower() == mat1.Value)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);

                i2 = Convert.ToInt32(txtqty.Text);

                string strq1000 = "update  " + val44 + "  set balance=balance+'" + amt.Value + "' where name='" + txtvname.Text + "' and type='Buyer'";
                SqlCommand cmd1000 = new SqlCommand(strq1000, con);
                SqlDataAdapter da1000 = new SqlDataAdapter(cmd1000);
                DataSet ds1000 = new DataSet();
                da1000.Fill(ds1000, val44);
                i3 = i2 - i1;
                string strq4 = "update  " + val45 + " set quantity=quantity-'" + i11.Value + "' where  id='" + bp1.Value + "'";
                SqlCommand cmd4 = new SqlCommand(strq4, con);
                SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
                DataSet ds4 = new DataSet();
                da4.Fill(ds4, val45);
                string strq2 = "update  " + val45 + " set quantity=quantity+'" + i2 + "' where  id='" + bp1.Value + "'";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val45);
                string strq3 = "update " + val + " set material_name='" + txtmname.Text + "',quantity='" + txtqty.Text + "',quantity_type='" + txtqtype.Text + "',rate='" + txtrate.Text + "',amount='" + amt.Value + "',vendor_name='" + txtvname.Text + "',vendor_address='" + txtadd.InnerText + "',vendor_mobile='" + txtmob.Text + "',purchased_by='" + txtpurby.Text + "',type_of_purchase='" + type.SelectedItem.Text + "',challan='" + challan.Text + "',bill='" + bill.Text + "',comment='" + txtcomment.InnerText + "' where purchase_id='" + bp1.Value + "'";
                SqlCommand cmd3 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val);
                Response.Redirect("Sales_Home.aspx?success=true");
            }
            else
            {

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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                    i2 = Convert.ToInt32(txtqty.Text);

                    i3 = i2 - i1;
                    string strq4 = "update  " + val45 + " set quantity=quantity-'" + i11.Value + "' where  id='" + bp1.Value + "'";
                    SqlCommand cmd4 = new SqlCommand(strq4, con);
                    SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
                    DataSet ds4 = new DataSet();
                    da4.Fill(ds4, val45);
                    string strq10000 = "update  " + val44 + "  set balance=balance+'" + amt.Value + "' where name='" + txtvname.Text + "' and type='Buyer'";
                    SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                    SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                    DataSet ds10000 = new DataSet();
                    da10000.Fill(ds10000, val44);
                    string strq22 = "update  " + val45 + " set quantity=quantity+'" + i2 + "' where  name='" + sp2 + "'";
                    SqlCommand cmd22 = new SqlCommand(strq22, con);
                    SqlDataAdapter da22 = new SqlDataAdapter(cmd22);
                    DataSet ds22 = new DataSet();
                    da22.Fill(ds22, val45);
                    string strq3 = "update " + val + " set material_name='" + txtmname.Text + "',quantity='" + txtqty.Text + "',quantity_type='" + txtqtype.Text + "',rate='" + txtrate.Text + "',amount='" + amt.Value + "',vendor_name='" + txtvname.Text + "',vendor_address='" + txtadd.InnerText + "',vendor_mobile='" + txtmob.Text + "',purchased_by='" + txtpurby.Text + "',type_of_purchase='" + type.SelectedItem.Text + "',challan='" + challan.Text + "',bill='" + bill.Text + "',comment='" + txtcomment.InnerText + "' where purchase_id='" + bp1.Value + "'";
                    SqlCommand cmd3 = new SqlCommand(strq3, con);
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    DataSet ds3 = new DataSet();
                    da3.Fill(ds3, val);
                    Response.Redirect("Sales_Home.aspx?success=true");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                    int j;
                    Random r = new Random();
                    j = r.Next();
                    string g = txtmname.Text + j;
                    string strq4 = "update  " + val45 + " set quantity=quantity-'" + i11.Value + "' where  id='" + bp1.Value + "'";
                    SqlCommand cmd4 = new SqlCommand(strq4, con);
                    SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
                    DataSet ds4 = new DataSet();
                    da4.Fill(ds4, val45);
                   
                    string strq10000 = "update  " + val44 + "  set balance=balance+'" + amt.Value + "' where name='" + txtvname.Text + "'";
                    SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                    SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                    DataSet ds10000 = new DataSet();
                    da10000.Fill(ds10000, val44);
                    string strq3 = "update " + val + " set material_name='" + txtmname.Text + "',quantity='" + txtqty.Text + "',quantity_type='" + txtqtype.Text + "',rate='" + txtrate.Text + "',amount='" + amt.Value + "',vendor_name='" + txtvname.Text + "',vendor_address='" + txtadd.InnerText + "',vendor_mobile='" + txtmob.Text + "',purchased_by='" + txtpurby.Text + "',type_of_purchase='" + type.SelectedItem.Text + "',challan='" + challan.Text + "',bill='" + bill.Text + "',comment='" + txtcomment.InnerText + "' where purchase_id='" + bp1.Value + "'";
                    SqlCommand cmd3 = new SqlCommand(strq3, con);
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    DataSet ds3 = new DataSet();
                    da3.Fill(ds3, val);

                    Response.Redirect("Sales_Home.aspx?success=true");
                }
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
                cmd.CommandText = "select distinct(name) from " + val45 + " where " +
                "name like '%'+@SearchText + '%'";
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
    public static List<string> SearchCustomers2(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(type) from " + val45 + " where " +
                "type like '%'+@SearchText + '%'";
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
                cmd.CommandText = "select distinct(name) from " + val44 + " where name like '%'+@SearchText + '%'";
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
    public static List<string> SearchCustomers4(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(name) from " + val44 + " where " +
                " name like '%'+@SearchText + '%'";
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

}