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

public partial class Update_Contra1 : System.Web.UI.Page
{
    public string val, val1, a, type, val3, x, y, z, s, sp, ty, c1, c2, ba;
    public static string type1;
    int i1;
    static string val44, val45, val46;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_contra";
            val1 = Session["project_id"].ToString() + "_complex";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
            val3 = Session["project_id"].ToString();
            sp = val3;
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
                    x1.Value = dr.GetString(3);
                    txtname.Text = dr.GetString(4);
                    y1.Value = dr.GetString(4);
                    txtamt.Text = dr.GetValue(5).ToString();
                    y2.Value = dr.GetValue(5).ToString();
                    txtchkddno.Text = dr.GetString(6);
                    txtchkdddate.Text = dr.GetString(7);
                    txtbn.Text = dr.GetString(8);
                    txtaccbal.Text = dr.GetValue(11).ToString();
                    txtnara.InnerText = dr.GetString(12);
                    txtdesc.InnerText = dr.GetString(13);

                }
                dr.Close();

               
                    string strquery2 = "select balance from  " + val46 + "  where ac_name='" + txtname.Text + "'";
                    SqlDataReader dr2;
                    SqlCommand cmd2 = new SqlCommand(strquery2, con1);
                    dr2 = cmd2.ExecuteReader();
                    while (dr2.Read())
                    {
                        txtbal.Text = dr2.GetValue(0).ToString();

                    }
                    dr2.Close();
                    string strquery12 = "select balance from  " + val46 + "  where ac_name='" + txtacc.Text + "'";
                    SqlDataReader dr12;
                    SqlCommand cmd12 = new SqlCommand(strquery12, con1);
                    dr12 = cmd12.ExecuteReader();
                    while (dr12.Read())
                    {
                        txtaccbal.Text = dr12.GetValue(0).ToString();

                    }
                    dr12.Close();
               
            }
        }
    }
    protected void txtacc_TextChanged(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                         .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();


        s = "select balance from " + val46 + " where ac_name='" + txtacc.Text + "' ";

        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtaccbal.Text = dr.GetValue(0).ToString();

        }
        dr.Close();
    }
    protected void txtname_TextChanged(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                        .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();


        s = "select balance from " + val46 + " where ac_name='" + txtname.Text + "' ";

        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtaccbal.Text = dr.GetValue(0).ToString();

        }
        dr.Close();
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select ac_name from  " + val46 + "  where " +
                "ac_name like '%'+@SearchText+'%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["ac_name"].ToString());
                        

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
                cmd.CommandText = "select ac_name from " + val46 + " where " +
                "ac_name like '%'+@SearchText+'%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["ac_name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s = "select ac_name from  " + val46 + "  where ac_name='" + txtname.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            c1 = dr.GetString(0);

        }
        dr.Close();
        string s1 = "select ac_name from " + val46 + " where ac_name='" + txtacc.Text + "'";
        SqlDataReader dr1;
        SqlCommand cmd1 = new SqlCommand(s1, con);
        dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            c2 = dr1.GetString(0);

        }
        dr1.Close();
        if (c1 != txtname.Text)
        {
            Response.Write("<script>alert('Not Valid Account Name')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtname&id1=" + val + "&id2=Payment');", true);
        }
        else if (c2 != txtacc.Text)
        {
            Response.Write("<script>alert('Not Valid Account Name')</script>");

        }
        else
        {


           
                string strq7 = "update   " + val46 + "  set balance=balance-'" + Convert.ToDouble(y2.Value) + "' where ac_name='" + y1.Value + "'";
                SqlCommand cmd7 = new SqlCommand(strq7, con);
                SqlDataAdapter da7 = new SqlDataAdapter(cmd7);
                DataSet ds7 = new DataSet();
                da7.Fill(ds7, val44);
                string strq9 = "update " + val46 + " set balance=balance+'" + Convert.ToDouble(y2.Value) + "' where ac_name='" + x1.Value + "'";
                SqlCommand cmd9 = new SqlCommand(strq9, con);
                SqlDataAdapter da9 = new SqlDataAdapter(cmd9);
                DataSet ds9 = new DataSet();
                da9.Fill(ds9, val46);
                if (y2.Value == txtamt.Text && x1.Value == txtacc.Text)
                {
                    ba = txtaccbal.Text;
                }
                else if (x1.Value == txtacc.Text && y2.Value != txtamt.Text)
                {
                    ba = Convert.ToString(Convert.ToDouble(txtaccbal.Text) - Convert.ToDouble(txtamt.Text) + Convert.ToDouble(y2.Value));
                }
                else
                {
                    ba = Convert.ToString(Convert.ToDouble(txtaccbal.Text) - Convert.ToDouble(txtamt.Text));
                }
               
                string strq5 = "update " + val46 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where ac_name='" + txtacc.Text + "'";
                SqlCommand cmd5 = new SqlCommand(strq5, con);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, val46);
                string strq11 = "update " + val46 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where ac_name='" + txtname.Text + "'";
                SqlCommand cmd11 = new SqlCommand(strq11, con);
                SqlDataAdapter da11 = new SqlDataAdapter(cmd11);
                DataSet ds11 = new DataSet();
                da11.Fill(ds11, val46);
                Response.Redirect("Data_Entry_Home.aspx?success13=true");
          

        }
    }
}