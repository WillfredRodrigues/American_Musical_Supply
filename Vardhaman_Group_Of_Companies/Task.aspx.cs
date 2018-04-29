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


public partial class Task : System.Web.UI.Page
{
  public string val, val1, sp, vn, pb, mat, bp, sp1, sp2,val2;
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
        if (!Page.IsPostBack)
        {
            string stats = Request.QueryString["id"];
            if (stats != null)
            {
                Response.Write("<script>alert('Task Has Successfully Been Deleted');</script>");
            }
            string stats1 = Request.QueryString["id1"];
            if (stats1 != null)
            {
                Response.Write("<script>alert('Task Has Successfully Been Updated');</script>");
            }
            PopulateRootLevel();
            TreeView1.ExpandAll();
        }

    }
    private void PopulateRootLevel()
    {
        SqlConnection objConn = new SqlConnection("Data Source=Willfred-pc\\sqlexpress;Initial Catalog=vgc; Integrated Security=True");
        SqlCommand objCommand = new SqlCommand("select id,name,description,status,(select count(*) FROM "+val+" " + "WHERE id=sc.id) childnodecount FROM "+val+" sc where under=0", objConn);

        SqlDataAdapter da = new SqlDataAdapter(objCommand);
        DataTable dt = new DataTable();
        da.Fill(dt);

        PopulateNodes(dt, TreeView1.Nodes);
    }
    private void PopulateNodes(DataTable dt, TreeNodeCollection nodes)
    {
        foreach (DataRow dr in dt.Rows)
        {
            TreeNode tn = new TreeNode();
            tn.Text = dr["name"].ToString() +"------"+ "About :" + dr["description"].ToString() +"------"+ "Status :" + dr["status"].ToString();

            foreach (TreeNode node in TreeView1.Nodes)
            {
                if (node.ChildNodes.Count.Equals(0))
                {
                    node.Text = "<B>" + node.Text + "</B>";
                    node.Text = "<font color=black>" + node.Text + "</font>";
                }
            }
            
            tn.Value = dr["id"].ToString();
            
            nodes.Add(tn);

            //If node has child nodes, then enable on-demand populating
            tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
        }
    }
    private void PopulateSubLevel(int parentid, TreeNode parentNode)
    {
        SqlConnection objConn = new SqlConnection("Data Source=claruswave-pc\\mssqlexpress;Initial Catalog=vgc;Integrated Security=True");
        SqlCommand objCommand = new SqlCommand("select id,name,description,status,(select count(*) FROM "+val+" " + "WHERE id=sc.id) childnodecount FROM "+val+" sc where under=@id", objConn);
        objCommand.Parameters.Add("@id", SqlDbType.Int).Value = parentid;

        SqlDataAdapter da = new SqlDataAdapter(objCommand);
        DataTable dt = new DataTable();
        da.Fill(dt);
        PopulateNodes(dt, parentNode.ChildNodes);
    }
    protected void TreeView1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    {
        PopulateSubLevel(Int32.Parse(e.Node.Value), e.Node);
    }

    
}
