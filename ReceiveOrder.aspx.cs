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
    public partial class ReceiveOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [DateOrdered] " +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus]" +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND [UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND [StatusID] = 2";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            ReceiveOrderGridview.DataSource = dt;
            ReceiveOrderGridview.DataBind();
        }

        protected void ReceiveOrderBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string value = ReceiveOrderGridview.Rows[index].Cells[0].Text;


            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "UPDATE UzimaInventory" + " SET [StatusId] = 0" + " WHERE [Id] = " + value;
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.ExecuteNonQuery();
            Response.Redirect("~/ReceiveOrder.aspx");
        }
    }
}