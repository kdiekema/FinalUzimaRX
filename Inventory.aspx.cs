using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace UzimaRX
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate] " +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id]";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            InventoryGridview.DataSource = dt;
            InventoryGridview.DataBind();
        }

        protected void InventorySearchBtn_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate], [UzimaInventory].[Id]" +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [DrugName] like '%'+@DrugName+'%'";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.Parameters.AddWithValue("DrugName", InventorySearch.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            InventoryGridview.DataSource = dt;
            InventoryGridview.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}