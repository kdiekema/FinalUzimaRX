using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.tool.xml;

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
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND [UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [StatusID] = 0";
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
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [StatusID] = 0 AND [DrugName] like '%'+@DrugName+'%'";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            sqlcomm.Parameters.AddWithValue("DrugName", InventorySearch.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            InventoryGridview.DataSource = dt;
            InventoryGridview.DataBind();
        }

        protected void InventoryGridview_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void show_all_click(object sender, EventArgs e)
        {
            InventoryGridview.Visible = true;

            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate], [UzimaInventory].[Id]" +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [StatusID] = 0";
            sqlcomm.Parameters.AddWithValue("DrugName", InventorySearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            InventoryGridview.DataSource = dt;
            InventoryGridview.DataBind();

        }

        protected void btn_clear_click(object sender, EventArgs e)
        {
            InventoryGridview.Visible = false;
        }

        protected void InventoryGridview_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            InventoryGridview.PageIndex = e.NewPageIndex;
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [DrugName], [Status], [LocationName], [DateOrdered], [ExpirationDate], [UzimaInventory].[Id]" +
                "From[UzimaDrug], [UzimaInventory], [UzimaStatus], [UzimaLocation] " +
                "Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND[UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND[UzimaInventory].[CurrentLocationId] = [UzimaLocation].[Id] AND [StatusID] = 0";
            sqlcomm.Parameters.AddWithValue("DrugName", InventorySearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            InventoryGridview.DataSource = dt;
            InventoryGridview.DataBind();
        }

        protected void DownloadInventory_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Inventory.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            InventoryGridview.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            PdfWriter writer = PdfWriter.GetInstance(pdfdoc, Response.OutputStream);
            pdfdoc.Open();
            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfdoc, sr);
            pdfdoc.Close();
            Response.Write(pdfdoc);
            Response.End();
            InventoryGridview.AllowPaging = true;
            InventoryGridview.DataBind();


        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }

    }

}