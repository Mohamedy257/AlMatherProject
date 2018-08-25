using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.DB_Model;

namespace MZ.ComplaintsSystems
{
    public partial class RegularMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropdownLists();
            }
            else
            {
                using (Entities1 db = new Entities1())
                {
                    grditems.DataSource = null; DataBind();
                    grditems.DataSource = db.usp_RegularMaintenceInsertSelect(dtemaintenance.Date, Convert.ToInt16(drptower.Value));
                    DataBind();
                }
            }
        }
      

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                //db.usp_RegularMaintenceInsertSelect(dtemaintenance.Date);
                grditems.DataSource = db.usp_RegularMaintenceInsertSelect(dtemaintenance.Date, Convert.ToInt16(drptower.SelectedItem.Value));
                DataBind();
            }
        }

        protected void grditems_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                for (int i = 0; i < e.UpdateValues.Count; i++)
                {
                    grditems.BeginUpdate();
                    db.usp_RegularMaintenceUpdate(Convert.ToInt16(e.UpdateValues[i].Keys[0]), dtemaintenance.Date, Convert.ToInt16(e.UpdateValues[i].Keys[1]), Convert.ToInt16(e.UpdateValues[i].NewValues[0]));
                    grditems.EndUpdate();

                }
                e.Handled = true;

                grditems.DataSource = db.usp_RegularMaintenceInsertSelect(dtemaintenance.Date,Convert.ToInt16(drptower.SelectedItem.Value));
                DataBind();
              
            }
        }
        private void FillDropdownLists()
        {
            using (Entities1 db = new Entities1())
            {
         
                drptower.DataSource = db.usp_TowersSelect(null).ToList();
                drptower.TextField = "Name";
                drptower.ValueField = "ID";


               
                    //db.usp_RegularMaintenceInsertSelect(dtemaintenance.Date);
                    
                
                DataBind();
            }
        }
    }
}