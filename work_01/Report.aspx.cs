using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_01
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=dbInventoryManagement;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select p.*,c.CategoryName,s.CompanyName from tblProducts p join tblCategory c  on p.ProductId = c.id join tblInventory i on i.InventoryId = p.ProductId join tblSuppliers s on s.SupplierId=i.SupplierId ", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport.rpt"));
            cryRpt.SetDataSource(ds.Tables["CrystalReportViewer1"]);
            
            CrystalReportPartsViewer1.ReportSource = cryRpt;
            cryRpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Product Information");
        }
    }
}