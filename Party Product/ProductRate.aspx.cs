using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];


            DropDownList ddlProduct = (DropDownList)row.FindControl("DropDownList1");

            string productName = ddlProduct.SelectedValue;

            SqlDataSource1.UpdateParameters["Product_Name"].DefaultValue = productName;
            SqlDataSource1.Update();


            Response.Write(productName + "<br/>");

        }
    }
}