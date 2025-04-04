using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Jobportalsystem.Database;
using MySql.Data.MySqlClient;
using static System.Net.Mime.MediaTypeNames;

namespace Jobportalsystem
{
    public partial class UserDashboard : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // step 1: check if user is logged in
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");   // return to login is session is empty
            }
            else
            {
                // step:2 get user email from session
                string email = Session["UserEmail"].ToString();

                // step 3; fetch user details from database
                using(MySqlConnection conn = DBconnection.GetConnection())
                {
                    conn.Open();

                    // step 4: fetch user data
                    string query = "SELECT FullName, Email FROM Users WHERE Email = @Email";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue(@"Email", email);

                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        liUserName.Text = reader["FullName"].ToString();
                        litUserEmail.Text = reader["Email"].ToString();
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // step:5 clear session and  redirect
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }   
}