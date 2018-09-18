using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.DB_Model;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using System.Data.Entity.Core.Objects;
using MZ.ComplaintsSystems.Util;
using System.Transactions;
using MZ.ComplaintsSystems.Models;

namespace MZ.ComplaintsSystems
{
    public partial class Complaints : System.Web.UI.Page
    {
        public string NotificationMessageEnum { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillDropdownLists();
                }
            }
            catch (Exception exception)
            {
                Log.Error(exception.StackTrace);
            }
        }

        private void FillDropdownLists()
        {
            using (Entities1 db = new Entities1())
            {
                drplvl1.DataSource = db.usp_CatogeriesSelect(null).ToList();
                drplvl1.ValueField = "ID";
                drplvl1.TextField = "Name";
                drptower.DataSource = db.usp_TowersSelect(null).ToList();
                drptower.TextField = "Name";
                drptower.ValueField = "ID";
                DataBind();
            }
        }
        private void FillCommonTypes(int Id)
        {
            using (Entities1 db = new Entities1())
            {
                drplvl2.DataSource = db.usp_CommonTypesSelectByCatogeryByCatogery(Id).ToList();
                drplvl2.ValueField = "ID";
                drplvl2.TextField = "Name";
                DataBind();
            }
        }
        private void FillCommonItems(int Id)
        {
            using (Entities1 db = new Entities1())
            {
                drplvl3.DataSource = db.usp_CommonItemsSelectByType(Id).ToList();
                drplvl3.ValueField = "ID";
                drplvl3.TextField = "Name";
                DataBind();
            }
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

        protected void btnsbmit_Click(object sender, EventArgs e)
        {
            try
            {
                usp_NotificationMessagesInsertProcedure_Result notificationRecord = null;
                usp_ComplaintsInsert_Result complaintResult = null;
                using (TransactionScope tx = new TransactionScope())
                {
                    using (Entities1 db = new Entities1())
                    {
                        ObjectResult<usp_ComplaintsInsert_Result> x =
                         db.usp_ComplaintsInsert(
                                 Convert.ToInt16(drpapartmentnumber.Value),
                                 Convert.ToInt16(drplvl1.Value),
                                 Convert.ToInt16(drplvl2.Value),
                                 Convert.ToInt16(drplvl3.SelectedItem.Value),
                                 Convert.ToDateTime(txtfixdatetime.Text),
                                 DateTime.Now,
                                 null,
                                 (int)ComplaintStatusEnum.Created,
                                 null,
                                 null,
                                 User.Identity.GetUserId(),
                                 memonotes.Text,
                                 txtsubject.Text
                                 , txtSearch.Text
                                 , txtphone.Text
                                 , txtcustomername.Text
                                 , Convert.ToInt16(drpownertype.SelectedItem.Value)
                                 , txtother.Text
                             );

                        complaintResult = x.FirstOrDefault();

                        btnprint.CommandArgument = complaintResult.ID.ToString();
                        btnnew.Visible = true;
                        btnprint.Visible = true;
                        btnsumnit.Visible = false;
                        resultmessage.Attributes["class"] = "alert-success";
                        displayID.Value = "true";
                        txtID.Text = "926/" + complaintResult.ID.ToString("0000000");
                        txtCreationDate.Text = complaintResult.CreateDateTime.ToString();
                        lbltxtresult.Text = "تم اضافة البلاغ بنجاح";
                        string messageText = string.Format(Utilities.GetDescription(NotificationMessagesEnum.ComplaintCreationSMS), complaintResult.ID.ToString("9260000000"), complaintResult.CreateDateTime.Value.ToString("dd/MM/yyyy"));
                        ObjectResult<usp_NotificationMessagesInsertProcedure_Result> y =
                        db.usp_NotificationMessagesInsertProcedure(
                           "966" + complaintResult.Phone.TrimStart('0'),
                            complaintResult.ID.ToString("9260000000"),
                            messageText,
                             null,
                             1,
                             1,
                             DateTime.Now
                            );
                        notificationRecord = y.FirstOrDefault();


                    }
                    tx.Complete();
                }
                string message = string.Format(Utilities.GetDescription(NotificationMessagesEnum.ComplaintCreationSMS), complaintResult.ID.ToString("9260000000"), complaintResult.CreateDateTime.Value.ToString("dd/MM/yyyy"));
                Utilities.SendSMS(notificationRecord.MobileNumber, message, notificationRecord.ID);
            }
            catch (Exception exception)
            {
                Log.Error(exception.StackTrace);
                throw new Exception("خطاء اثناء تنفيذ العملية !");
            }

        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (e.Parameter == "lvl1")
            {
                FillCommonTypes(Convert.ToInt16(drplvl1.Value));
            }
        }

        protected void drplvl2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCommonTypes(Convert.ToInt16(e.Parameter));
        }

        protected void drplvl3_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCommonItems(Convert.ToInt16(e.Parameter));
        }

        protected void drpapartmentnumber_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillApartments(Convert.ToInt16(e.Parameter));
        }

        protected void lnksearch_Click(object sender, EventArgs e)
        {
            using (Entities1 db = new Entities1())
            {
                DisableEnableControls(true);
                Customer cr = db.Customers.Where(x => x.IDNumber.ToString() == txtSearch.Text).FirstOrDefault();
                if (cr != null)
                {
                    txtcustomername.Text = cr.FullName;
                    txtphone.Text = cr.Phone;
                    //drpgender.SelectedValue = cr.Gender.ToString();
                    drpownertype.SelectedItem.Value = cr.OwnershipType.ToString();
                }
                else
                    return;

            }

        }
        private void DisableEnableControls(bool flag)
        {
            drpapartmentnumber.Enabled = flag;
            drptower.Enabled = flag;
            drplvl1.Enabled = flag;
            drplvl2.Enabled = flag;
            drplvl3.Enabled = flag;
            txtfixdatetime.Enabled = flag;
            memonotes.Enabled = flag;
            txtsubject.Enabled = flag;
        }
        private void Clear()
        {
            txtSearch.Text = "";
            txtphone.Text = "";
            txtcustomername.Text = "";
            drpownertype.SelectedIndex = -1;
            drpapartmentnumber.Text = "";
            drptower.SelectedIndex = -1;
            drplvl1.SelectedIndex = -1;
            drplvl2.SelectedIndex = -1;
            drplvl3.SelectedIndex = -1;
            txtfixdatetime.Text = "";
            memonotes.Text = "";
            txtsubject.Text = "";
        }

        protected void btnprint_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open ('PrintWO.aspx?Id=" + btnprint.CommandArgument + "','_blank');</script>");
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
            btnsumnit.Visible = true;
            btnprint.Visible = false;
            btnnew.Visible = false;
        }


    }
}