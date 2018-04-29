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

public partial class Delete_Journal : System.Web.UI.Page
{
    public string val, val1, a, type, val3;
    int i1;
    static string val44, val45, val46, gen, gen1, gen2, gen3, ty, ty1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_Journal";
            val1 = Session["project_id"].ToString() + "_complex";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
            val3 = Session["project_id"].ToString();
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
                    txtname.Text = dr.GetString(4);
                    txtamt.Text = dr.GetValue(5).ToString();
                    txtnara.InnerText = dr.GetString(12);
                    txtdesc.InnerText = dr.GetString(13);

                }
                dr.Close();
                string strquery1 = "select main_name from  " + val44 + "  where name='" + txtname.Text + "'";
                SqlDataReader dr1;
                SqlCommand cmd1 = new SqlCommand(strquery1, con1);
                dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    ty = dr1.GetString(0);


                }
                dr1.Close();
                string strquery2 = "select main_name from  " + val44 + "  where name='" + txtacc.Text + "'";
                SqlDataReader dr2;
                SqlCommand cmd2 = new SqlCommand(strquery2, con1);
                dr2 = cmd2.ExecuteReader();
                while (dr2.Read())
                {
                    ty = dr2.GetString(0);


                }
                dr2.Close();
            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager
                        .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        string s = "select type from  " + val44 + "  where name='" + txtname.Text + "'";
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            type = dr.GetString(0);

        }
        dr.Close();
        string s78 = "select display from ledger where name='" + ty + "'";
        SqlDataReader dr78;
        SqlCommand cmd78 = new SqlCommand(s78, con);
        dr78 = cmd78.ExecuteReader();
        while (dr78.Read())
        {
            gen2 = dr78.GetString(0);

        }
        dr78.Close();
        string s74 = "select display from ledger where name='" + ty1 + "'";
        SqlDataReader dr74;
        SqlCommand cmd74 = new SqlCommand(s74, con);
        dr74 = cmd74.ExecuteReader();
        while (dr74.Read())
        {
            gen3 = dr74.GetString(0);

        }
        dr74.Close();
        string strq11 = "delete from  " + val + "   where pay_id='" + a + "'";
        SqlCommand cmd111 = new SqlCommand(strq11, con);
        SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
        DataSet ds11 = new DataSet();
        da11.Fill(ds11, val);
        if (gen2 == "Liability")
        {
            string strq10000 = "update  " + val44 + "  set balance=balance-'" + txtamt.Text + "' where name='" + txtname.Text + "' ";
            SqlCommand cmd10000 = new SqlCommand(strq10000, con);
            SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
            DataSet ds10000 = new DataSet();
            da10000.Fill(ds10000, val44);
        }
        else if (gen2 == "Assets")
        {
            string strq10000 = "update  " + val44 + "  set balance=balance+'" + txtamt.Text + "' where name='" + txtname.Text + "' ";
            SqlCommand cmd10000 = new SqlCommand(strq10000, con);
            SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
            DataSet ds10000 = new DataSet();
            da10000.Fill(ds10000, val44);
        }
        else if (gen2 == "Expenses")
        {
            string strq10000 = "update  " + val44 + "  set balance=balance+'" + txtamt.Text + "' where name='" + txtname.Text + "' ";
            SqlCommand cmd10000 = new SqlCommand(strq10000, con);
            SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
            DataSet ds10000 = new DataSet();
            da10000.Fill(ds10000, val44);
        }
        else if (gen2 == "Income")
        {
            string strq10000 = "update  " + val44 + "  set balance=balance-'" + txtamt.Text + "' where name='" + txtname.Text + "' ";
            SqlCommand cmd10000 = new SqlCommand(strq10000, con);
            SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
            DataSet ds10000 = new DataSet();
            da10000.Fill(ds10000, val44);
        }
        if (gen3 == "Liability")
        {
            string strq5 = "update " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
            SqlCommand cmd5 = new SqlCommand(strq5, con);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataSet ds5 = new DataSet();
            da5.Fill(ds5, val44);
            Response.Redirect("Data_Entry_Home.aspx?success16=true");
        }
        else if (gen3 == "Assets")
        {
            string strq5 = "update " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
            SqlCommand cmd5 = new SqlCommand(strq5, con);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataSet ds5 = new DataSet();
            da5.Fill(ds5, val44);
            Response.Redirect("Data_Entry_Home.aspx?success16=true");
        }
        else if (gen3 == "Expenses")
        {
            string strq5 = "update " + val44 + " set balance=balance-'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
            SqlCommand cmd5 = new SqlCommand(strq5, con);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataSet ds5 = new DataSet();
            da5.Fill(ds5, val44);
            Response.Redirect("Data_Entry_Home.aspx?success16=true");
        }
        else if (gen3 == "Income")
        {
            string strq5 = "update " + val44 + " set balance=balance+'" + Convert.ToDouble(txtamt.Text) + "' where name='" + txtacc.Text + "'";
            SqlCommand cmd5 = new SqlCommand(strq5, con);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataSet ds5 = new DataSet();
            da5.Fill(ds5, val44);
            Response.Redirect("Data_Entry_Home.aspx?success16=true");
        }



    }
}