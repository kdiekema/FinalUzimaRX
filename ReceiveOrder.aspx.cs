using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

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
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [DateOrdered], [CurrentLocationId], [ExpirationDate] " +
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

        protected void ReceiveOrderGridview_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ReceiveOrderGridview.PageIndex = e.NewPageIndex;
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select [UzimaInventory].[Id], [DrugName], [Status], [DateOrdered], [CurrentLocationId], [ExpirationDate] " +
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

        protected void ReceiveOrderDownload_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=ReceiveOrder.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            ReceiveOrderGridview.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            PdfWriter writer = PdfWriter.GetInstance(pdfdoc, Response.OutputStream);
            pdfdoc.Open();
            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfdoc, sr);
            pdfdoc.Close();
            Response.Write(pdfdoc);
            Response.End();
            ReceiveOrderGridview.AllowPaging = true;
            ReceiveOrderGridview.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}