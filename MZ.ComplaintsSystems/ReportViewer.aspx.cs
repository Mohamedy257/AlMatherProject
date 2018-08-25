using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.ComplaintsSystems.Reports;
namespace MZ.ComplaintsSystems
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             string reportId=Request.QueryString["ReportId"].ToString();
             if (reportId == "1")
                 ASPxDocumentViewer1.ReportTypeName = "MZ.ComplaintsSystems.TowersReport";
             else if (reportId=="2")
                 ASPxDocumentViewer1.ReportTypeName = "MZ.ComplaintsSystems.Reports.RegularmaintenanceReport";
             else if (reportId=="2")
                 ASPxDocumentViewer1.ReportTypeName = "MZ.ComplaintsSystems.Reports.ApartmentsReport";

             ASPxDocumentViewer1.DataBind();
        }
    }
}