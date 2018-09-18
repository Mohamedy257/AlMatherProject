<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="TechnictionEvaluation.aspx.cs" Inherits="MZ.ComplaintsSystems.TechnictionEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        img {
            width:auto !important;
            height:30px !important;
        }
    </style>
    <div id="divEvaluation" style="display:block">
        <div class="col-lg-12 alert alert-info" dir="rtl">
            <br />
           <span class="fa fa-info-circle"></span>
            <b>من اجل خدمة افضل الرجاء تقييم مستوي الخدمة المقدمة وكتابة الملاحظات ان وجدت</b>
        </div>
        <div class="col-md-12" dir="rtl" style="margin-bottom:30px">
             <label class="control-label">تقيم الفني</label>
           <div id="star" class="" dir="rtl" style="margin-right:10%"></div>
        </div>
        <div class="col-md-12" dir="rtl">
            <label class="col-lg-12 control-label">الملاحظات</label>
            <textarea class="form-control" cols="40" runat="server" rows="3"></textarea>
        </div>
        <br />
        <div class="col-md-12" style="margin:auto;display:block">
            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" Text="حفظ" OnClick="btnsave_Click" />
        </div>
    </div>
    <div id="divThanksful" style="display: none">
        <div class="col-lg-12 alert alert-success" dir="rtl">
            <b>شكرا علي تقيم الخدمة ,طاب يومك.</b>
        </div>
        <div class="col-lg-12" dir="rtl">
            <img src="/Content/Images/emotion.jpg" style="margin:auto;display:block;width:auto;height:auto" />
        </div>
    </div>
    <script type="text/javascript">
        $('#star').raty();
        $("#btnsave").click(function () {
                $("#divThanksful").css('display', '');
                $("#divEvaluation").css('display', 'none');
                return false;
            });
    </script>
</asp:Content>

