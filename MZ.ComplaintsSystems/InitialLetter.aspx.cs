using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.DB_Model;
namespace MZ.ComplaintsSystems
{
    public partial class InitialLetter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string complaintId = Request.QueryString["Id"].ToString();
            FillComplaintData(Convert.ToInt16(complaintId));
            
        }
        private void FillComplaintData(int Id)
        {
            using (Entities1 db = new Entities1())
            {

                Vw_Complaints cm = db.Vw_Complaints.Where(x => x.ID == Id).FirstOrDefault();


               
                //lvl2.Text = cm.type;
                ApID.Text = cm.OtherApartment;
                otherap.Text = cm.flat;
                other2.Text = cm.flat;
                //TowerId.Text = cm.Name;
                //lvl1.Text = cm.cat;
                //lvl3.Text = cm.Item;
                //visittime.Text = cm.AppointmentDateTime.ToString();
                //memo.Text = cm.Note;
                //subject.Text = cm.Subject;
               
                
                
                
            }
            //drpownertype.SelectedIndex = Convert.ToInt16(cm.OwnershipType);

        }
    }
}