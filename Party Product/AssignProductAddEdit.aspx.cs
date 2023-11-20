using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Status.Visible = true;
                String PartyName = DropDownList1.SelectedValue;
                String ProductName = DropDownList2.SelectedValue;
                SqlAssignProduct.InsertParameters["PartyName"].DefaultValue = PartyName;
                SqlAssignProduct.InsertParameters["ProductName"].DefaultValue = ProductName;
                SqlAssignProduct.Insert();
                Status.Text = "Product assigned succesfully";

            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }




        }
    }
}