using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UzimaRX
{
    public partial class Locations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnClinic(object sender, EventArgs e)
        {
            Response.Redirect("AddClinic.aspx");
        }

        protected void BtnHospital(object sender, EventArgs e)
        {
            Response.Redirect("AddHospital.aspx");

        }

        protected void BtnSupplier(object sender, EventArgs e)
        {
            Response.Redirect("AddSupplier.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DownloadLocations_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Locations.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            PdfWriter writer = PdfWriter.GetInstance(pdfdoc, Response.OutputStream);
            pdfdoc.Open();
            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfdoc, sr);
            pdfdoc.Close();
            Response.Write(pdfdoc);
            Response.End();
            GridView1.AllowPaging = true;
            GridView1.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}