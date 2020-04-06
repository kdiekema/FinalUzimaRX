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
    public partial class SendOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate] " +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [StatusID] = 1";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            SendOrderGridview.DataSource = dt;
            SendOrderGridview.DataBind();
        }

        protected void SendOrderBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string value = SendOrderGridview.Rows[index].Cells[0].Text;


            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "UPDATE UzimaInventory" + " SET [StatusId] = 2" + " WHERE [Id] = " + value;
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.ExecuteNonQuery();
            Response.Redirect("~/SendOrder.aspx");
        }
    }
}