using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Jobportalsystem.Database;
using MySql.Data.MySqlClient;

namespace Jobportalsystem.pages
{
    public partial class LoginHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1: get email and password form ajax request
            string email = Request.Form["Email"];
            string password = Request.Form["Password"];
            if(string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Response.Write("error");  // missing input
                return;
            }

            // step 2 : hash the entered password to  compare with stored hash
            string hashedPassword = HashPassword(password);

            // step 3: connet to mysql and check credetials
            using (MySqlConnection conn = DBconnection.GetConnection()) 
            {
                conn.Open();

                string query = "SELECT * FROM Users WHERE Email = @Email AND Password= @Password";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("Email", email);
                cmd.Parameters.AddWithValue ("@Password", password);

                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())   // if login is successful
                {
                    Session["UserEmail"] = email;   // store session
                    Response.Write("success"); // send success response to the Ajax
                }
                else
                {
                    Response.Write("error"); // invalid credentials
                }
            }
        }
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