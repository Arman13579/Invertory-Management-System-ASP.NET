using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace work_01.Models
{
    public class Category
    {
        public  int Id { get; set; }
        [Required,StringLength(40,ErrorMessage ="Category Name is required")]
        public string CategoryName { get; set; }
    }
}