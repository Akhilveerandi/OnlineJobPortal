using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Jobportalsystem.Database;
using Microsoft.Ajax.Utilities;
using MySql.Data.MySqlClient;

namespace Jobportalsystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // get user input
            string email = txtEmail.Value;
            string password = txtPassword.Value;

            // 2: hash the entered password
            string hashedPassword = HashPassword(password);

            using (MySqlConnection conn = DBconnection.GetConnection())
            {
                conn.Open();
                string query = "SELECT * FROM Users WHERE Email = @Email AND Password= @Password";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                using (MySqlDataReader reader = cmd.ExecuteReader())
                    if (reader.Read())         // if  a matching user exists
                    {
                        // store user session
                        Session["UserEmail"] = email;

                        // redirect to Dashboard
                        Response.Redirect("Dashboard.aspx");
                    }
                else
                    {
                        Response.Write("<script>alert('Invalid Email or password');</script>");
                    }
            }
        }
        // Hash password function (same as in register.aspx.cs)
        private string HashPassword(string password)
        {
            // step 1: convert password to byte  array
            byte[] bytes = Encoding.UTF8.GetBytes(password);

            // step 2: hash using SHA256
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hash = sha256.ComputeHash(bytes);

                // stpe 3 : convert hasedpasword byte to a string
                return Convert.ToBase64String(hash);
            }
        }
    }
}