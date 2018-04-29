using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Journal : System.Web.UI.Page
{

    string s1, s2, s3;
    public string val, val1, x, y, z, l, m, s4, sp;
    static string f, k, a, d, type1, type2,type3,gen,gen1,gen2,gen3;
    string er = null, er1 = null;
    string s, c, c1, c2, c3;
    static string val45, val44, val46;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_journal";
            val1 = Session["project_id"].ToString() + "_customer";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
            f = val;
            string val3 = Session["project_id"].ToString();
            sp = val3;
            k = val3;
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
                Response.Write("<script>alert('Journal Entry Has Successfully Been Made');</script>");
            }
        }
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
                cmd.CommandText = "select name,type,main_name from  " + val44 + "  where " +
                "name like '%'+@SearchText+'%'";
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
                        type1 = sdr["type"].ToString();
                        gen = sdr["main_name"].ToString();

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
                cmd.CommandText = "select name,type,main_name from " + val44 + " where " +
                "name like '%'+@SearchText+'%'";
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
                        type2 = sdr["type"].ToString();
                        gen1 = sdr["main_name"].ToString();

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
    protected void txtname_TextChanged(object sender, EventArgs e)
    {
        y = txtname.Text;
        for (int i = 0; i < y.Length; i++)
        {
            if (y.ElementAt(i) == ':')
            {
                for (int i1 = i + 1; i1 < y.Length; i1++)
                {
                    er = er + y.ElementAt(i1);
                }
                break;
            }
            else
            {
                er1 = er1 + y.ElementAt(i);
            }
        }
        s4 = k;
        txtname.Text = er1;
        String strConnString = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        if (type1 == "Customer")
        {
            s = "select balance from " + val44 + " where type='Customer' and name='" + txtname.Text + "' ";
        }
        else if (type1 == "Vendor")
        {
            s = "select balance from " + val44 + " where type='Vendor' and name='" + txtname.Text + "' ";
        }
        else
        {
            s = "select balance from  " + val44 + "  where name='" + txtname.Text + "' ";
        }
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtbal.Text = dr.GetValue(0).ToString();

        }
        dr.Close();
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s = "select name from  " + val44 + "  where name='" + txtname.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            c1 = dr.GetString(0);

        }
        dr.Close();
        string s1 = "select name from " + val44 + " where name='" + txtacc.Text + "'";
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
            Response.Write("<script>alert('Not Valid  Name')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtname&id1=" + val + "&id2=Journal');", true);
        }
        else if (c2 != txtacc.Text)
        {
            Response.Write("<script>alert('Not Valid  Name')</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "SelectName('Add_Ledger.aspx?id=txtacc&id1=" + val + "&id2=Journal');", true);
        }
        else
        {
            string s78 = "select display from ledger where name='" + gen + "'";
            SqlDataReader dr78;
            SqlCommand cmd78 = new SqlCommand(s78, con);
            dr78 = cmd78.ExecuteReader();
            while (dr78.Read())
            {
                gen2 = dr78.GetString(0);

            }
            dr78.Close();
            string s74 = "select display from ledger where name='" + gen1 + "'";
            SqlDataReader dr74;
            SqlCommand cmd74 = new SqlCommand(s74, con);
            dr74 = cmd74.ExecuteReader();
            while (dr74.Read())
            {
                gen3 = dr74.GetString(0);

            }
            dr74.Close();
            int j;
            Random r = new Random();
            j = r.Next();
            string g = txtname.Text + j;
            string ba = Convert.ToString(Convert.ToDouble(txtaccbal.Text) - Convert.ToDouble(txtamt.Text));
            string strq6 = "insert into  " + val + "  values('" + g + "','" + txtdate.Text + "','" + txtacc.Text + "','" + txtname.Text + "','" + txtamt.Text + "','','','','" + txtamt.Text + "','" + txtamt.Text + "','" + ba + "','" + txtnara.InnerText + "','" + txtdesc.InnerText + "','Journal')";
            SqlCommand cmd6 = new SqlCommand(strq6, con);
            SqlDataAdapter da6 = new SqlDataAdapter(cmd6);
            DataSet ds6 = new DataSet();
            da6.Fill(ds6, val);
            if (gen2 == "Liability")
            {
                string strq2 = "update  " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtname.Text + "' ";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
            }
            else if(gen2=="Assets")
            {
                string strq2 = "update  " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtname.Text + "' ";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
            }
            else if(gen2=="Expenses")
            {
                string strq2 = "update  " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtname.Text + "' ";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
            }
            else if(gen2=="Income")
            {
                string strq2 = "update  " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtname.Text + "' ";
                SqlCommand cmd2 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
            }
            if(gen3=="Liability")
            {
                string strq5 = "update " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
                SqlCommand cmd5 = new SqlCommand(strq5, con);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, val44);
                 Response.Redirect("Data_Entry_Home.aspx?success14=true");
            }
            else if(gen3=="Assets")
            {
                string strq5 = "update " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
                SqlCommand cmd5 = new SqlCommand(strq5, con);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, val44);
                 Response.Redirect("Data_Entry_Home.aspx?success14=true");
            }
            else if(gen3=="Expenses")
            {
                string strq5 = "update " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
                SqlCommand cmd5 = new SqlCommand(strq5, con);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, val44);
                 Response.Redirect("Data_Entry_Home.aspx?success14=true");
            }
            else if(gen3=="Income")
            {
                string strq5 = "update " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
                SqlCommand cmd5 = new SqlCommand(strq5, con);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, val44);
                 Response.Redirect("Journal.aspx?success=true");
            }
               
            }
           
       

    }
    protected void txtacc_TextChanged(object sender, EventArgs e)
    {
        y = txtacc.Text;
        for (int i = 0; i < y.Length; i++)
        {
            if (y.ElementAt(i) == ':')
            {
                for (int i1 = i + 1; i1 < y.Length; i1++)
                {
                    er = er + y.ElementAt(i1);
                }
                break;
            }
            else
            {
                er1 = er1 + y.ElementAt(i);
            }
        }
        s4 = k;
        txtacc.Text = er1;
        String strConnString = System.Configuration.ConfigurationManager
                         .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        if (type2 == "Customer")
        {
            s = "select balance from " + val44 + " where type='Customer' and name='" + txtacc.Text + "' ";
        }
        else if (type2 == "Vendor")
        {
            s = "select balance from " + val44 + " where type='Vendor' and name='" + txtacc.Text + "' ";
        }
        else
        {
            s = "select balance from  " + val44 + "  where name='" + txtacc.Text + "' ";
        }
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtaccbal.Text = dr.GetValue(0).ToString();

        }
        dr.Close();
    }
}