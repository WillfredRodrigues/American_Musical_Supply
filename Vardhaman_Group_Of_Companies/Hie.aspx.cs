using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

public partial class Hie : System.Web.UI.Page
{

    int i = 0, j, k, m;
    int[] a = new int[1000];
    string[] b = new string[1000];
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateRootLevel();
            TreeView1.ExpandAll();
        }


    }
    private void PopulateRootLevel()
    {
        SqlConnection objConn = new SqlConnection("Data Source=illuminati-pc\\sqlexpress;Initial Catalog=Vardhaman_Group_of_Companies;Integrated Security=True");
        SqlCommand objCommand = new SqlCommand("select id,name,level,(select count(*) FROM ledger " + "WHERE id=sc.id) childnodecount FROM ledger sc where under=0", objConn);

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
            tn.Text = dr["name"].ToString() + ":" + dr["level"].ToString();

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
            tn.PopulateOnDemand = (Convert.ToDouble(dr["childnodecount"]) > 0);
        }
    }
    private void PopulateSubLevel(int parentid, TreeNode parentNode)
    {
        SqlConnection objConn = new SqlConnection("Data Source=illuminati-pc\\sqlexpress;Initial Catalog=Vardhaman_Group_of_Companies;Integrated Security=True");
        SqlCommand objCommand = new SqlCommand("select id,name,level,(select count(*) FROM ledger " + "WHERE id=sc.id) childnodecount FROM ledger sc where under=@id", objConn);
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

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx?id=" + TreeView1.SelectedNode.Value);
    }
}