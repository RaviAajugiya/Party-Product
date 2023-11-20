using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            try
            {
                Status.Visible = true;
                String Product_Name = DropDownList1.SelectedValue;
                String Product_Rate = TextBox2.Text;
                String Rate_Date = TextBox3.Text;

                SqlAddRate.InsertParameters["ProductName"].DefaultValue = DropDownList1.SelectedValue;
                SqlAddRate.InsertParameters["ProductRate"].DefaultValue = TextBox2.Text;
                SqlAddRate.InsertParameters["RateDate"].DefaultValue = TextBox3.Text;
                SqlAddRate.Insert();
                Status.Text = "Rate Inserted Succesfully";

            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }

        }
    }
}