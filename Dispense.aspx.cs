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
    public partial class Dispense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate] " +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [UzimaInventory].[Id] = "+ Request.QueryString["Id"];
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            DispenseGridview.DataSource = dt;
            DispenseGridview.DataBind();
        }

        protected void DispenseBtn_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "UPDATE [UzimaInventory]" +
                "SET [UzimaInventory].[StatusId] = 3" +
                "WHERE [UzimaInventory].[Id] = " + Request.QueryString["Id"];
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.ExecuteNonQuery();
            Response.Redirect("~/Inventory.aspx");
        }
    }
}