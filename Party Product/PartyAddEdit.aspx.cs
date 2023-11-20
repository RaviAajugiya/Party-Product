using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Party_Product
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Status.Visible = true;
                String PartyName = TextBox1.Text;
                SqlAddParty.InsertParameters["PartyName"].DefaultValue = PartyName;
                SqlAddParty.Insert();
                Status.Text = "Data Inserted Succesfully";
            }
            catch (Exception ex)
            {
                Status.Text = ex.Message;
            }
        }
    }
}