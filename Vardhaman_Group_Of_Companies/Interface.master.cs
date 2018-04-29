using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        visibility();
        if (Session["menu"] != null)
        {
            if (Session["menu"].ToString() == "1")
            {
                panmainadmin.Visible = true;
            }
            else if (Session["menu"].ToString() == "2")
            {
                panmainadmin.Visible = true;
            }
            else
            {
                panmainadmin.Visible = true;

            }
        }
        
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    public void visibility()
    {
        panadmin.Visible = false;

        panuser.Visible = false;
        panmainadmin.Visible = false;
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
