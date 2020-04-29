using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;

namespace UzimaRX
{
    public partial class AddInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select *" +
                "From[UzimaDrug]";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            AddInventoryGridView.DataSource = dt;
            AddInventoryGridView.DataBind();*/

        }

        protected void InventorySearchBtn_Click(object sender, EventArgs e)
        {
            AddInventoryGridView.Visible = true;

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select *" +
                "From[UzimaDrug]" +
                "Where [DrugName] like '%'+@DrugName+'%'";
            sqlcomm.Parameters.AddWithValue("DrugName", AddInventorySearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            AddInventoryGridView.DataSource = dt;
            AddInventoryGridView.DataBind();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            AddInventoryGridView.PageIndex = e.NewPageIndex;
            AddInventoryGridView.DataBind();
        }

        protected void show_all_click(object sender, EventArgs e)
        {
            AddInventoryGridView.Visible = true;

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select *" +
                "From[UzimaDrug]";
            sqlcomm.Parameters.AddWithValue("DrugName", AddInventorySearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            AddInventoryGridView.DataSource = dt;
            AddInventoryGridView.DataBind();

        }

        protected void btn_clear_click(object sender, EventArgs e)
        {
            AddInventoryGridView.Visible = false;
        }

        protected void AddInventoryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AddInventoryGridView.PageIndex = e.NewPageIndex;
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select *" +
                "From[UzimaDrug]";
            sqlcomm.Parameters.AddWithValue("DrugName", AddInventorySearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            AddInventoryGridView.DataSource = dt;
            AddInventoryGridView.DataBind();
        }

        protected void AddInventoryBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string value = AddInventoryGridView.Rows[index].Cells[0].Text;


            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "SELECT *" + " FROM [UzimaDrug]" + " WHERE [UzimaDrug].[Id] = " + value;
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            AddInventory2Gridview.DataSource = dt;
            AddInventory2Gridview.DataBind();
        }

        protected void AddInventory2Btn_Click(object sender, EventArgs e)
        {

            string Id = AddInventory2Gridview.Rows[0].Cells[0].Text;
            string quantity = txtQuantity.Text;
            string ED = txtExpire.Text;
            string Loc = ddlSupp.SelectedValue;

            string sqlquery = "DECLARE @count INT DECLARE @quantity INT DECLARE @locId VARCHAR SET @quantity = " + quantity + 
                " SET @count = 0 " + "SELECT @locId = UzimaLocations.Id FROM UzimaLocations WHERE UzimaLocations.LocationName = '" + Loc + "' " +
                "WHILE @count != @quantity BEGIN INSERT INTO UzimaInventory(DateOrdered, LastModifiedBy, DrugId, StatusId, CurrentLocationId, ExpirationDate)" + 
                "VALUES(GETDATE(), 1," + Id + ", 0, @locId, convert(datetime, '" + ED+"', 103)) SET @count = @count + 1 END";
               
            
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.ExecuteNonQuery();
            Response.Redirect("~/AddInventory.aspx");
        }
    }
}