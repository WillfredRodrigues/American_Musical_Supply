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

public partial class Customer_Entry : System.Web.UI.Page
{
    public string val, val1;
    int i1;
    static string val44, val45, val46;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_complex";
            val1 = Session["project_id"].ToString() + "_customer";
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
                Response.Write("<script>alert('Customer Entry Has Successfully Been Added');</script>");

            }

            complex.AppendDataBoundItems = true;
            string s = "select distinct complex_id,complex_name from " + val + " where cust_id='' and cust_name=''";
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = s;
            cmd.Connection = con;
            try
            {
                con.Open();
                complex.DataSource = cmd.ExecuteReader();
                complex.DataTextField = "complex_name";
                complex.DataValueField = "complex_id";
                complex.DataBind();
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
    protected void chk1_CheckedChanged(object sender, EventArgs e)
    {
        if (chk1.Checked == true)
        {
            txtpaddress.InnerText = txtcaddress.InnerText;
        }
        else
        {
            txtpaddress.InnerText = "";
        }
    }
    protected void complex_SelectedIndexChanged(object sender, EventArgs e)
    {
        building.Focus();
        building.Items.Clear();
        txtbldgno.Text = "";
        wing.Items.Clear();
        floor.Items.Clear();
        flatno.Items.Clear();
        txtarea.Text = "";
        txtrate.Text = "";
        txtflattype.Text = "";
        building.AppendDataBoundItems = true;
        building.Items.Add("---Select Building---");
        string s = "select distinct building_id,building_name from " + val + " where complex_id=@id and  cust_id='' and cust_name=''";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@id", complex.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            building.DataSource = cmd.ExecuteReader();
            building.DataTextField = "building_name";
            building.DataValueField = "building_id";
            building.DataBind();
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
    protected void building_SelectedIndexChanged(object sender, EventArgs e)
    {
        wing.Focus();
        wing.Items.Clear();
        txtbldgno.Text = "";
        floor.Items.Clear();
        flatno.Items.Clear();
        txtarea.Text = "";
        txtrate.Text = "";
        txtflattype.Text = "";
        wing.AppendDataBoundItems = true;
        wing.Items.Add("---Select Wing---");
        string s = "select distinct(wing) from  " + val + "  where complex_id='"+complex.SelectedItem.Value+"' and  building_id=@id and cust_id='' and cust_name='' ";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();

        cmd.Parameters.AddWithValue("@id", building.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            wing.DataSource = cmd.ExecuteReader();
            wing.DataTextField = "wing";

            wing.DataBind();
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

        string s1 = "select building_no from  " + val + "  where complex_id='"+complex.SelectedItem.Value+"' and building_id='" + building.SelectedItem.Value + "' and cust_id='' and cust_name=''";
        String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(strConnString1);
        con1.Open();
        SqlDataReader dr1;
        SqlCommand cmd1 = new SqlCommand(s1, con1);
        dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            txtbldgno.Text = dr1.GetString(0);

        }
        dr1.Close();
    }
    protected void wing_SelectedIndexChanged(object sender, EventArgs e)
    {
        floor.Focus();
        floor.Items.Clear();
       
        flatno.Items.Clear();
        txtarea.Text = "";
        txtrate.Text = "";
        txtflattype.Text = "";
        floor.AppendDataBoundItems = true;
        floor.Items.Add("---Select Floor---");
        string s = "select distinct(flat_floor) from  " + val + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='"+building.SelectedItem.Value+"' and wing=@id and cust_id='' and cust_name=''";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();

        cmd.Parameters.AddWithValue("@id", wing.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            floor.DataSource = cmd.ExecuteReader();
            floor.DataTextField = "flat_floor";

            floor.DataBind();
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
    protected void floor_SelectedIndexChanged(object sender, EventArgs e)
    {
        flatno.Focus();
        flatno.Items.Clear();
        
        txtarea.Text = "";
        txtrate.Text = "";
        txtflattype.Text = "";
        flatno.AppendDataBoundItems = true;
        flatno.Items.Add("---Select Flat No---");
        string s = "select distinct(flat_no) from  " + val + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and wing='"+wing.SelectedItem.Text+"' and flat_floor=@id and cust_id='' and cust_name='' ";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();

        cmd.Parameters.AddWithValue("@id", floor.SelectedItem.Text);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = s;
        cmd.Connection = con;
        try
        {
            con.Open();
            flatno.DataSource = cmd.ExecuteReader();
            flatno.DataTextField = "flat_no";

            flatno.DataBind();
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
    protected void flatno_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = "select flat_type,flat_area from  " + val + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and building_no='" + txtbldgno.Text + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor='" + floor.SelectedItem.Text + "' and flat_no='" + flatno.SelectedItem.Text + "' and cust_id='' and cust_name=''";
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(s, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtflattype.Text = dr.GetString(0);
            txtarea.Text = dr.GetString(1);
            if (txtrate.Text != "")
            {
                txtamount.Text = Convert.ToString(Convert.ToDouble(txtarea.Text) * Convert.ToDouble(txtrate.Text));
                txtam.Value = Convert.ToString(Convert.ToDouble(txtarea.Text) * Convert.ToDouble(txtrate.Text));
            }
            if (txtrate.Text != "" && txtdevchrg.Text != "" && txtsctchrg.Text != "" && txtstvat.Text != "" && txtagree.Text != "" && txtdocu.Text != "" && txtmain10.Text != "" && txtduty.Text != "" && txtother.Text != "")
            {
               
                txttotal.Text = Convert.ToString(Convert.ToDouble(txtamount.Text) + Convert.ToDouble(txtdevchrg.Text) + Convert.ToDouble(txtsctchrg.Text) + Convert.ToDouble(txtstvat.Text) + Convert.ToDouble(txtagree.Text) + Convert.ToDouble(txtdocu.Text) + Convert.ToDouble(txtmain10.Text) + Convert.ToDouble(txtduty.Text) + Convert.ToDouble(txtother.Text));
                txtam1.Value = txttotal.Text = Convert.ToString(Convert.ToDouble(txtamount.Text) + Convert.ToDouble(txtdevchrg.Text) + Convert.ToDouble(txtsctchrg.Text) + Convert.ToDouble(txtstvat.Text) + Convert.ToDouble(txtagree.Text) + Convert.ToDouble(txtdocu.Text) + Convert.ToDouble(txtmain10.Text) + Convert.ToDouble(txtduty.Text) + Convert.ToDouble(txtother.Text));
            } 
        }
        dr.Close();
        txtrate.Focus();
    }


    protected void btnSub_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot();", true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot1();", true);

        int j;
        Random r = new Random();
        j = r.Next();
        string g = cname.Value + j;
        
            String strConnString = System.Configuration.ConfigurationManager
                           .ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            
            string strq = "insert into " + val1 + " values('" + g + "','" + cname.Value + "','" + txtmob1.Text + "','" + txtmob2.Text + "','" + txtcaddress.InnerText + "','" + txtpaddress.InnerText + "','" + txtemail.Text + "','"+txtbdate.Text+"','" + complex.SelectedItem.Value + "','" + complex.SelectedItem.Text + "','" + building.SelectedItem.Value + "','" + building.SelectedItem.Text + "','" + txtbldgno.Text + "','" + wing.SelectedItem.Text + "','" + floor.SelectedItem.Text + "','" + flatno.SelectedItem.Text + "','" + txtflattype.Text + "','" + txtarea.Text + "','" + txtrate.Text + "','" + txtam.Value + "','" + txtdevchrg.Text + "','" + txtsctchrg.Text + "','" + txtstvat.Text + "','" + txtagree.Text + "','" + txtdocu.Text + "','" + txtmain10.Text + "','" + txtduty.Text + "','" + txtother.Text + "','" + txtam1.Value + "','0','" + txtam1.Value + "','" + av.Text + "','" + hocr.Value + "','" + hem.Value + "','" + loan.Text + "','"+DateTime.Now+"','" + txtcomment.InnerText + "')";
            SqlCommand cmd1 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, val1);
            string strq1 = "insert into  "+val44+"  values('" + g + "','" + cname.Value + "','" + nid.Value + "','" + nname.Value + "','" + val1 + "','Customer','"+txtam1.Value+"','"+mainid.Value+"','"+mainname.Value+"')";
            SqlCommand cmd11 = new SqlCommand(strq1, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd11);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1, val44);
            string strq11 = "update  " + val + "  set cust_id='" + g + "',cust_name='" + cname.Value + "',date='"+DateTime.Now+"' where complex_id='" + complex.SelectedItem.Value + "' and complex_name='" + complex.SelectedItem.Text + "' and building_id='" + building.SelectedItem.Value + "' and building_name='" + building.SelectedItem.Text + "' and building_no='" + txtbldgno.Text + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor='" + floor.SelectedItem.Text + "' and flat_no='" + flatno.SelectedItem.Text + "'";
            SqlCommand cmd111 = new SqlCommand(strq11, con);
            SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
            DataSet ds11 = new DataSet();
            da11.Fill(ds11, val);
            con.Close();
            
            Response.Redirect("Customer_Entry.aspx?success=true");
        }
        
    
    


    protected void f_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
