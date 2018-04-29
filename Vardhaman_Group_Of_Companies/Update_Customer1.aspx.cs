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

public partial class Update_Customer1 : System.Web.UI.Page
{
    public string val,val1,a,val2,p,q,r,s,t,paid;
    int i1,k,l,m,n,o;
    static string val44, val45, val46;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["project_id"] != null)
        {
            val = Session["project_id"].ToString() + "_customer";
            val2 = Session["project_id"].ToString() + "_Complex";
            val44 = Session["project_id"].ToString() + "_ledger_account";
            val45 = Session["project_id"].ToString() + "_material";
            val46 = Session["project_id"].ToString() + "_account";
            val1 = Session["project_id"].ToString();
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
            complex.AppendDataBoundItems = true;
            string s = "select distinct complex_id,complex_name from " + val2 + " where cust_id='' and cust_name=''";
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
           
            building.Items.Clear();
            building.AppendDataBoundItems = true;
            building.Items.Add("---Select Building---");
            string s1 = "select distinct building_id,building_name from " + val2 + " where cust_id='' and cust_name=''";
            String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(strConnString1);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Parameters.AddWithValue("@id", complex.SelectedItem.Value);
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = s1;
            cmd1.Connection = con1;
            try
            {
                con1.Open();
                building.DataSource = cmd1.ExecuteReader();
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
                con1.Close();
                con1.Dispose();
            }
            wing.Items.Clear();
            wing.AppendDataBoundItems = true;
            wing.Items.Add("---Select Wing---");
            string s11 = "select distinct(wing) from  " + val2 + "  where cust_id='' and cust_name='' ";
            String strConnString11 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con11 = new SqlConnection(strConnString11);
            SqlCommand cmd11 = new SqlCommand();

            cmd11.Parameters.AddWithValue("@id", building.SelectedItem.Value);
            cmd11.CommandType = CommandType.Text;
            cmd11.CommandText = s11;
            cmd11.Connection = con11;
            try
            {
                con11.Open();
                wing.DataSource = cmd11.ExecuteReader();
                wing.DataTextField = "wing";

                wing.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con11.Close();
                con11.Dispose();
            }
            floor.Items.Clear();
            floor.AppendDataBoundItems = true;
            floor.Items.Add("---Select Floor---");
            string s2 = "select distinct(flat_floor) from  " + val2 + " where cust_id='' and cust_name=''";
            String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con2 = new SqlConnection(strConnString2);
            SqlCommand cmd2 = new SqlCommand();

            cmd2.Parameters.AddWithValue("@id", wing.SelectedItem.Text);
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = s2;
            cmd2.Connection = con2;
            try
            {
                con2.Open();
                floor.DataSource = cmd2.ExecuteReader();
                floor.DataTextField = "flat_floor";

                floor.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con2.Close();
                con2.Dispose();
            }
            
           
        }
         a = Request.QueryString["id"];
         if (!IsPostBack)
         {
           
             if (a != null)
             {
                 string strquery = "select * from " + val + " where cust_id='" + a + "'";
                 String strConnString1 = System.Configuration.ConfigurationManager
            .ConnectionStrings["conString"].ConnectionString;
                 SqlConnection con1 = new SqlConnection(strConnString1);
                 con1.Open();
                 SqlDataReader dr;
                 SqlCommand cmd = new SqlCommand(strquery, con1);
                 dr = cmd.ExecuteReader();
                 while (dr.Read())
                 {
                     txtname.Text = dr.GetString(2);
                     txtmob1.Text = dr.GetString(3);
                     txtmob2.Text = dr.GetString(4);
                     txtcaddress.InnerText = dr.GetString(5);
                     txtpaddress.InnerText = dr.GetString(6);
                     txtemail.Text = dr.GetString(7);
                     txtbdate.Text = dr.GetString(8);
                     p = dr.GetString(10);
                     cn.Value = p;
                     q = dr.GetString(12);
                     bn.Value = q;
                     txtbldgno.Text = dr.GetString(13);
                     r = dr.GetString(14);
                     wingn.Value = r;
                    s = dr.GetString(15);
                    floorn.Value = s;
                     t = dr.GetString(16);
                     flatnon.Value = t;
                     txtflattype.Text = dr.GetString(17);
                     txtarea.Text = dr.GetValue(18).ToString();
                     txtrate.Text = dr.GetValue(19).ToString();
                     txtamount.Text = dr.GetValue(20).ToString();
                     amount.Value = txtamount.Text;
                     txtdevchrg.Text = dr.GetValue(21).ToString();
                     txtsctchrg.Text = dr.GetValue(22).ToString();
                     txtstvat.Text = dr.GetValue(23).ToString();
                     txtagree.Text = dr.GetValue(24).ToString();
                     txtdocu.Text = dr.GetValue(25).ToString();
                     txtmain10.Text = dr.GetValue(26).ToString();
                     txtduty.Text = dr.GetValue(27).ToString();
                     txtother.Text = dr.GetValue(28).ToString();
                     txttotal.Text = dr.GetValue(29).ToString();
                     total.Value = txttotal.Text;
                     av.Text = dr.GetValue(32).ToString();
                     ocr.Text = dr.GetValue(33).ToString();
                     hocr.Value = dr.GetValue(33).ToString();
                     em.Text = dr.GetValue(34).ToString();
                     hem.Value = dr.GetValue(34).ToString();
                     loan.Text = dr.GetValue(35).ToString();
                     txtcomment.InnerText = dr.GetString(37);
                     
                 }
                 dr.Close();
                 flatno.Items.Clear();
                 flatno.AppendDataBoundItems = true;
                 flatno.Items.Add("---Select Flat No---");
                 string s7 = "select distinct(flat_no) from  " + val2 + " where complex_name='" + p + "' and building_name='" + q + "' and wing='" + r + "' and flat_floor='" + s + "' ";
                 String strConnString7 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                 SqlConnection con7 = new SqlConnection(strConnString7);
                 SqlCommand cmd7 = new SqlCommand();

                 cmd7.Parameters.AddWithValue("@id", floor.SelectedItem.Text);
                 cmd7.CommandType = CommandType.Text;
                 cmd7.CommandText = s7;
                 cmd7.Connection = con7;
                 try
                 {
                     con7.Open();
                     flatno.DataSource = cmd7.ExecuteReader();
                     flatno.DataTextField = "flat_no";

                     flatno.DataBind();
                 }
                 catch (Exception ex)
                 {
                     throw ex;
                 }
                 finally
                 {
                     con7.Close();
                     con7.Dispose();
                 }
                 k = complex.Items.IndexOf(((ListItem)complex.Items.FindByText(p)));
                complex.SelectedIndex = k;
               l = building.Items.IndexOf(((ListItem)building.Items.FindByText(q)));
                building.SelectedIndex = l;
               m = wing.Items.IndexOf(((ListItem)wing.Items.FindByText(r)));
                wing.SelectedIndex = m;
               n = floor.Items.IndexOf(((ListItem)floor.Items.FindByText(s)));
                floor.SelectedIndex = n;
                o =flatno.Items.IndexOf(((ListItem)flatno.Items.FindByText(t)));
                flatno.SelectedIndex = o;
                 string strquery1 = "select ledger_name from  "+val44+"  where id='" + a + "'";
                 SqlDataReader dr1;
                 SqlCommand cmd1 = new SqlCommand(strquery1, con1);
                 dr1 = cmd1.ExecuteReader();
                 while (dr1.Read())
                 {
                     ledname.Value = dr1.GetString(0);
                 }
                 dr1.Close();
             }
         }   
        }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (txtam1.Value == "")
        {
            txtam1.Value = txttotal.Text;
        }
        if (txtam.Value == "")
        {
            txtam.Value = txtamount.Text;
        }
        if (hocr.Value == "")
        {
            hocr.Value = ocr.Text;
        }
        if (hem.Value == "")
        {
            hem.Value = em.Text;
        }
        if (cname.Value == "")
        {
           
            if (cn.Value == complex.SelectedItem.Text && bn.Value == building.SelectedItem.Text && wingn.Value == wing.SelectedItem.Text && floorn.Value == floor.SelectedItem.Text && flatnon.Value == flatno.SelectedItem.Text)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot1();", true);
                String strConnString = System.Configuration.ConfigurationManager
                             .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string strq10000 = "update  " + val44 + "  set balance=balance-'" + total.Value + "' where name='" + txtname.Text + "' and type='Customer'";
                SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                DataSet ds10000 = new DataSet();
                da10000.Fill(ds10000, val44);
                string strquery = "select paid from " + val + " where cust_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    paid = dr.GetValue(0).ToString();
                }

                string strq11 = "update  " + val + "  set cust_name='" + txtname.Text + "',cust_mobile1='" + txtmob1.Text + "',cust_mobile2='" + txtmob2.Text + "',cust_address_current='" + txtcaddress.InnerText + "',cust_address_permanent='" + txtpaddress.InnerText + "',cust_email='" + txtemail.Text + "',cust_booking_date='" + txtbdate.Text + "',complex_id='" + complex.SelectedItem.Value + "',complex_name='" + complex.SelectedItem.Text + "',building_id='" + building.SelectedItem.Value + "',building_name='" + building.SelectedItem.Text + "',wing='" + wing.SelectedItem.Text + "',flat_floor='" + floor.SelectedItem.Text + "',flat_no='" + flatno.SelectedItem.Text + "',flat_type='" + txtflattype.Text + "',flat_area='" + txtarea.Text + "',rate='" + txtrate.Text + "',amount='" + txtam.Value + "',dev_charge='" + txtdevchrg.Text + "',society_charge='" + txtsctchrg.Text + "',stvat='" + txtstvat.Text + "',agreement_tax='" + txtagree.Text + "',document_charge='" + txtdocu.Text + "',maintenance='" + txtmain10.Text + "',stamp_duty='" + txtduty.Text + "',other='" + txtother.Text + "',total='" + txtam1.Value + "',balance='" + (Convert.ToDouble(txtam1.Value) + Convert.ToDouble(paid)) + "',agree_value='" + av.Text + "',ocr='" + hocr.Value + "',em='" + hem.Value + "',loan='" + loan.Text + "',comment='" + txtcomment.InnerText + "' where cust_id='" + a + "'";
                SqlCommand cmd111 = new SqlCommand(strq11, con);
                SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
                DataSet ds11 = new DataSet();
                da11.Fill(ds11, val);
                string strq3 = "update  " + val2 + "  set cust_name='" + txtname.Text + "',date='" + txtbdate.Text + "' where cust_id='" + a + "'";
                SqlCommand cmd31 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd31);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val2);
                string strq2 = "update  " + val44 + "  set name='" + txtname.Text + "',balance=balance+'" + (Convert.ToDouble(txtam1.Value)) + "' where id='" + a + "' and type='Customer'";
                SqlCommand cmd21 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd21);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
                con.Close();
                Response.Redirect("Customer.aspx?success=true");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot1();", true);
                String strConnString = System.Configuration.ConfigurationManager
                             .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string strq10000 = "update  " + val44 + "  set balance=balance-'" + total.Value + "' where name='" + txtname.Text + "' and type='Customer'";
                SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                DataSet ds10000 = new DataSet();
                da10000.Fill(ds10000, val44);
                string strquery = "select paid from " + val + " where cust_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    paid = dr.GetValue(0).ToString();
                }
                string strq8 = "update  " + val2 + "  set cust_name='',cust_id='',date='' where complex_name='" + cn.Value + "' and building_name='" + bn.Value + "' and wing='" + wingn.Value + "' and flat_floor='" + floorn.Value + "' and flat_no='" + flatnon.Value + "'";
                SqlCommand cmd81 = new SqlCommand(strq8, con);
                SqlDataAdapter da8 = new SqlDataAdapter(cmd81);
                DataSet ds8 = new DataSet();
                da8.Fill(ds8, val2);
                string strq11 = "update  " + val + "  set cust_name='" + txtname.Text + "',cust_mobile1='" + txtmob1.Text + "',cust_mobile2='" + txtmob2.Text + "',cust_address_current='" + txtcaddress.InnerText + "',cust_address_permanent='" + txtpaddress.InnerText + "',cust_email='" + txtemail.Text + "',cust_booking_date='" + txtbdate.Text + "',complex_id='" + complex.SelectedItem.Value + "',complex_name='" + complex.SelectedItem.Text + "',building_id='" + building.SelectedItem.Value + "',building_name='" + building.SelectedItem.Text + "',wing='" + wing.SelectedItem.Text + "',flat_floor='" + floor.SelectedItem.Text + "',flat_no='" + flatno.SelectedItem.Text + "',flat_type='" + txtflattype.Text + "',flat_area='" + txtarea.Text + "',rate='" + txtrate.Text + "',amount='" + txtam.Value + "',dev_charge='" + txtdevchrg.Text + "',society_charge='" + txtsctchrg.Text + "',stvat='" + txtstvat.Text + "',agreement_tax='" + txtagree.Text + "',document_charge='" + txtdocu.Text + "',maintenance='" + txtmain10.Text + "',stamp_duty='" + txtduty.Text + "',other='" + txtother.Text + "',total='" + txtam1.Value + "',balance='" + (Convert.ToDouble(txtam1.Value) + Convert.ToDouble(paid)) + "',agree_value='" + av.Text + "',ocr='" + hocr.Value + "',em='" + hem.Value + "',loan='" + loan.Text + "',comment='" + txtcomment.InnerText + "' where cust_id='" + a + "'";
                SqlCommand cmd111 = new SqlCommand(strq11, con);
                SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
                DataSet ds11 = new DataSet();
                da11.Fill(ds11, val);
                string strq3 = "update  " + val2 + "  set cust_name='" + txtname.Text + "',date='" + txtbdate.Text + "',cust_id='" + a + "'  where complex_name='" + complex.SelectedItem.Text + "' and building_name='" + building.SelectedItem.Text + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor='" + floor.SelectedItem.Text + "' and flat_no='" + flatno.SelectedItem.Text + "'";
                SqlCommand cmd31 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd31);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val2);
                string strq2 = "update  " + val44 + "  set name='" + txtname.Text + "',balance='" + (Convert.ToDouble(txtam1.Value)) + "' where id='" + a + "' and type='Customer'";
                SqlCommand cmd21 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd21);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
                con.Close();
                Response.Redirect("Customer.aspx?success=true");
            }
        }
        else
        {
            if (cn.Value == complex.SelectedItem.Text && bn.Value == building.SelectedItem.Text && wingn.Value == wing.SelectedItem.Text && floorn.Value == floor.SelectedItem.Text && flatnon.Value == flatno.SelectedItem.Text)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot1();", true);
                String strConnString = System.Configuration.ConfigurationManager
                             .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string strq10000 = "update  " + val44 + "  set balance=balance-'" + total.Value + "' where name='" + cname.Value + "' and type='Customer'";
                SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                DataSet ds10000 = new DataSet();
                da10000.Fill(ds10000, val44);
                string strquery = "select paid from " + val + " where cust_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    paid = dr.GetValue(0).ToString();
                }
                string strq11 = "update  " + val + "  set cust_name='" + cname.Value + "',cust_mobile1='" + txtmob1.Text + "',cust_mobile2='" + txtmob2.Text + "',cust_address_current='" + txtcaddress.InnerText + "',cust_address_permanent='" + txtpaddress.InnerText + "',cust_email='" + txtemail.Text + "',cust_booking_date='" + txtbdate.Text + "',complex_id='" + complex.SelectedItem.Value + "',complex_name='" + complex.SelectedItem.Text + "',building_id='" + building.SelectedItem.Value + "',building_name='" + building.SelectedItem.Text + "',wing='" + wing.SelectedItem.Text + "',flat_floor='" + floor.SelectedItem.Text + "',flat_no='" + flatno.SelectedItem.Text + "',flat_type='" + txtflattype.Text + "',flat_area='" + txtarea.Text + "',rate='" + txtrate.Text + "',amount='" + txtam.Value + "',dev_charge='" + txtdevchrg.Text + "',society_charge='" + txtsctchrg.Text + "',stvat='" + txtstvat.Text + "',agreement_tax='" + txtagree.Text + "',document_charge='" + txtdocu.Text + "',maintenance='" + txtmain10.Text + "',stamp_duty='" + txtduty.Text + "',other='" + txtother.Text + "',total='" + txtam1.Value + "',balance='" + (Convert.ToDouble(txtam1.Value) + Convert.ToDouble(paid)) + "',agree_value='" + av.Text + "',ocr='" + hocr.Value + "',em='" + hem.Value + "',loan='" + loan.Text + "',comment='" + txtcomment.InnerText + "' where cust_id='" + a + "'";
                SqlCommand cmd111 = new SqlCommand(strq11, con);
                SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
                DataSet ds11 = new DataSet();
                da11.Fill(ds11, val);
                string strq3 = "update  " + val2 + "  set cust_name='" + cname.Value + "',date='" + txtbdate.Text + "' where cust_id='" + a + "'";
                SqlCommand cmd31 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd31);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val2);
                string strq2 = "update  " + val44 + "  set name='" + cname.Value + "',ledger_id='" + nid.Value + "',ledger_name='" + nname.Value + "',balance='" + (Convert.ToDouble(txttotal.Text)) + "',main_id='"+mainid.Value+"',main_name='"+mainname.Value+"' where id='" + a + "' and type='Customer'";
                SqlCommand cmd21 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd21);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
                con.Close();
                Response.Redirect("Customer.aspx?success=true");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "total1();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "tot1();", true);
                String strConnString = System.Configuration.ConfigurationManager
                             .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                string strq10000 = "update  " + val44 + "  set balance=balance+'" + total.Value + "' where name='" + cname.Value + "' type='Customer'";
                SqlCommand cmd10000 = new SqlCommand(strq10000, con);
                SqlDataAdapter da10000 = new SqlDataAdapter(cmd10000);
                DataSet ds10000 = new DataSet();
                da10000.Fill(ds10000, val45);
                string strquery = "select paid from " + val + " where cust_id='" + a + "'";
                String strConnString1 = System.Configuration.ConfigurationManager
           .ConnectionStrings["conString"].ConnectionString;
                SqlConnection con1 = new SqlConnection(strConnString1);
                con1.Open();
                SqlDataReader dr;
                SqlCommand cmd = new SqlCommand(strquery, con1);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    paid = dr.GetValue(0).ToString();
                }
                string strq8 = "update  " + val2 + "  set cust_name='',cust_id='',date='' where complex_name='" + cn.Value + "' and building_name='" + bn.Value + "' and wing='" + wingn.Value + "' and flat_floor='" + floorn.Value + "' and flat_no='" + flatnon.Value + "'";
                SqlCommand cmd81 = new SqlCommand(strq8, con);
                SqlDataAdapter da8 = new SqlDataAdapter(cmd81);
                DataSet ds8 = new DataSet();
                da8.Fill(ds8, val2);
                string strq11 = "update  " + val + "  set cust_name='" + cname.Value + "',cust_mobile1='" + txtmob1.Text + "',cust_mobile2='" + txtmob2.Text + "',cust_address_current='" + txtcaddress.InnerText + "',cust_address_permanent='" + txtpaddress.InnerText + "',cust_email='" + txtemail.Text + "',cust_booking_date='" + txtbdate.Text + "',complex_id='" + complex.SelectedItem.Value + "',complex_name='" + complex.SelectedItem.Text + "',building_id='" + building.SelectedItem.Value + "',building_name='" + building.SelectedItem.Text + "',wing='" + wing.SelectedItem.Text + "',flat_floor='" + floor.SelectedItem.Text + "',flat_no='" + flatno.SelectedItem.Text + "',flat_type='" + txtflattype.Text + "',flat_area='" + txtarea.Text + "',rate='" + txtrate.Text + "',amount='" + txtam.Value + "',dev_charge='" + txtdevchrg.Text + "',society_charge='" + txtsctchrg.Text + "',stvat='" + txtstvat.Text + "',agreement_tax='" + txtagree.Text + "',document_charge='" + txtdocu.Text + "',maintenance='" + txtmain10.Text + "',stamp_duty='" + txtduty.Text + "',other='" + txtother.Text + "',total='" + txtam1.Value + "',balance='" + (Convert.ToDouble(txtam1.Value) + Convert.ToDouble(paid)) + "',agree_value='" + av.Text + "',ocr='" + hocr.Value + "',em='" + hem.Value + "',loan='" + loan.Text + "',comment='" + txtcomment.InnerText + "' where cust_id='" + a + "'";
                SqlCommand cmd111 = new SqlCommand(strq11, con);
                SqlDataAdapter da11 = new SqlDataAdapter(cmd111);
                DataSet ds11 = new DataSet();
                da11.Fill(ds11, val);
                string strq3 = "update  " + val2 + "  set cust_name='" + cname.Value + "',date='" + txtbdate.Text + "',cust_id='" + a + "'  where complex_name='" + complex.SelectedItem.Text + "' and building_name='" + building.SelectedItem.Text + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor='" + floor.SelectedItem.Text + "' and flat_no='" + flatno.SelectedItem.Text + "'";
                SqlCommand cmd31 = new SqlCommand(strq3, con);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd31);
                DataSet ds3 = new DataSet();
                da3.Fill(ds3, val2);
                string strq2 = "update  " + val44 + "  set name='" + cname.Value + "',ledger_id='" + nid.Value + "',ledger_name='" + nname.Value + "',balance='" + (Convert.ToDouble(txtam1.Value)) + "',main_id='" + mainid.Value + "',main_name='" + mainname.Value + "' where id='" + a + "' and type='Customer'";
                SqlCommand cmd21 = new SqlCommand(strq2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd21);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, val44);
                con.Close();
                Response.Redirect("Customer.aspx?success=true");
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
                cmd.CommandText = "select name from ledger where name like '%'+@SearchText + '%'";
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
    protected void complex_SelectedIndexChanged(object sender, EventArgs e)
    {
        building.Items.Clear();
        txtbldgno.Text = "";
        wing.Items.Clear();
        floor.Items.Clear();
        flatno.Items.Clear();
        txtarea.Text = "";
       
        txtflattype.Text = "";
        building.AppendDataBoundItems = true;
        building.Items.Add("---Select Building---");
        string s = "select distinct building_id,building_name from " + val2 + " where complex_id=@id and  cust_id='' and cust_name=''";
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
        wing.Items.Clear();
        txtbldgno.Text = "";
        floor.Items.Clear();
        flatno.Items.Clear();
        txtarea.Text = "";
       
        txtflattype.Text = "";
        wing.AppendDataBoundItems = true;
        wing.Items.Add("---Select Wing---");
        string s = "select distinct(wing) from  " + val2 + "  where complex_id='" + complex.SelectedItem.Value + "' and  building_id=@id and cust_id='' and cust_name='' ";
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

        string s1 = "select building_no from  " + val2 + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and cust_id='' and cust_name=''";
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
        floor.Items.Clear();
       
        flatno.Items.Clear();
        txtarea.Text = "";
      
        txtflattype.Text = "";
        floor.AppendDataBoundItems = true;
        floor.Items.Add("---Select Floor---");
        string s = "select distinct(flat_floor) from  " + val2 + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and wing=@id and cust_id='' and cust_name=''";
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
        flatno.Items.Clear();
        
        txtarea.Text = "";
       
        txtflattype.Text = "";
        flatno.AppendDataBoundItems = true;
        flatno.Items.Add("---Select Flat No---");
        string s = "select distinct(flat_no) from  " + val2 + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor=@id and cust_id='' and cust_name='' ";
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
        string s = "select flat_type,flat_area from  " + val2 + "  where complex_id='" + complex.SelectedItem.Value + "' and building_id='" + building.SelectedItem.Value + "' and building_no='" + txtbldgno.Text + "' and wing='" + wing.SelectedItem.Text + "' and flat_floor='" + floor.SelectedItem.Text + "' and flat_no='" + flatno.SelectedItem.Text + "' and cust_id='' and cust_name=''";
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
            txtamount.Text = Convert.ToString(Convert.ToDouble(txtarea.Text) * Convert.ToDouble(txtrate.Text));
            txtam.Value = Convert.ToString(Convert.ToDouble(txtarea.Text) * Convert.ToDouble(txtrate.Text));
            txttotal.Text = Convert.ToString(Convert.ToDouble(txtamount.Text) + Convert.ToDouble(txtdevchrg.Text) + Convert.ToDouble(txtsctchrg.Text) + Convert.ToDouble(txtstvat.Text) + Convert.ToDouble(txtagree.Text) + Convert.ToDouble(txtdocu.Text) + Convert.ToDouble(txtmain10.Text) + Convert.ToDouble(txtduty.Text) + Convert.ToDouble(txtother.Text));
            txtam1.Value = txttotal.Text = Convert.ToString(Convert.ToDouble(txtamount.Text) + Convert.ToDouble(txtdevchrg.Text) + Convert.ToDouble(txtsctchrg.Text) + Convert.ToDouble(txtstvat.Text) + Convert.ToDouble(txtagree.Text) + Convert.ToDouble(txtdocu.Text) + Convert.ToDouble(txtmain10.Text) + Convert.ToDouble(txtduty.Text) + Convert.ToDouble(txtother.Text));
            
        }
        dr.Close();
        txtrate.Focus();
    }
   
}
