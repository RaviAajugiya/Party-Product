using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Party_Product
{

    public partial class WebForm5 : System.Web.UI.Page
    {
        String Party_Name;
        String Product_Name;
        String Product_Rate;
        String Product_Quantity;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Page_Render(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Party_Name = DropDownList1.SelectedValue;
            Product_Name = DropDownList2.SelectedValue;
            Product_Rate = AddRate.Text;
            Product_Quantity = quantity.Text;
            decimal total = Convert.ToDecimal(Product_Rate) * Convert.ToInt32(Product_Quantity);

            SqlDataSource4.InsertParameters["Party_Name"].DefaultValue = Party_Name;
            SqlDataSource4.InsertParameters["Product_Name"].DefaultValue = Product_Name;
            SqlDataSource4.InsertParameters["Rate"].DefaultValue = Product_Rate;
            SqlDataSource4.InsertParameters["Quantity"].DefaultValue = Product_Quantity;
            SqlDataSource4.Insert();

            TempInvoice.InsertParameters["Party_Name"].DefaultValue = Party_Name;
            TempInvoice.InsertParameters["Product_Name"].DefaultValue = Product_Name;
            TempInvoice.InsertParameters["Rate"].DefaultValue = Product_Rate;
            TempInvoice.InsertParameters["Quantity"].DefaultValue = Product_Quantity;
            TempInvoice.Insert();

            DropDownList1.Enabled = false;
            GridView1.DataBind();

            // Calculate and set the grand total
            Total.Text = CalculateGrandTotal().ToString();
        }

        protected void CloseInvoice_click(object sender, EventArgs e)
        {
            ClearTempInvoice();

            Response.Redirect(Request.RawUrl);
        }

        private void ClearTempInvoice()
        {
            using (SqlConnection connection = new SqlConnection(SqlDataSource4.ConnectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("DELETE FROM TempInvoice", connection))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
        private decimal CalculateGrandTotal()
        {
            decimal grandTotal = 0;

            // Iterate through the rows in TempInvoice and calculate the total
            foreach (GridViewRow row in GridView1.Rows)
            {
                decimal rate = Convert.ToDecimal(row.Cells[3].Text); // Assuming rate is in the 4th column
                int quantity = Convert.ToInt32(row.Cells[4].Text); // Assuming quantity is in the 5th column

                grandTotal += rate * quantity;
            }

            return grandTotal;
        }


        protected void DropDownList2_PreRender(object sender, EventArgs e)
        {
            DataView dv = new DataView();
            dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Table.Rows.Count == 1)
            {
                AddRate.Text = dv.Table.Rows[0][0].ToString();
            }
            else
            {
                AddRate.Text = null;
            }
        }



    }
}

