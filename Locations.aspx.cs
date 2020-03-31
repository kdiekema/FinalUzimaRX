using System;
using System.Collections.Generic;
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


    }
}