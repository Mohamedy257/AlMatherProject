<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="MZ.ComplaintsSystems.Report" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
                      
                 <div class="row-title">
                <div class="col-lg-12">
                    <strong><h1 class="page-header fa fa-paperclip fa-2x"> التقارير  </h1></strong>
               
                </div>
                     <div class="row" style="background-color:transparent">
                         <div class="col-lg-2">
                           <div class="panel panel-success" style="background-position: center center; width:200px; height:150px; text-align:center; margin-right:30px;border:thick solid #C0C0C0;">
                             <span class="fa fa-file-excel-o fa-5x" style="margin-top:20px">
                                 
                             </span>
                             <div><a href="/reportviewer.aspx?ReportId=1">تقرير الابراج</a></div>
                         </div>
                             </div>
                         <div class="col-lg-2">
                          <div class="panel panel-success" style="background-position: center center; width:200px; height:150px; text-align:center; margin-right:30px;border:thick solid #C0C0C0;">
                             <span class="fa fa-file-excel-o fa-5x" style="margin-top:20px">
                                 
                             </span>
                             <div><a href="ReportViewer.aspx?ReportId=3">تقرير الشقق</a></div>
                         </div>
                             </div>
                        <div class="col-lg-2">
                          <div class="panel panel-success" style="background-position: center center; width:200px; height:150px; text-align:center; margin-right:30px;border:thick solid #C0C0C0;">
                             <span class="fa fa-file-excel-o fa-5x" style="margin-top:20px">
                                 
                             </span>
                             <div><a href="/reportviewer.aspx?ReportId=2">تقرير الصيانة الدورية</a></div>
                         </div>
                             </div>
                         <div class="col-lg-2">
                          <div class="panel panel-success" style="background-position: center center; width:200px; height:150px; text-align:center; margin-right:30px;border:thick solid #C0C0C0;">
                             <span class="fa fa-bar-chart fa-5x" style="margin-top:20px">
                                 
                             </span>
                             <div><a>اللوحة</a></div>
                         </div>
                             </div>

                             
                     </div>
                <!-- /.col-lg-12 -->
            </div>
        

    </div>
    </asp:Content>
