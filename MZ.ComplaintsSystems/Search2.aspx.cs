using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.DB_Model;

namespace MZ.ComplaintsSystems
{
    public partial class Search2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                FillDropdownLists();
            }
            using (Entities1 db = new Entities1())
            {

                ASPxGridView1.DataSource = db.usp_QueryComplaints(Convert.ToInt16(drpapartmentnumber.Value), Convert.ToInt16(drptower.Value),"2,3");
                DataBind();
            }
        }

        protected void ASPxGridView1_DataBinding(object sender, EventArgs e)
        {
            
        }

        

        
        private void FillDropdownLists()
        {
            using (Entities1 db = new Entities1())
            {
                           
                drptower.DataSource = db.usp_TowersSelect(null).ToList();
                drptower.TextField = "Name";
                drptower.ValueField = "ID";

                //----------------------

                DataBind();
            }
        }
       

        protected void drpapartmentnumber_Callback1(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillApartments(Convert.ToInt16(e.Parameter));
        }
        private void FillApartments(int Id)
        {
            using (Entities1 db = new Entities1())
            {
                drpapartmentnumber.DataSource = db.usp_ApartmentsSelectByTower(Id).ToList();
                drpapartmentnumber.ValueField = "ID";
                drpapartmentnumber.TextField = "Name";
                DataBind();
            }
        }
    }
}