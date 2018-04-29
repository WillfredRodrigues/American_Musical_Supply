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

public partial class Usage : System.Web.UI.Page
{
    public string val,op,sp,op1;
    int i1;
    static string h4,val44,val45,val46;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_usage";
            h4 = val;
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
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
                Response.Write("<script>alert('Usage Entry Has Successfully Been Added');</script>");

            }
        }
            
    }
    public static string d()
    {
        return h4;
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total10();", true);


        String strConnString = System.Configuration.ConfigurationManager
                      .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s = "select name from  "+val44+"  where  name='" + txtuby.Text + "'";
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total10();", true);
            string strq22 = "update "+val45+" set quantity=quantity-'" + txtqty.Text + "' where id='" + od.Value + "'";
            SqlCommand cmd2222 = new SqlCommand(strq22, con);
            SqlDataAdapter da22 = new SqlDataAdapter(cmd2222);
            DataSet ds22 = new DataSet();
            da22.Fill(ds22, val45);
            string strq = "insert into " + val + " values('" + txtudate.Text + "','" + od.Value + "','" + txtmname.Text + "','" + txtqty.Text + "','" + txtqtype.Text + "','" + txtuby.Text + "','" + bal.Value + "','" + type.SelectedItem.Text + "','" + DateTime.Now + "','" + txtcomment.InnerText + "')";
            SqlCommand cmd1 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, val);
            con.Close();
            Response.Redirect("Usage_Home.aspx?success2=true");
        }
       
 
    }
    protected void txtmname_TextChanged(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                           .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s1 = "select quantity,id,type from "+val45+" where name='" + txtmname.Text + "'";
        SqlDataReader dr1;
        SqlCommand cmd22 = new SqlCommand(s1, con);
        dr1 = cmd22.ExecuteReader();
        while (dr1.Read())
        {
            i1 = Convert.ToInt32(dr1.GetValue(0));
            op1 = dr1.GetString(1);
            txtqtype.Text = dr1.GetString(2);
        }
        dr1.Close();
        avail.Text = i1.ToString();
        od.Value = op1;
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
                cmd.CommandText = "select name from "+val45+" where " +
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
    public static List<string> SearchCustomers2(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct(type) from "+val45+" where " +
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
                        customers.Add(sdr["name"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }


}