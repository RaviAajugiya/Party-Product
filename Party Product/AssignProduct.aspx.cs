using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        //private void BindGridView()
        //{
        //    using (SqlConnection con = new SqlConnection("Data Source=.; Initial Catalog=PartyProduct; Integrated Security=SSPI"))
        //    {
        //        string selectQuery = "SELECT Party.Party_Name, Product.Product_Name, Party.Party_id, Product.Product_id FROM Party INNER JOIN Assign_Party ON Party.Party_id = Assign_Party.Party_id INNER JOIN Product ON Assign_Party.Product_id = Product.Product_id";

        //        using (SqlDataAdapter adapter = new SqlDataAdapter(selectQuery, con))
        //        {
        //            DataTable dt = new DataTable();
        //            adapter.Fill(dt);

        //            GridView1.DataSource = dt;
        //            GridView1.DataBind();
        //        }
        //    }
        //}

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int partyId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["Party_id"]);
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["Product_id"]);
            String Party_Name = Convert.ToString(GridView1.DataKeys[e.RowIndex].Values["Party_Name"]);
            String Product_Name = Convert.ToString(GridView1.DataKeys[e.RowIndex].Values["Product_Name"]);

            DropDownList ddlParty = (DropDownList)row.FindControl("DropDownList1");
            DropDownList ddlProduct = (DropDownList)row.FindControl("DropDownList2");

            string partyName = ddlParty.SelectedValue;
            string productName = ddlProduct.SelectedValue;

            SqlAssignParty.UpdateParameters["Party_Name"].DefaultValue = partyName;
            SqlAssignParty.UpdateParameters["Product_Name"].DefaultValue = productName;
            SqlAssignParty.Update();



            //// Rest of your update logic...
            //SqlConnection con = new SqlConnection("data source=.; database=PartyProduct; integrated security=SSPI");
            //String UpdateQuery = "UPDATE Assign_Party SET Party_id = (Select Party_id from party where Party_Name = @Party_Name), Product_id = (Select Product_id from Product where Product_Name = @Product_Name) where Party_id = @Party_id and Product_id = @Product_id";
            //con.Open();
            //using (SqlCommand cmd = new SqlCommand(UpdateQuery, con))
            //{
            //    cmd.Parameters.AddWithValue("@Party_id", partyId);
            //    cmd.Parameters.AddWithValue("@Product_id", productId);
            //    cmd.Parameters.AddWithValue("@Party_Name", partyName);
            //    cmd.Parameters.AddWithValue("@Product_Name", productName);


            //    try
            //    {
            //        cmd.ExecuteNonQuery();
            //        // Refresh the data in the GridView
            //        BindGridView();
            //        Label3.Text = "Update successful.";
            //    }
            //    catch (Exception ex)
            //    {
            //        Label3.Text = "Update failed: " + ex.Message;
            //    }
            //}

        }



    }
}