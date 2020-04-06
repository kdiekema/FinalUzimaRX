using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace UzimaRX
{
    public partial class DurgList : System.Web.UI.Page
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
            DrugListGridView.DataSource = dt;
            DrugListGridView.DataBind();*/
        }

        protected void InventorySearchBtn_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "Select *" +
                "From[UzimaDrug]"+
                "Where [DrugName] like '%'+@DrugName+'%'";
            sqlcomm.Parameters.AddWithValue("DrugName", DrugListSearch.Text);
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = sqlconn;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            DrugListGridView.DataSource = dt;
            DrugListGridView.DataBind();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            DrugListGridView.PageIndex = e.NewPageIndex;
            DrugListGridView.DataBind();
        }

    }
}