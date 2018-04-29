using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public static string[] GetFruits(string prefix)
    {
        System.Threading.Thread.Sleep(2000); //Delay of 2 seconds
        List<string> fruits = new List<string>();
        fruits.Add("Mango");
        fruits.Add("Apple");
        fruits.Add("Banana");
        fruits.Add("Orange");
        fruits.Add("Pineapple");
        fruits.Add("Guava");
        fruits.Add("Grapes");
        fruits.Add("Papaya");
        return fruits.Where(f => f.ToLower().IndexOf(prefix.ToLower()) != -1).ToArray();
    }
}