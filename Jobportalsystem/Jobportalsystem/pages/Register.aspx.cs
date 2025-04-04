using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using BCrypt.Net;
using Org.BouncyCastle.Crypto.Generators;
using Jobportalsystem.Database;
using System.Text;
using System.Security.Cryptography;

namespace Jobportalsystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //  step 1: get user input from the form fiels
            string fullName = txtFullName.Value;
            string email = txtEmail.Value;
            string password = txtPassword.Value;

            // step 2: Hash the password
            string hashedPassword = HashPassword(password);
            
            // step 3: connect to the database
            using (MySqlConnection conn = DBconnection.GetConnection() )
            {
                conn.Open();
                // step 3: insert user data into users table
                string query = "INSERT INTO Users (FullName,Email,Password) VALUES (@FullName,@Email,@Password)";
                MySqlCommand cmd = new MySqlCommand(query, conn); 
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password",hashedPassword); // save the hashed password
                // execute sql query
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Registration sucessfull!'); window.location='Login.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert(' Error in Registration!');</script>");
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