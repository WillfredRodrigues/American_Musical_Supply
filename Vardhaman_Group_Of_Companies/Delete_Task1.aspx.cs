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


public partial class Delete_Task1 : System.Web.UI.Page
{
    public string val, val1, sp, vn, pb, mat, bp, sp1, sp2, val2;
    int i1, i2, i3;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Task";
            val1 = Session["project_id"].ToString() + "_contra";
            val2 = Session["project_id"].ToString() + "_journal";
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
       
            sp = Request.QueryString["id"];
            if (sp != null)
            {
                vn = Request.QueryString["id"].ToString();
            }
            String strConnString = System.Configuration.ConfigurationManager
                            .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            string s12 = "select * from " + val + " where id='" + vn + "'";
            SqlDataReader dr12;
            SqlCommand cmd222 = new SqlCommand(s12, con);
            dr12 = cmd222.ExecuteReader();
            while (dr12.Read())
            {
                name.Text=dr12.GetString(1);
                    desc.InnerText=dr12.GetString(2);
                    frmdate.Text=dr12.GetString(3);
                    todate.Text=dr12.GetString(4);
                    ass.Text = dr12.GetString(5);
                    stat.Text = dr12.GetValue(7).ToString();
            }
            
            dr12.Close();
        
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                            .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s12 = "select under from " + val + " where id='" + vn + "'";
        SqlDataReader dr12;
        SqlCommand cmd222 = new SqlCommand(s12, con);
        dr12 = cmd222.ExecuteReader();
        while (dr12.Read())
        {
            h = dr12.GetValue(0).ToString();
        }
        dr12.Close();
        if (h == "0")
        {
            string strq = "delete from  " + val + "  where id='"+vn+"' or under='"+vn+"'";
            SqlCommand cmd11 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd11);
            DataSet ds = new DataSet();
            da.Fill(ds, val);
            Response.Redirect("Task.aspx?id=success");
        }
        else
        {
            string strq = "delete from  " + val + "  where id='" + vn + "'";
            SqlCommand cmd11 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd11);
            DataSet ds = new DataSet();
            da.Fill(ds, val);
            Response.Redirect("Task.aspx?id=success");
        }
    }
}