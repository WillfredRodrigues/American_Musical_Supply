using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;
using System.Windows;

public partial class Delete_Project : System.Web.UI.Page
{
    string er, y, k;
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList1.Focus();
        if (!IsPostBack)
        {

            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Project Has Successfully Been Deleted');</script>");

            }
        }
    }
   
  
    protected void submit_Click(object sender, EventArgs e)
    {
        k = Session["pid1"].ToString();
        DialogResult result = MessageBox.Show("Are You Sure You Want To Delete:" + DropDownList1.Text + " ?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
        if (result == DialogResult.Yes)
        {
            string strQuery = "update project_registration set proj_status='Disabled' ,deletion_date='"+DateTime.Now+"' where proj_regi_id ='" + k + "'";
            String strConnString = System.Configuration.ConfigurationManager
                       .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            SqlCommand cmd = new SqlCommand(strQuery, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "project_registration");

            con.Close();
            Response.Redirect("Delete_project.aspx?success=true");
        }

    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        y = DropDownList1.Text;
        for (int i = 0; i < y.Length; i++)
        {
            if (y.ElementAt(i) == ':' || y.ElementAt(i) == ' ')
            {

            }
            else
            {
                er = er + y.ElementAt(i);
            }

        }
        HttpContext.Current.Session["pid1"] = er;
        String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery = "select proj_name,proj_user_name, proj_location,proj_status from project_registration where proj_regi_id = '" + er + "'";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@CustomerID", DropDownList1.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                TextBox1.Text = sdr.GetString(0).ToString();

                TextBox3.Text = sdr.GetString(2);
                TextBox4.Text = sdr.GetString(3);

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
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
                cmd.CommandText = "select proj_name,proj_location from project_registration where " +
                "(proj_regi_id like @SearchText + '%' or proj_name like @SearchText + '%' or proj_location like @SearchText + '%') and proj_status='active'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                List<string> customers1 = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["proj_name"].ToString() + " : " + sdr["proj_location"].ToString());

                    }
                }
                conn.Close();
                return customers;

            }
        }
    }
}