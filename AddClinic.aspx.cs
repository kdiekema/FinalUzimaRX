using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UzimaRX
{
    public partial class AddClinic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 

            if (!IsPostBack)
            {
                clearFields();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearFields();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
                string query = "INSERT INTO UzimaLocation VALUES(@LocationName, @Address, @Phone) ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtLName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();
            }

        }

            protected void clearFields()
        {
            lblSubmit.Visible = false;
        }
    }
}