﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Configuration;
using System.Web.Script.Serialization;

public partial class Add_Ledger : System.Web.UI.Page
{
    public string s1,c2;
    public string s, s3, s2, s4,c1;
    static string val44, val45;
    protected void Page_Load(object sender, EventArgs e)
    {
        val44 = Session["project_id"].ToString() + "_ledger_account";
        val45 = Session["project_id"].ToString() + "_material";
        txt1.Focus();
       
        s = Request.QueryString["id"];
        if (s!="")
        {
            txttt.Value = s;
        }
        s2 = Request.QueryString["id1"];
        if (s2 != "")
        {
            txttt1.Value = s2;
        }
        s3 = Request.QueryString["id2"];
        if (s3 != "")
        {
            txttt2.Value = s3;
        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

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
                cmd.CommandText = "select name from ledger where " +
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
    public static List<string> SearchCustomers3(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["conString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select name from  "+val44+"  where name like @SearchText + '%' ";
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
    protected void btn2_Click(object sender, EventArgs e)
    {
       String strConnString89 = System.Configuration.ConfigurationManager
                          .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con89 = new SqlConnection(strConnString89);
        con89.Open();
        string s89 = "select name from  " + val44 + "  where name='" + txt1.Text + "'";
        SqlDataReader dr89;
        SqlCommand cmd89 = new SqlCommand(s89, con89);
        dr89 = cmd89.ExecuteReader();
        while (dr89.Read())
        {
            c2 = dr89.GetString(0).ToLower();

        }
        dr89.Close();
        if (c2 == txt1.Text.ToLower())
        {
            Response.Write("<script>alert('This Entry Has Already Been Made');</script>");
            txt1.Text = "";
            txt1.Focus();
        }
        else
        {
            String strConnString6 = System.Configuration.ConfigurationManager
                              .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con6 = new SqlConnection(strConnString6);
            con6.Open();
            string s = "select name from ledger where name='" + txt.Text + "'";
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand(s, con6);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                c1 = dr.GetString(0);

            }
            dr.Close();
            if (c1 != txt.Text)
            {

                Response.Write("<script>alert('Group Name Invalid');</script>");
                txt.Text = "";
                txt.Focus();
            }
            else
            {
                string strquery = "select id,name,under from ledger where name='" + txt.Text + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr9;
                SqlCommand cmd9 = new SqlCommand(strquery, con1);
                dr9 = cmd9.ExecuteReader();
                while (dr9.Read())
                {
                    TextBox1.Text = dr9.GetValue(0).ToString();
                    TextBox3.Text = dr9.GetString(1);
                    TextBox2.Text = dr9.GetValue(2).ToString();
                }
                dr9.Close();
                if (TextBox2.Text != "0")
                {
                    while (Convert.ToInt32(TextBox2.Text) != 0)
                    {
                        string strquery1 = "select id,name,under from ledger where id='" + TextBox2.Text + "'";
                        SqlDataReader dr8;
                        SqlCommand cmd8 = new SqlCommand(strquery1, con1);
                        dr8 = cmd8.ExecuteReader();
                        while (dr8.Read())
                        {
                            TextBox1.Text = dr8.GetValue(0).ToString();
                            TextBox3.Text = dr8.GetString(1);
                            TextBox2.Text = dr8.GetValue(2).ToString();
                        }
                        dr8.Close();
                    }
                }
                int j;
                Random r = new Random();
                j = r.Next();
                string g = txt1.Text + j;
                String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string s1 = "select id from ledger where name='" + txt.Text + "'";
                SqlDataReader dr1;
                SqlCommand cmd11 = new SqlCommand(s1, con);
                dr1 = cmd11.ExecuteReader();
                while (dr1.Read())
                {
                    hf.Value = dr1.GetValue(0).ToString();
                }
                dr1.Close();

                string strq = "insert into   " + val44 + "   values('" + g + "','" + txt1.Text + "','" + hf.Value + "','" + txt.Text + "','" + txttt1.Value + "','" + txttt2.Value + "','','" + TextBox1.Text + "','" + TextBox3.Text + "')";
                SqlCommand cmd1 = new SqlCommand(strq, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                DataSet ds = new DataSet();
                da.Fill(ds, val44);
                Response.Write("<script>window.close()</script>");
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "mname();", true);
            }
        }
    }
}