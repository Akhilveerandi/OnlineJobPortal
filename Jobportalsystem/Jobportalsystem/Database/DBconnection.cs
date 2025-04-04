using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Jobportalsystem.Database
{
    public class DBconnection
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["jobportaldb"].ConnectionString;
        public static MySqlConnection GetConnection()
        {
            MySqlConnection conn = new MySqlConnection(connStr);
            return conn;
        }
    }
}