using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

namespace UzimaRX
{
    public partial class Receive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName] AS Drug_Name, [Status], [DateOrdered] AS Date_Ordered, [CurrentLocationId] AS Current_Location, [ExpirationDate] AS Expiration_date " +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus]" +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND [UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND [UzimaInventory].[Id] = " + Request.QueryString["Id"];
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "UPDATE [UzimaInventory]" +
               "SET [UzimaInventory].[StatusId] = 0, [UzimaInventory].[CurrentLocationId] =" + ddlLocation.SelectedValue + ", [UzimaInventory].[ExpirationDate] = convert(datetime, '" + tbExpirationDate.Text + "', 103) WHERE [UzimaInventory].[Id] = " + Request.QueryString["Id"];

            SqlCommand cmd = new SqlCommand(sqlquery, sqlconn);
            cmd.Parameters.AddWithValue("@CurrentLocationId", ddlLocation.SelectedValue);
            cmd.Parameters.AddWithValue("@ExpirationDate", "convert(datetime, '" + tbExpirationDate.Text + "', 103)");

            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.ExecuteNonQuery();
            Response.Redirect("~/Inventory.aspx");



        }
    }
}