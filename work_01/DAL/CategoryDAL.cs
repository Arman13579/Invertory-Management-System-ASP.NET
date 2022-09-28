using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using work_01.Models;
using work_01.DAL;
using System.Data;

namespace work_01.DAL
{
    
    public class CategoryDAL
    {
        /*
        SqlConnection con = new SqlConnection(Connection.ConnectionString());
        public IQueryable<Category> Get()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT id,CategoryName FROM tblCategory", con);
            sda.Fill(dt);
            return dt.AsEnumerable()
                .Select(r => new Category
                {
                    Id = r.Field<int>("id"),
                    CategoryName = r.Field<string>("CategoryName")
                })
                .AsQueryable();
        }
        
        public void Insert(Category c)
        {
            SqlCommand cmd = new SqlCommand("insert into tblCategory(CategoryName) values(@n)", con);
            cmd.Parameters.AddWithValue("@n", c.CategoryName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void Update(Category c)
        {
            SqlCommand cmd = new SqlCommand("UPDATE tblCategory SET CategoryName=@n WHERE id=@i", con);
            cmd.Parameters.AddWithValue("@n", c.CategoryName);
            cmd.Parameters.AddWithValue("@i", c.Id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM tblCategory WHERE id=@i", con);
            cmd.Parameters.AddWithValue("@i", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        */
    }
}