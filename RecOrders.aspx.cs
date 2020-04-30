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
    public partial class RecOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //SqlConnection sqlconn = new SqlConnection(mainconn);
            //sqlconn.Open();
            //SqlCommand sqlcomm = new SqlCommand();
            //string sqlquery = "Select *" +
            //    "From[UzimaDrug]" +
            //    "Where [Id] like " + Request.QueryString["Id"];
            //sqlcomm.CommandText = sqlquery;
            //sqlcomm.Connection = sqlconn;
            //DataTable dt = new DataTable();
            //SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            //sda.Fill(dt);
            //RecOrderGridview.DataSource = dt;
            //RecOrderGridview.DataBind();
        }

        protected void RecBtn_Click(object sender, EventArgs e)
        {
            //string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //SqlConnection sqlconn = new SqlConnection(mainconn);
            //sqlconn.Open();
            //SqlCommand sqlcomm = new SqlCommand();
            //string quantityOrdered = OrderQuantity.Text;
            //string sqlquery = "DECLARE @count INT " + "DECLARE @quantity INT " + "SET @count = 0 " + "SET @quantity = " + quantityOrdered + " WHILE @count != @quantity" + " BEGIN" +
            //    " INSERT INTO [UzimaInventory](DateOrdered, LastModifiedBy, DrugID, StatusID) " + "VALUES(GETDATE(), 1, " + Request.QueryString["Id"] + ", 1)" + " SET @count += 1 " + "END";


            //sqlcomm.CommandText = sqlquery;
            //sqlcomm.Connection = sqlconn;
            //sqlcomm.ExecuteNonQuery();
            //Response.Redirect("~/DrugList.aspx");
        }

        protected void PlaceOrderGridview_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //RecOrderGridview.PageIndex = e.NewPageIndex;
            //string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //SqlConnection sqlconn = new SqlConnection(mainconn);
            //sqlconn.Open();
            //SqlCommand sqlcomm = new SqlCommand();
            //string quantityOrdered = OrderQuantity.Text;
            //string sqlquery = "DECLARE @count INT " + "DECLARE @quantity INT " + "SET @count = 0 " + "SET @quantity = " + quantityOrdered + " WHILE @count != @quantity" + " BEGIN" +
            //    " INSERT INTO [UzimaInventory](DateOrdered, LastModifiedBy, DrugID, StatusID) " + "VALUES(GETDATE(), 1, " + Request.QueryString["Id"] + ", 1)" + " SET @count += 1 " + "END";

            //sqlcomm.CommandText = sqlquery;
            //sqlcomm.Connection = sqlconn;
            //sqlcomm.ExecuteNonQuery();
            //Response.Redirect("~/DrugList.aspx");
        }

    }
}