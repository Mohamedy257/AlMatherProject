<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialLetter.aspx.cs" Inherits="MZ.ComplaintsSystems.InitialLetter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>

    <script src="/vendor/raphael/raphael.min.js"></script>
    <script src="/vendor/morrisjs/morris.min.js"></script>
    <script src="/data/morris-data.js"></script>
        <link href="Content/bootstrap-theme-rtl.min.css" rel="stylesheet" />
    <!-- Custom Theme JavaScript -->
        <link href="Content/bootstrap-theme-rtl.css" rel="stylesheet" />
        <link href="Content/bootstrap-rtl.min.css" rel="stylesheet" />
        <link href="Content/bootstrap-rtl.css" rel="stylesheet" />
    <script src="dist/js/sb-admin-2.js"></script>
    <style media="print">
 @page {
  @bottom-center {
      content: "Your footer text";
  }
 }
</style>
    <style type="text/css">
        header {
	display: table-header-group;
	position: relative;
    
	top: 0px;
}
      
        footer {
	--display: table-footer-group;
	position: inherit;
	bottom: 0px;
    margin-bottom:0px;
	page-break-after: always;
}

        .content-body {
	vertical-align: top;
}
        header img, footer img {
	width: 100%;
    height:25%
}
    </style>

</head>
<body dir="rtl" onload="window.print()">
     <form id="form1" runat="server">
      
    <div class="col-lg-12">
         <div class="row">
    <header class="header">
       <img  src="Content/Images/header.jpg"/>
    </header>
             </div>
    <div class="row">
      <p><strong>التاريخ:</strong><%=DateTime.Now.ToString("yyyy/MM/dd") %></p>
       <strong><span><p>المحترم / ساكن الشقة رقم
       (<asp:Label runat="server" ID="ApID"></asp:Label>)
           برج رقم
           (1) 
       </span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; المحترم</p>
        <p>السلام عليكم ورحمة الله</p>
        <p> 
            نشعركم بوجود تسرب مياة صادر من شقتكم علي جاركم شقة رقم (<asp:Label runat="server" ID="otherap"></asp:Label>) نامل اصلاح التسرب في اسرع وقت ممكن او الاتصال علي قسم الصيانة تلفون رقم (4620591)
             ليتمكن فني الصيانة من الكشف عن مصدر التسرب واصلاحة ووقف الضرر علي جاركم والحفاظ علي سلامة المبني. 
        </p>
    </div>
   <div><center>
       <strong><p>شاكرين حسن تعاونكم</p></strong>

        </center>
   </div>
    <div style="float:left">
       <p>ادارة مجمع اسكان المعذر</p>
   </div>
         <div style="margin-top:500px">
       <p>صورة مع التحية شقة رقم (<asp:Label runat="server" ID="other2"></asp:Label>)</p>
   </div>
         
            
            
                <center>    <footer class="footer">
         
        <p style="font-size:x-small">المملكة العربية السعودية - الرياض - هاتف  :4620503 - 4620516 فاكس :4622217
            </p>
        <p style="font-size:x-small">Kingdom of Saudi Arabia - Riyadh - Tel.:4620503 - 4620516 -Fax:4622217
        </p>
       
    </footer>
                    </center>

              
       
         </form>
</body>
</html>
