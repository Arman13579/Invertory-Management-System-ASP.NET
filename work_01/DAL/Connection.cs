using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace work_01.DAL
{
    public static class Connection
    {
        public static string ConnectionString()
        {
            string conString = "Data Source=.;Initial Catalog=dbInventoryManagement;Integrated Security=True";
            return conString;
        }
    }
}