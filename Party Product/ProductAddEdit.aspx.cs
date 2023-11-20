using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class ProductAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Status.Visible = true;

                String ProductName = TextBox1.Text;
                SqlAddProduct.InsertParameters["ProductName"].DefaultValue = ProductName;
                SqlAddProduct.Insert();
                Status.Text = "Data Inserted Succesfully";

            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }
    }
}