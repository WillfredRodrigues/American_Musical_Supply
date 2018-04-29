using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Update_project : System.Web.UI.Page
{
    string y,er,k;
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList1.Focus();
        if (!IsPostBack)
        {

            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Project Has Successfully Been Updated');</script>");

            }
            string stat = Request.QueryString["status"];
            if (stat != null)
            {
                Response.Write("<script>alert('Project Has Been Deleted.Please Update To Continue');</script>");

            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        k = Session["pid"].ToString();
        string strQuery = "update project_registration set proj_name='" + TextBox1.Text + "', proj_location='" + TextBox3.Text + "',proj_updation_date='',proj_status='"+TextBox4.SelectedItem.Text+"' where proj_regi_id ='" + k + "'";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "project_registration");

        con.Close();
        Response.Redirect("Update_project.aspx?success=true");


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
                "proj_regi_id like @SearchText + '%' or proj_name like @SearchText + '%' or proj_location like @SearchText + '%'";
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
        HttpContext.Current.Session["pid"] = er;
        String strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String strQuery = "select proj_name,proj_user_name, proj_location,proj_status from project_registration where proj_regi_id = '"+er+"'";
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
                if (sdr.GetString(3) == "Disabled")
                {
                    TextBox4.SelectedIndex = 1;
                }
                else
                {
                    TextBox4.SelectedIndex = 0;
                }

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
}