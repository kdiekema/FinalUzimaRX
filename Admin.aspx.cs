using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UzimaRX
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnAddRoles_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int roleid = Convert.ToInt32(ListRole.SelectedValue);
                string users = Convert.ToString(ddlUsers.SelectedValue);

                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "IF EXISTS (select * from [AspNetUserRoles] WHERE UserId = '" + users + "') UPDATE [AspNetUserRoles] set RoleId = " + roleid +" where UserId = '" + users + "' ELSE INSERT into [AspNetUserRoles](UserId, RoleId) values('" + users + "', " +roleid + ")";
                SqlCommand cmd = new SqlCommand(insertSql, con);
                sqlcomm.CommandText = insertSql;
                sqlcomm.Connection = con;
                sqlcomm.ExecuteNonQuery();

                Lblsbmt.Text = "Role Changed";
            }
        }

        protected void BtnNewRole_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "Insert INTO [AspNetRoles](Name) OUTPUT INSERTED.Id VALUES (@txtRole);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@txtRole", txtRole.Text);

                var Id = (int)cmd.ExecuteScalar();

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}