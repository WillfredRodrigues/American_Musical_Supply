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

public partial class Complex : System.Web.UI.Page
{
    public string val,val1,f,f1;
    public static string sr, u, v, w, x, y, z;
    static string val44, val45;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtcmpname.Focus();
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            sr=val;
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val1 = Session["project_id"].ToString();
            txt.Text = val1;

             string strquery = "select proj_status from project_registration where proj_regi_id='"+val1+"'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    f = dr.GetString(0);
                   if(f=="Disabled")
                   {
                       Response.Redirect("Update_Project.aspx?status=false");
                   }
                }
                dr.Close();
                sh.Visible = true;
            }
        
        else
        {
            Response.Redirect("login.aspx");
        }
        sh.Visible = false;

        
       if(!IsPostBack)
       {
           string y;
            string s = Request.QueryString["id"];
            string s1 = Request.QueryString["id1"];
            string s2 = Request.QueryString["id2"];
            string s3 = Request.QueryString["id3"];
            string s4 = Request.QueryString["id4"];
            string s5 = Request.QueryString["id5"];
            if (s != null && s1 != null && s2 != null && s3 != null && s4 != null && s5 != null)
            {
                txtflatno.Focus();
                string strq = "delete from " +val+ " where ident='" + s + "'";
                String strConnString = System.Configuration.ConfigurationManager
                      .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd1 = new SqlCommand(strq, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                DataSet ds = new DataSet();
                da.Fill(ds, "val");
                pancomp.Enabled = false;
                Panel1.Enabled = true;
                string strquery = "select complex_id,complex_name,complex_location,building_id,building_name,building_no,wing,flat_floor from "+ val+"  where complex_id='" + s1 + "' and  building_id='" + s2 + "' and building_no='" + s3 + "' and wing='" + s4 + "' and flat_floor='" + s5 + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cmpid.Text = dr.GetString(0);
                    txtcmpname.Text = dr.GetString(1);
                    txtcmplocation.Text = dr.GetString(2);
                    txtbid.Text = dr.GetString(3);
                    txtbldname.Text = dr.GetString(4);
                    txtbldno.Text = dr.GetString(5);
                    txtwing.Text = dr.GetString(6);
                    txtfloor.Text = dr.GetString(7);
                }
                dr.Close();
                sh.Visible = true;
            }
           
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {

    }
    protected void Unnamed1_Click(object sender, ImageClickEventArgs e)
    {
         if (txtflatno.Text == "")
        {
            Response.Write("<script>alert('Enter Flat No');</script>");
            txtcmplocation.Focus();
        }
         else if (txttype.Text == "")
         {
             Response.Write("<script>alert('Enter Flat Type');</script>");
             txtcmplocation.Focus();
         }
         else if (txtarea.Text == "")
         {
             Response.Write("<script>alert('Enter Flat Area');</script>");
             txtcmplocation.Focus();
         }
        if (txtflatno.Text != "" && txttype.Text != "" && txtarea.Text != "")
        {

            string strquery = "select flat_no from " + val + " where complex_id='" + cmpid.Text + "' and complex_name='" + txtcmpname.Text + "' and complex_location='" + txtcmplocation.Text + "' and building_id='" + txtbid.Text + "' and building_name='" + txtbldname.Text + "' and building_no='" + txtbldno.Text + "' and wing='" + txtwing.Text + "' and flat_floor='" + txtfloor.Text + "'";
            String strConnString1 = System.Configuration.ConfigurationManager
       .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(strConnString1);
            con1.Open();
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(strquery, con1);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                f1 = dr.GetString(0);

            }
            dr.Close();

            if (f1 == txtflatno.Text)
            {
                Response.Write("<script>alert('Flat NO Already Added');</script>");
                txtflatno.Text = "";
                txtarea.Text = "";
                txttype.Text = "";
                txtflatno.Focus();
            }
            else
            {

                String strConnString = System.Configuration.ConfigurationManager
                           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                string strq = "insert into " + val + " values('" + cmpid.Text + "','" + txtcmpname.Text + "','" + txtcmplocation.Text + "','" + txtbid.Text + "','" + txtbldname.Text + "','" + txtbldno.Text + "','" + txtwing.Text + "','" + txtfloor.Text + "','" + txtflatno.Text + "','" + txttype.Text + "','" + txtarea.Text + "','','','','')";
                SqlCommand cmd1 = new SqlCommand(strq, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                DataSet ds = new DataSet();
                da.Fill(ds, val);
            }
            txtflatno.Text = "";
            txtarea.Text = "";
            txttype.Text = "";
            txtflatno.Focus();
            sh.Visible = true;
        }
       
    }
    protected void btnok_Click(object sender, EventArgs e)
    {
        if (txtcmpname.Text == "")
        {
            Response.Write("<script>alert('Enter Complex Name');</script>");
            txtcmpname.Focus();
        }
        else if (txtcmplocation.Text == "")
        {
            Response.Write("<script>alert('Enter Complex Location');</script>");
            txtcmplocation.Focus();
        }
        else if (txtbldname.Text=="")
        {
            Response.Write("<script>alert('Enter Building Name');</script>");
            txtbldname.Focus();
        }
        else if (txtfloor.Text == "")
        {
            Response.Write("<script>alert('Enter Floor No');</script>");
            txtfloor.Focus();
        }
        if (txtcmplocation.Text != "" && txtcmpname.Text != "" && txtbldname.Text != ""  && txtfloor.Text != "")
        {
            if (txtbldno.Text == "")
            {
                txtbldno.Text = "1";
            }
             if (txtwing.Text == "")
            {
                txtwing.Text = "A";
            }
           
                string f = txtcmpname.Text.ToLower();
                string g = null;
                string f1 = txtbldname.Text.ToLower();
                string g1 = null;
                for (int i = 0; i < f.Length; i++)
                {
                    if (f.ElementAt(i) == ' ')
                    {
                    }
                    else
                    {
                        g = g + f.ElementAt(i);
                    }
                }
                cmpid.Text = txt.Text + "_" + g;
                for (int i1 = 0; i1 < f1.Length; i1++)
                {
                    if (f1.ElementAt(i1) == ' ')
                    {
                    }
                    else
                    {
                        g1 = g1 + f1.ElementAt(i1);
                    }
                }
                txtbid.Text = txt.Text + "_" + g1;
                Panel1.Enabled = true;
                pancomp.Enabled = false;
                mes.Visible = true;
                txtflatno.Focus();
                sh.Visible = true;
           
        }
    }
   
    protected void btndone_Click(object sender, EventArgs e)
    {
        pancomp.Enabled = true;
        Panel1.Enabled = false;
        sh.Visible = false;
        mes.Visible = false;
        txtflatno.Text = "";
        txtarea.Text = "";
        txttype.Text = "";
        txtcmpname.Focus();
        Response.Write("<script>alert('Flats Successfully Added for: "+txtfloor.Text+" Floor');</script>");
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
                cmd.CommandText = "select distinct(complex_name) from " + sr + "";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["complex_name"].ToString());

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
                cmd.CommandText = "select distinct(building_name) from " + sr + "";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["building_name"].ToString());

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
                cmd.CommandText = "select distinct(wing) from " + sr + "  ";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["wing"].ToString());

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
                cmd.CommandText = "select distinct(flat_floor) from " + sr + "";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["flat_floor"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers5(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(complex_location) from " + sr + "";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["complex_location"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }


    protected void btndo_Click(object sender, EventArgs e)
    {
        Response.Redirect("Complex_Home.aspx?status=true");
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               