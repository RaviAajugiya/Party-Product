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
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                lblMessage.Text = "Please enter a party name.";
                return;
            }
            try
            {
                lblMessage.Visible = true;

                String ProductName = TextBox1.Text;
                SqlAddProduct.InsertParameters["ProductName"].DefaultValue = ProductName;
                SqlAddProduct.Insert();

            }
            catch (Exception ex)
            {
                //lblMessage.Text = ex.Message;
            }
        }

        protected void SqlAddParty_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                lblMessage.Text = "Data inserted successfully!";
            }
            else
            {
                lblMessage.Text = "Party alreadt exists";
            }
        }
    }
}