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
    public partial class AddHospital : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearFields();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "INSERT INTO [UzimaLocations](LocationName,Address,Phone,Type,Supplier) OUTPUT INSERTED.Id VALUES (@LocationName,@Address,@Phone,@Type,@Supplier);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@LocationName", txtLName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Type", "Hospital");
                cmd.Parameters.AddWithValue("@Supplier", ddlSupp.SelectedValue);


                var LocationId = (int)cmd.ExecuteScalar();

                lblSubmit.Visible = true;
                lblSubmit.Text = "Submitted";
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearFields();

        }

        protected void clearFields()
        {
            txtLName.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
            lblSubmit.Visible = false;
        }
    }
}