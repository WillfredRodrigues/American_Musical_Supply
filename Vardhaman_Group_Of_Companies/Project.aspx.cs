using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Project_Registration : System.Web.UI.Page
{
    public string val, val1, sp, sp1;
    int i1;
    string h;
    static string h4;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["project_id"] != null)
        {
           
            string val3 = Session["project_id"].ToString();
           
       
        }
    }

}