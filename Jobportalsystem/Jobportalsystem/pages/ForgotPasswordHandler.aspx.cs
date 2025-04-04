using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Jobportalsystem.Database;
using MySql.Data.MySqlClient;

namespace Jobportalsystem.pages
{
    public partial class ForgotPasswordHandleraspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1: get email and password form ajax request
            string email = Request.Form["Email"];
            if (string.IsNullOrEmpty(email))
            {
                Response.Write("Please enter and email.");  // missing input
                return;
            }

            // step:2 check if email existsin database
            using (MySqlConnection conn = DBconnection.GetConnection())
            {
                conn.Open();

                string query = "SELECT * FROM Users WHERE Email = @Email AND Password= @Password";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("Email", email);


                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Response.Write("Email not found.");
                    return;
                }
            }
            // step 3: generate reset token
            string resetToken = Guid.NewGuid().ToString();
            string resetLink = 
        }
    }
}