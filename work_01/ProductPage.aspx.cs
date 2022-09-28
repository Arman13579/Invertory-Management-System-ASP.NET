using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_01
{
    public partial class ProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fu = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("fuPicture");
           
            if (fu != null)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                    fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + f);
                    e.NewValues["ProductPicture"] = f;
                }

            }
        }
    }
}