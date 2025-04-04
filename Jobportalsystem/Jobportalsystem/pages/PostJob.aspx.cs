using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using Jobportalsystem.Database;

namespace Jobportalsystem.pages
{
    public partial class PostJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string company = txtcompany.Text.Trim();
            string location = txtLocation.Text.Trim();  
            string description = txtDescription.Text.Trim();
            string salary = txtSalary.Text.Trim();  
            DateTime PostedAt = DateTime.Now;   // store the current timestamp

            using (MySqlConnection conn = DBconnection.GetConnection())
            {
                conn.Open();
                string query = "INSER INTO Jobs (Title, Company, Location, Description, Salary, PostedAt)" +
                               "VALUES(@Title, @Company, @Location, @Description, @Salary, @PostedAt)";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                   
                }
            }
        }
    }
}