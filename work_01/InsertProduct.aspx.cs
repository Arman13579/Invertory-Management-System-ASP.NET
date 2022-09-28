using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_01
{
    public partial class InsertProduct : System.Web.UI.Page
    {
        public InsertProduct()
        {
            InitializeCulture();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFile)
            {
                var file = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + file);
                e.Values["ProductPicture"]= file;
            }
            
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
           
        }
    }
}