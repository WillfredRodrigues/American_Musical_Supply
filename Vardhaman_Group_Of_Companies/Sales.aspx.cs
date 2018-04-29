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

public partial class Sales : System.Web.UI.Page
{
    public string val, val1, sp, sp1, mn, vn;
    int i1;
    string h;
    static string h4, val44, val45, val46;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Sales";
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

            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Sales Entry Has Successfully Been Added');</script>");

            }

        }
    }

    public static string d()
    {
        return h4;
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {

        String strConnString = System.Configuration.ConfigurationManager
                             .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s = "select name from  " + val44 + "  where name='" + txtvname.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            sp = dr.GetString(0);

        }
        dr.Close();
        string s1 = "select name from  " + val44 + "  where name='" + txtpurby.Text + "'";
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
            int j;
            Random r = new Random();
            j = r.Next();
            string g = txtmname.Text + j;
            string s12 = "select name from " + val45 + " where name='" + txtmname.Text + "'";
            SqlDataReader dr12;
            SqlCommand cmd222 = new SqlCommand(s12, con);
            dr12 = cmd222.ExecuteReader();
            while (dr12.Read())
            {
                h = dr12.GetString(0).ToLower();
            }
            dr12.Close();
            if (h == txtmname.Text.ToLower())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);

                if (txtqty.Text != "")
                {
                    string strq2 = "update  " + val45 + " set quantity=quantity-'" + Convert.ToInt32(txtqty.Text) + "' where name='" + txtmname.Text + "'";
                    SqlCommand cmd2 = new SqlCommand(strq2, con);
                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                    DataSet ds2 = new DataSet();
                    da2.Fill(ds2, val45);
                    string strq3 = "update  " + val44 + "  set balance=balance+'" + amt.Value + "' where name='" + txtvname.Text + "'";
                    SqlCommand cmd3 = new SqlCommand(strq3, con);
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    DataSet ds3 = new DataSet();
                    da3.Fill(ds3, val44);
                    string strq = "insert into  " + val + "  values('" + g + "','" + txtmname.Text + "','" + txtqty.Text + "','" + txtqtype.Text + "','" + txtrate.Text + "','" + amt.Value + "','" + txtvname.Text + "','" + txtadd.InnerText + "','" + txtmob.Text + "','" + txtpurby.Text + "','','" + amt.Value + "','','','','','" + type.SelectedItem.Text + "','" + txtpdate.Text + "','"+DateTime.Now+"','" + challan.Text + "','" + bill.Text + "','" + txtcomment.InnerText + "')";
                    SqlCommand cmd11 = new SqlCommand(strq, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd11);
                    DataSet ds = new DataSet();
                    da.Fill(ds, val);
                    con.Close();
                    Response.Redirect("Sales.aspx?success=true");
                }
            }


            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);

               
                string strq3 = "update  " + val44 + "  set balance=balance+'" + amt.Value + "' where name='" + txtvname.Text + "'";
                SqlCommand cmd3 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val44);
                string strq = "insert into  " + val + "  values('" + g + "','" + txtmname.Text + "','" + txtqty.Text + "','" + txtqtype.Text + "','" + txtrate.Text + "','" + amt.Value + "','" + txtvname.Text + "','" + txtadd.InnerText + "','" + txtmob.Text + "','" + txtpurby.Text + "','','" + amt.Value + "','','','','','" + type.SelectedItem.Text + "','" + txtpdate.Text + "','"+DateTime.Now+"','" + challan.Text + "','" + bill.Text + "','" + txtcomment.InnerText + "')";
                SqlCommand cmd11 = new SqlCommand(strq, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd11);
                DataSet ds = new DataSet();
                da.Fill(ds, val);
                con.Close();
                Response.Redirect("Sales.aspx?success=true");

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
                cmd.CommandText = "select name from " + val45 + " where " +
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
                cmd.CommandText = "select name from  " + val44 + "  where name like @SearchText + '%' ";
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
                cmd.CommandText = "select name from  " + val44 + "  where " +
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



}