using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MZ.DB_Model;
using System.Diagnostics;
using Novacode;
using System.IO;
using DevExpress.Web;
using Microsoft.AspNet.Identity;
using MZ.ComplaintsSystems.Models;
using MZ.ComplaintsSystems.Util;

namespace MZ.ComplaintsSystems
{
    public partial class EditComplaints : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillDropdownLists();
                    string x = Request.QueryString["Id"].ToString();
                    FillComplaintData(Convert.ToInt32(x));
                }
            }
            catch (Exception exception)
            {
                Log.Error(exception.StackTrace);
                throw new Exception("خطاء اثناء تنفيذ العملية !");
            }
        }
        public void CreateSampleDocument2(int Id)
        {
            using (Entities1 db = new Entities1())
            {

                Vw_Complaints cm = db.Vw_Complaints.Where(x => x.ID == Id).FirstOrDefault();
                Apartment ap = db.Apartments.Where(x => x.Name == cm.flat).FirstOrDefault();
                Tower tw = db.Towers.Where(x => x.Name == cm.Name).FirstOrDefault();
                string body = string.Format("وردنا شكوي تسرب مياه صادر علي شقة رقم ({0}) وبخروج فني الصيانة عن مكان التسرب تبين الاتي:", cm.OtherApartment);
                string subject = string.Format("المحترم / ساكن الشقة رقم ({0}) برج رقم                 ({1}) المحترم", ap.ID, tw.ID);
                string footer = string.Format("صورة مع التحية شقة رقم ({0})", cm.OtherApartment);
                DocX document = DocX.Load(@"C:\test\Template.docx");
                Paragraph p0 = document.InsertParagraph();
                p0.Direction = Novacode.Direction.RightToLeft;
                p0.Append(string.Format("التاريخ {0}", string.Format("{0:d/M/yyyy}", DateTime.Now)));
                p0.Bold();
                Paragraph p1 = document.InsertParagraph();
                p1.Direction = Novacode.Direction.RightToLeft;
                p1.Append(subject);
                p1.Bold();
                Paragraph p2 = document.InsertParagraph();
                p2.Direction = Novacode.Direction.RightToLeft;
                p2.Append("السلام عليكم ورحمة الله وبركاتة");
                p2.Bold();
                Paragraph p3 = document.InsertParagraph();
                p3.Direction = Novacode.Direction.RightToLeft;
                p3.Append(body);
                Paragraph p7 = document.InsertParagraph();
                p7.Direction = Novacode.Direction.RightToLeft;
                p7.Append("............................................................................................................................");
                p7.Append("............................................................................................................................");
                p7.Append("............................................................................................................................");
                p7.Append("............................................................................................................................");
                p7.Append("............................................................................................................................");
                p7.Append("............................................................................................................................");

                Paragraph p4 = document.InsertParagraph();
                p4.Direction = Novacode.Direction.RightToLeft;
                p4.Append("شاكرين حسن تعاونكم");
                p4.Alignment = Alignment.center;
                p4.Bold();
                p4.SpacingAfter(20);
                Paragraph p5 = document.InsertParagraph();
                p5.Append("ادارة مجمع اسكان المعذر");
                p5.Alignment = Alignment.left;
                p5.Direction = Novacode.Direction.RightToLeft;
                p5.Bold();
                Paragraph p6 = document.InsertParagraph();
                p6.Direction = Novacode.Direction.RightToLeft;
                p6.Append(footer);
                document.SaveAs(Server.MapPath("/Docs/WordAlignment.docx"));
                Context.Response.Clear();
                FileInfo file = new FileInfo(Server.MapPath("/Docs/WordAlignment.docx"));
                Context.Response.ContentType = "Application/msword";
                Context.Response.AppendHeader("Content-Disposition", "inline; filename=" + file.Name);
                Context.Response.AppendHeader("Content-Length", file.Length.ToString());
                Context.Response.WriteFile(file.FullName);
                Context.Response.End();
                //System.Diagnostics.Process.Start("WordAlignment.docx");
            }
        }
        public void CreateSampleDocument(int Id)
        {
            using (Entities1 db = new Entities1())
            {

                Vw_Complaints cm = db.Vw_Complaints.Where(x => x.ID == Id).FirstOrDefault();
                Apartment ap = db.Apartments.Where(x => x.Name == cm.flat).FirstOrDefault();
                Tower tw = db.Towers.Where(x => x.Name == cm.Name).FirstOrDefault();
                string body = string.Format("نشعركم بوجود تسرب مياة صادر من شقتكم علي جاركم شقة رقم ({0}) نامل اصلاح التسرب في اسرع وقت ممكن او الاتصال علي قسم الصيانة تلفون رقم (4620591) ليتمكن فني الصيانة من الكشف عن مصدر التسرب واصلاحة ووقف الضرر علي جاركم والحفاظ علي سلامة المبني. ", cm.OtherApartment);
                string subject = string.Format("المحترم / ساكن الشقة رقم ({0}) برج رقم                 ({1}) المحترم", ap.ID, tw.ID);
                string footer = string.Format("صورة مع التحية شقة رقم ({0})", cm.OtherApartment);
                DocX document = DocX.Load(Server.MapPath("/Template.docx"));
                Paragraph p0 = document.InsertParagraph();
                p0.Direction = Novacode.Direction.RightToLeft;
                p0.Append(string.Format("التاريخ {0}", string.Format("{0:d/M/yyyy}", DateTime.Now)));
                p0.Bold();
                Paragraph p1 = document.InsertParagraph();
                p1.Direction = Novacode.Direction.RightToLeft;
                p1.Append(subject);
                p1.Bold();
                Paragraph p2 = document.InsertParagraph();
                p2.Direction = Novacode.Direction.RightToLeft;
                p2.Append("السلام عليكم ورحمة الله وبركاتة");
                p2.Bold();
                Paragraph p3 = document.InsertParagraph();
                p3.Direction = Novacode.Direction.RightToLeft;
                p3.Append(body);

                Paragraph p4 = document.InsertParagraph();
                p4.Direction = Novacode.Direction.RightToLeft;
                p4.Append("شاكرين حسن تعاونكم");
                p4.Alignment = Alignment.center;
                p4.Bold();
                p4.SpacingAfter(20);
                Paragraph p5 = document.InsertParagraph();
                p5.Append("ادارة مجمع اسكان المعذر");
                p5.Alignment = Alignment.left;
                p5.Direction = Novacode.Direction.RightToLeft;
                p5.Bold();
                Paragraph p6 = document.InsertParagraph();
                p6.Direction = Novacode.Direction.RightToLeft;
                p6.Append(footer);
                document.SaveAs(Server.MapPath("/Docs/" + cm.flat.Trim() + "." + Convert.ToDateTime(cm.CreateDateTime).ToString("yyyyyMMdd") + ".docx"));
                Context.Response.Clear();
                FileInfo file = new FileInfo(Server.MapPath("/Docs/" + cm.flat.Trim() + "." + Convert.ToDateTime(cm.CreateDateTime).ToString("yyyyyMMdd") + ".docx"));
                Context.Response.ContentType = "Application/msword";
                Context.Response.AppendHeader("Content-Disposition", "inline; filename=" + file.Name);
                Context.Response.AppendHeader("Content-Length", file.Length.ToString());
                Context.Response.WriteFile(file.FullName);
                Context.Response.End();
            }

        }
        private void FillCommonItems(string name)
        {
            using (Entities1 db = new Entities1())
            {
                CommonType ty = db.CommonTypes.Where(x => x.Name == name).FirstOrDefault();
                drplvl3.DataSource = db.usp_CommonItemsSelectByType(ty.ID).ToList();
                drplvl3.ValueField = "ID";
                drplvl3.TextField = "Name";
                DataBind();
            }
        }
        private void FillApartments(string name, string tower)
        {
            using (Entities1 db = new Entities1())
            {
                Tower tw = db.Towers.Where(x => x.Name == tower).FirstOrDefault();
                Apartment ap = db.Apartments.Where(x => x.Name == name && x.TowerID == tw.ID).FirstOrDefault();

                drpapartmentnumber.DataSource = db.usp_ApartmentsSelectByTower(tw.ID).ToList();
                drpapartmentnumber.ValueField = "ID";
                drpapartmentnumber.TextField = "Name";
                DataBind();
            }
        }
        private void FillCommonTypes(string name)
        {
            using (Entities1 db = new Entities1())
            {
                Catogery cat = db.Catogeries.Where(x => x.Name == name).FirstOrDefault();
                drplvl2.DataSource = db.usp_CommonTypesSelectByCatogeryByCatogery(cat.ID).ToList();
                drplvl2.ValueField = "ID";
                drplvl2.TextField = "Name";
                DataBind();
            }
        }
        private void FillComplaintData(int Id)
        {
            using (Entities1 db = new Entities1())
            {
                Vw_Complaints cm = db.Vw_Complaints.Where(x => x.ID == Id).FirstOrDefault();
                FillApartments(cm.flat, cm.Name);
                FillCommonItems(cm.type);
                FillCommonTypes(cm.cat);
                txtSearch.Text = cm.Id_Numer;
                txtphone.Text = cm.Phone;
                txtcustomername.Text = cm.FullName;
                drpownertype.Text = cm.type;
                drptechniction.Text = cm.TechName;
                btnclear.NavigateUrl = "initialLetter.aspx?Id=" + cm.ID;
                btnprint.NavigateUrl = "PrintWO.aspx?Id=" + cm.ID;
                drpapartmentnumber.Text = cm.flat;
                drptower.Text = cm.Name;
                drplvl1.Text = cm.cat;
                drplvl2.Text = cm.type;
                drplvl3.Text = cm.Item;
                txtID.Text = "926/" + cm.ID.ToString("0000000");
                txtCreationDate.Text = cm.CreateDateTime.ToString();
                drpotheap.Text = cm.OtherApartment;
                if (!string.IsNullOrEmpty(cm.Other))
                {
                    txtother.ClientVisible = true; lblothertxt.ClientVisible = true;
                }
                else
                {
                    txtother.ClientVisible = false; lblothertxt.ClientVisible = false; ;
                }
                if (cm.Status == 2)
                {
                    btnsumnit.Visible = false;
                    btnedit.Visible = false;
                    btnclose.Visible = false;
                }
                else if (cm.Status == 3)
                {
                    btnsumnit.Visible = false;
                    btnedit.Visible = false;
                    btnclose.Visible = false;
                }
                txtfixdatetime.Text = cm.AppointmentDateTime.ToString();
                memonotes.Text = cm.Note;
                txtsubject.Text = cm.Subject;
                drpownertype.SelectedValue = cm.Customer_Type.ToString();
                if (!string.IsNullOrEmpty(cm.Other))
                {
                    txtother.ClientVisible = true;
                    lblothertxt.ClientVisible = true;
                    txtother.Text = cm.Other;
                }
                else
                {
                    txtother.ClientVisible = false;
                    lblothertxt.ClientVisible = false;
                }
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
                drptechniction.DataSource = db.usp_techniciansSelect(null).ToList();
                drptechniction.TextField = "Name";
                drptechniction.ValueField = "ID";
                ASPxListBox listBox = drpotheap.FindControl("listBox") as ASPxListBox;
                listBox.DataSource = db.usp_ApartmentsSelectByTower(1);
                listBox.TextField = "Name";
                listBox.ValueField = "APID";
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
                using (Entities1 db = new Entities1())
                {
                    int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                    string userId = User.Identity.GetUserId().ToString();
                    db.usp_ComplaintsUpdateProcedure(
                            id,
                            Convert.ToInt32(drpapartmentnumber.Value),
                            Convert.ToInt32(drplvl1.Value),
                            Convert.ToInt32(drplvl2.Value),
                            Convert.ToInt32(drplvl3.SelectedItem.Value),
                            Convert.ToDateTime(txtfixdatetime.Text),
                            DateTime.Now,
                            null,
                            (int)ComplaintStatusEnum.Investigation,
                            null,
                            drptechniction.Text,
                            userId,
                            memonotes.Text,
                            txtsubject.Text
                            , txtSearch.Text
                            , txtphone.Text
                            , txtcustomername.Text
                            , Convert.ToInt32(drpownertype.SelectedItem.Value)
                            , txtother.Text
                            , drpotheap.Text
                        );
                    resultmessage.Attributes["class"] = "alert-success";
                    lbltxtresult.Text = "تم تحويل البلاغ الي عمليات ما بعد الكشف";
                    btnedit.Visible = false;
                    btnclose.Visible = false;
                    DataBind();
                }
            }
            catch (Exception exception)
            {
                Log.Error(exception.StackTrace);
            }
        }
        protected void btnedit_Click(object sender, EventArgs e)
        {

            using (Entities1 db = new Entities1())
            {
                int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                string userId = User.Identity.GetUserId();
                db.usp_ComplaintsUpdateProcedure(
                        id,
                        Convert.ToInt32(drpapartmentnumber.Value),
                        Convert.ToInt32(drplvl1.Value),
                        Convert.ToInt32(drplvl2.Value),
                        Convert.ToInt32(drplvl3.SelectedItem.Value),
                        Convert.ToDateTime(txtfixdatetime.Text),
                        DateTime.Now,
                        null,
                        1,
                        null,
                        drptechniction.Text,
                        userId,
                        memonotes.Text,
                        txtsubject.Text
                        , txtSearch.Text
                        , txtphone.Text
                        , txtcustomername.Text
                        , Convert.ToInt32(drpownertype.SelectedItem.Value)
                        , txtother.Text
                        , drpotheap.Text
                    );
                resultmessage.Attributes["class"] = "alert-success";
                lbltxtresult.Text = "تم تعديل البلاغ بنجاح";
                DataBind();
            }
        }
        protected void btnclose_Click(object sender, EventArgs e)
        {

            using (Entities1 db = new Entities1())
            {
                int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                string userId = User.Identity.GetUserId();
                db.usp_ComplaintsUpdateProcedure(
                        id,
                        Convert.ToInt32(drpapartmentnumber.Value),
                        Convert.ToInt32(drplvl1.Value),
                        Convert.ToInt32(drplvl2.Value),
                        Convert.ToInt32(drplvl3.SelectedItem.Value),
                        Convert.ToDateTime(txtfixdatetime.Text),
                        DateTime.Now,
                        null,
                        3,
                        null,
                        drptechniction.Text,
                        userId,
                        memonotes.Text,
                        txtsubject.Text
                        , txtSearch.Text
                        , txtphone.Text
                        , txtcustomername.Text
                        , Convert.ToInt32(drpownertype.SelectedItem.Value)
                        , txtother.Text
                        , drpotheap.Text
                    );
                resultmessage.Attributes["class"] = "alert-success";
                lbltxtresult.Text = "تم اقفال البلاغ بنجاح";
                btnedit.Visible = false;
                btnsumnit.Visible = false;
                DataBind();
            }
        }
        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

            if (e.Parameter == "lvl1")
            {
                FillCommonTypes(Convert.ToInt32(drplvl1.Value));
            }

        }

        protected void drplvl2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCommonTypes(Convert.ToInt32(e.Parameter));
        }

        protected void drplvl3_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillCommonItems(Convert.ToInt32(e.Parameter));
        }

        protected void drpapartmentnumber_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            FillApartments(Convert.ToInt32(e.Parameter));
        }


        private void DisableEnableControls(bool flag)
        {
            drpapartmentnumber.Enabled = flag;
            drptower.Enabled = flag;
            drplvl1.Enabled = flag;
            drplvl2.Enabled = flag;
            drplvl3.Enabled = flag;
            txtfixdatetime.Enabled = flag;
            //drppaint.Enabled = flag;
            memonotes.Enabled = flag;
            txtsubject.Enabled = flag;
        }
        private void Clear()
        {
            txtSearch.Text = "";
            txtphone.Text = "";
            txtcustomername.Text = "";
            //drpgender.SelectedIndex = -1;
            drpownertype.SelectedIndex = -1;
            drpapartmentnumber.Text = "";
            drptower.SelectedIndex = -1;
            drplvl1.SelectedIndex = -1;
            drplvl2.SelectedIndex = -1;
            drplvl3.SelectedIndex = -1;
            txtfixdatetime.Text = "";
            //drppaint.SelectedIndex = -1;
            memonotes.Text = "";
            txtsubject.Text = "";
        }


        protected void ASPxButton4_Click(object sender, EventArgs e)
        {
            CreateSampleDocument2(Convert.ToInt32(Request.QueryString["Id"].ToString()));
        }


    }
}

