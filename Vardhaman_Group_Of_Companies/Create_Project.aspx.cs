using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Windows.Forms;

public partial class Create_Project : System.Web.UI.Page
{
    string a;
    string x, y, z, p,q1,q2,q3,q4,q5,q6;
    string d, e1 = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtprojname.Focus();
        if (!IsPostBack)
        {
            
            string status = Request.QueryString["success"];
            if (status != null)
            {
                Response.Write("<script>alert('Project Has Successfully Been Created.You Must Login From Newly Created Project To Work On');</script>");

            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {

       
        d = txtprojname.Text.ToLower() + txtprojlocation.Text.ToLower();
        for (int i = 0; i < d.Length; i++)
        {

            if (d.ElementAt(i) == ' ')
            {

            }
            else
            {
                e1 = e1 + d.ElementAt(i);
            }

        }
        string strquery = "select proj_user_name from project_registration where proj_user_name='" + e1 + "'";
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand(strquery, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            x = dr.GetString(0).ToLower();
        }
        dr.Close();
        if (x==e1)
        {
            Response.Write("<script>alert('This Project Has Already Been Created');</script>");
        }
      
       
        else
        {


            string val = e1;
            q1 = e1 + "_" + "Complex";
            q2 = e1 + "_" + "Customer";
            q3 = e1 + "_" + "Bank_Book";
            q4 = e1 + "_" + "Purchase";
            q5 = e1 + "_" + "Contra";
            q6 = e1 + "_" + "Usage";
            string strq = "insert into Project_Registration values('" + e1 + "','" + txtprojname.Text + "','" + e1 + "','" + txtprojlocation.Text + "','"+DateTime.Now+"','','Active','','"+des.InnerText+"')";
            SqlCommand cmd1 = new SqlCommand(strq, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, "Project_Registration");
          
            con.Close();
            string strQuery = "create table " + (e1 + "_" + "Complex") + " (ident int identity,complex_id varchar(50),complex_name varchar(50),complex_location varchar(50),building_id varchar(50),building_name varchar(50),building_no varchar(50),wing varchar(50),flat_floor varchar(50),flat_no varchar(50),flat_type varchar(50),flat_area varchar(50),cust_name varchar(50),cust_id varchar(50),date varchar(50),comment varchar(max))";
            table(strQuery, "Complex");
            string strQuery1 = "create table " + (e1 + "_" + "Customer") + " (ident int identity,cust_id varchar(50),cust_name varchar(50),cust_mobile1 varchar(50),cust_mobile2 varchar(50),cust_address_Current varchar(max),cust_address_permanent varchar(max),cust_email varchar(50),cust_booking_date varchar(50),complex_id varchar(50),complex_name varchar(50),building_id varchar(50),building_name varchar(50),building_no varchar(50),wing varchar(50),flat_floor varchar(50),flat_no varchar(50),flat_type varchar(50),flat_area varchar(50),rate money,amount money,dev_charge money,society_charge money,stvat money,agreement_tax money,document_charge money,maintenance money,stamp_duty money,other money,total money,paid money,balance money,agree_value money,ocr money,em money,loan money,entry_date varchar(50),comment varchar(max))";
            table(strQuery1, "customer");
            string strQuery2 = "create table " + (e1 + "_" + "Bank_Book") + " (ident int identity,transaction_id varchar(50),date varchar(50),account varchar(50),name varchar(50),amount money,chk_no varchar(50),chk_date varchar(50),bank_name varchar(50),debit money,credit money,balance money,narration varchar(max),description varchar(max),type varchar(50))";
            table(strQuery2, "Bank_Book");
            string strQuery3 = "create table " + (e1 + "_" + "purchase") + "(ident int identity,purchase_id varchar(50),material_name varchar(50),quantity int,quantity_type varchar(50),rate money,amount money,vendor_name varchar(50),vendor_address varchar(max),vendor_mobile varchar(50),purchased_by varchar(50),paid money,balance money,mode_of_pay varchar(50),chk_dd_no int,chk_dd_date varchar(50),bank_name varchar(50),type_of_purchase varchar(50),purchase_date varchar(50),purchase_entry_date varchar(50),challan varchar(50),bill varchar(50),comment varchar(max))";
            table(strQuery3, "purchase");
            string strQuery4 = "create table " + (e1 + "_" + "usage") + "(ident int identity,use_date varchar(50),use_id varchar(50),material_name varchar(50),quantity int,quantity_type varchar(50),used_by varchar(50),balance_material varchar(50),balance_material_type varchar(50),entry_date varchar(50),comment varchar(max))";
            table(strQuery4, "usage");
            string strQuery5 = "create table " + (e1 + "_" + "Contra") + "(ident int identity,pay_id varchar(50),date varchar(50),account varchar(50),name varchar(50),amount money,chk_no varchar(50),chk_date varchar(50),bank_name varchar(50),debit money,credit money,balance money,narration varchar(max),description varchar(max),type varchar(50))";
            table(strQuery5, "Contra");
            string strQuery6 = "create table " + (e1 + "_" + "material") + "(id varchar(50),name varchar(50),quantity int,type varchar(50))";
            table(strQuery6, "material");
            string strQuery7 = "create table " + (e1 + "_" + "ledger_account") + "(id varchar(50),name varchar(50),ledger_id varchar(50),ledger_name varchar(50),coming_from varchar(50),type varchar(50),balance money,main_id int,main_name varchar(100))";
            table(strQuery7, "ledger_account");
            string strQuery8 = "create table " + (e1 + "_" + "account") + "(ac_id varchar(50),ac_name varchar(100),balance money,ledger_id varchar(50),ledger_name varchar(50),main_id int,main_name varchar(100))";
            table(strQuery8, "account");
            string strQuery9 = "create table " + (e1 + "_" + "Journal") + "(ident int identity,pay_id varchar(50),date varchar(50),account varchar(50),name varchar(50),amount money,chk_no varchar(50),chk_date varchar(50),bank_name varchar(50),debit money,credit money,balance money,narration varchar(max),description varchar(max),type varchar(50))";
            table(strQuery9, "Journal");
            string strQuery10 = "create table " + (e1 + "_" + "Sales") + "(ident int identity,purchase_id varchar(50),material_name varchar(50),quantity int,quantity_type varchar(50),rate money,amount money,vendor_name varchar(50),vendor_address varchar(max),vendor_mobile varchar(50),purchased_by varchar(50),paid money,balance money,mode_of_pay varchar(50),chk_dd_no int,chk_dd_date varchar(50),bank_name varchar(50),type_of_purchase varchar(50),purchase_date varchar(50),purchase_entry_date varchar(50),challan varchar(50),bill varchar(50),comment varchar(max))";
            table(strQuery10, "Sales");
            string strQuery11 = "create table " + (e1 + "_" + "Task") + "(id int identity,description varchar(max),name varchar(200),from_d varchar(50),to_d varchar(50),assigned varchar(50),under int,status int)";
            table(strQuery11, "Task");
            Response.Redirect("Create_Project.aspx?success=true");
        }
    }
    public void table(string s, string s1)
    {
        String strConnString = System.Configuration.ConfigurationManager
                   .ConnectionStrings["conString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(s, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, (e1 + "_" + s1));

        con.Close();
    }
}