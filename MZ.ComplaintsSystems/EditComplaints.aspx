﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditComplaints.aspx.cs" Inherits="MZ.ComplaintsSystems.EditComplaints" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <script src="Scripts/moment.min.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.min.js"></script>
    <link href="Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="Scripts/moment-with-locales.min.js"></script>
    <script src="Scripts/moment-with-locales.js"></script>
  <!-- include your less or built css files  -->
  <!-- 
  bootstrap-datetimepicker-build.less will pull in "../bootstrap/variables.less" and "bootstrap-datetimepicker.less";
  or
  <link rel="stylesheet" href="/Content/bootstrap-datetimepicker.css" />
  -->

    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>
    <script src="Scripts/ar_MA.js"></script>
           <script>
               $(document).ready(function () {
                   $('#contactForm').bootstrapValidator({

                       fields: {

                           ctl00$MainContent$txtSearch: {
                               validators: {

                                   notEmpty: {
                                       message: ' '
                                   }
                               }
                           }
                       }
                   });
               });
               $(function () {
                   $('#datetimepicker1').datetimepicker();
                   locale: 'ar'
               });



    </script>
     <script type="text/javascript">
         var textSeparator = ",";
         function OnListBoxSelectionChanged(listBox, args) {
             //if(args.index == 0)
               //  args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
             //UpdateSelectAllItemState();
             UpdateText();
         }
         function UpdateSelectAllItemState() {
             IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
         }
         function IsAllSelected() {
             var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
             return checkListBox.GetSelectedItems().length == selectedDataItemCount;
         }
         function UpdateText() {
             var selectedItems = checkListBox.GetSelectedItems();
             checkComboBox.SetText(GetSelectedItemsText(selectedItems));
         }
         function SynchronizeListBoxValues(dropDown, args) {
             checkListBox.UnselectAll();
             var texts = dropDown.GetValue().split(textSeparator);
             var values = GetValuesByTexts(texts);
             checkListBox.SelectValues(values);
             UpdateSelectAllItemState();
             UpdateText(); // for remove non-existing texts
         }
         function GetSelectedItemsText(items) {
             var texts = [];
             for(var i = 0; i < items.length; i++)
                
                     texts.push(items[i].value);
             return texts.join(textSeparator);
         }
         function GetValuesByTexts(texts) {
             var actualValues = [];
             var item;
             for(var i = 0; i < texts.length; i++) {
                 item = checkListBox.FindItemByValue(texts[i]);
                 if(item != null)
                     actualValues.push(item.value);
             }
             return actualValues;
         }
         </script>

         
      

           
            <div class="row-title">
                
                 <div class="col-lg-12">
                    <h1 class="page-header fa fa-folder fa-2x"> استعراض البلاغات في مرحلة الكشف </h1>
                    
                      <div id="resultmessage" runat="server" style="font:message-box">
                    <asp:Label ID="lbltxtresult" runat="server"></asp:Label>
                         
                </div>
                     
                </div>
                </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">
                            <span class="fa fa-user"></span>
                           معلومات العميل
                        </div>
                        <div class="panel-body">
                             
                            <div class="row">
                                <div class="col-lg-6">
                                    
                                        <label>رقم الهوية او الاقامة</label>
                                    
                                        <div class="form-group">
                                            
                                            <asp:TextBox ID="txtSearch"  ClientIDMode="Static"  placeholder="2399008884" runat="server" Class="form-control"  ></asp:TextBox>
                                            
                                                                                 
                              

                                        </div>
                                        <div class="form-group">
                                                
                                            <label>رقم الجوال</label>
                                            
                                            <asp:TextBox id="txtphone"  ClientIDMode="Static" placeholder="05xxxxxxxx" runat="server" cssClass="form-control" required="true"></asp:TextBox>
                                            
                                                     
                                        </div>
                                            
                                         
                                   
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    
                                  
    
                                             <div class="form-group">
                                                
                                            <label>اسم العميل</label>
                                            <asp:TextBox runat="server"  placeholder="محمد بن يوسف" CssClass="form-control" ID="txtcustomername" required="true"></asp:TextBox>
                                            
                                                     
                                        </div>
                                            <div class="form-group">
                                                <label>النوع</label>
                                                  <asp:DropDownList ID="drpownertype"  runat="server" CssClass="form-control" required="true" initialvalue="الرجاء الاختيار">
                                                     <asp:ListItem Text="الرجاء الاختيار" Value="-1" > </asp:ListItem>
                                                      <asp:ListItem Text="مالك" Value="1"> </asp:ListItem>
                                                    <asp:ListItem Text="مستاجر" Value="2" > </asp:ListItem>    
                                                </asp:DropDownList>
                                            </div>
                                        
                                
                                  
                                    
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                                 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                      
                </div>
           
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="fa fa-support"></span>
                            معلومات البلاغ
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                 <div class="col-lg-12">
                                <div class="col-lg-4">
                                  
                                        <div class="form-group">
                                            <label>رقم البرج</label>
                                            <dx:ASPxComboBox ID="drptower" Width="100%" RightToLeft="True" ClientInstanceName="drptower" NullText="الرجاء الاختيار" required="true" runat="server" CssClass="form-control">
                                                
                                                 <ClientSideEvents ValueChanged="function(s, e) {
	drpapartmentnumber.PerformCallback(drptower.GetValue());
}" />
                                                
                                                 <Items>
                                                     <dx:ListEditItem />
                                                 </Items>
                                                   <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                                 <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                                   
                                                </dx:ASPxComboBox>
                                           
                                        </div>
                                        <div class="form-group">
                                            <label>تصنيف البلاغ الرئيسي</label>
                                           <dx:ASPxComboBox ID="drplvl1" RightToLeft="True"
                                                ClientInstanceName="drplvl1" Width="100%" NullText="الرجاء الاختيار" runat="server" CssClass="form-control"  >
                                               <ClientSideEvents ValueChanged="function(s, e) {
     
	drplvl2.PerformCallback(drplvl1.GetValue());
}" EndCallback="function(s, e) {return;}"/>
                                               <Items>
                                                   <dx:ListEditItem Text="الرجاء الاختيار" Value="-1"/>
                                                  
                                               </Items>
                                               <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                               <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="form-group">
                                            <label>تصنيف البلاغ الدقيق</label>
                                            <dx:ASPxComboBox ID="drplvl3" Width="100%" NullText="الرجاء الاختيار" RightToLeft="True" ClientInstanceName="drplvl3" runat="server" CssClass="form-control" OnCallback="drplvl3_Callback" >
                                               
                                                <ClientSideEvents ValueChanged="function(s, e) {
                                                   
 var txt=drplvl3.GetText();
	if (txt=='اخري')
                             {                       
		txtother.SetVisible(true);
        lblothertxt.SetVisible(true);
                                                    }
                                                    else
                                                     {                       
		txtother.SetVisible(false);
        lblothertxt.SetVisible(false);
                                                    }
}" />
                                               
                                                <Items>
                                                   <dx:ListEditItem Text="الرجاء الاختيار" Value="-1"/>
                                                  
                                               </Items>
                                                <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                                <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                            </dx:ASPxComboBox>
                                           
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>موضوع البلاغ</label>
                                            <asp:TextBox ID="txtsubject" CssClass="form-control" placeholder="تسريبات شقة" runat="server" required="true"></asp:TextBox>
                                        </div>
                                        
                                        
                                       
                                   
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-4">
                                    
                                  
                                       
                                            <div class="form-group">
                                                <label>رقم الشقة</label>
                                                 <dx:ASPxComboBox ID="drpapartmentnumber" RightToLeft="True" Width="100%" NullText="الرجاء الاختيار" ClientInstanceName="drpapartmentnumber" runat="server" CssClass="form-control" OnCallback="drpapartmentnumber_Callback"> 
                                                <Items>
                                                    <dx:ListEditItem Text="الرجاء الاختيار" Value="-1"/>
                                                </Items>
                                                     <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                                     <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                                 </dx:ASPxComboBox>

                                            </div>
                                            <div class="form-group">
                                                <label>تصنيف البلاغ الفرعي</label>
                                                 <dx:ASPxComboBox ID="drplvl2" RightToLeft="True"  Width="100%" NullText="الرجاء الاختيار" ClientInstanceName="drplvl2" runat="server" CssClass="form-control" OnCallback="drplvl2_Callback" >
                                               <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                drplvl3.PerformCallback(drplvl2.GetValue());
                                                }" />
                                               <Items>
                                                   <dx:ListEditItem Text="الرجاء الاختيار" Value="-1"/>
                                                  
                                               </Items>
                                                     <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                               <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                            </dx:ASPxComboBox>
                                                    
                                            </div>
                                         <div class="form-group">
                                            <dx:ASPxLabel runat="server" ID="lblothertxt" ClientInstanceName="lblothertxt" ClientVisible="false" Font-Bold="true" Text="وضح"></dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtother" ClientVisible="false" ClientInstanceName="txtother" runat="server"  CssClass="form-control" required="true"></dx:ASPxTextBox>
                                            
                                        </div>
                                             <div class="form-group">
                                                
                                            <label>وقت الزيارة</label>
                                                 <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <asp:TextBox runat="server" Id="txtfixdatetime" class="form-control" required="true"> </asp:TextBox>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                                          </div>
                                                 <div class="form-group">
                                                <label>اسم العامل</label>
                                                 <dx:ASPxComboBox ID="drptechniction" RightToLeft="True"  Width="100%" NullText="الرجاء الاختيار"  runat="server" CssClass="form-control"  >
                                               
                                               
                                                     <ButtonTemplate>
                                                         <span><i class="fa fa-arrow-circle-down"></i></span>
                                                     </ButtonTemplate>
                                               <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                                     <RequiredField ErrorText="" IsRequired="True" />
                                                 </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            </div>
                                                 </div>
                                            
                                                     
                                        
                                        
                                   
                                  
                                    
                             
                                <!-- /.col-lg-6 (nested) -->

                            </div>
                                <div class="col-lg-4">
                                     <div class="form-group">
                                                <label>رقم الشقة مصدر المشكلة</label>
                                                 <dx:ASPxDropDownEdit  CssClass="form-control" RightToLeft="True" ClientInstanceName="checkComboBox" ID="drpotheap" Width="100%" runat="server" AnimationType="None">
        <DropDownWindowStyle BackColor="#EDEDED" />
        <DropDownWindowTemplate>
            <dx:ASPxListBox Width="100%" RightToLeft="True" ID="listBox"  ClientInstanceName="checkListBox" SelectionMode="CheckColumn"
                runat="server">
                <Border BorderStyle="None" />
                <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                <Items>
                    <dx:ListEditItem Text="(Select all)" />
                   
                </Items>
                <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
            </dx:ASPxListBox>
            <table style="width: 100%" dir="rtl">
                <tr>
                    <td style="padding: 4px">
                        <dx:ASPxButton ID="ASPxButton1" RightToLeft="True" AutoPostBack="False" runat="server" Text="اغلاق" style="float: right">
                            <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </DropDownWindowTemplate>
        <ClientSideEvents TextChanged="SynchronizeListBoxValues" DropDown="SynchronizeListBoxValues" />
                                                    
    </dx:ASPxDropDownEdit>
                                            </div>
                        
                                    
                                    
                          </div>
                                     </div>
                            <!-- /.row (nested) -->
                        </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                            <label>ملاحظات</label>
                                            <asp:TextBox ID="memonotes" runat="server" Rows="3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                
                                  
                                     <center>
                                            
                                          <dx:ASPxButton ID="btnsumnit"   runat="server"    CssClass="btn btn-success" Text="تم الكشف" OnClick="btnsbmit_Click">
                                               <ClientSideEvents Click="function(s, e) {
	var result=confirm('انت علي وشك تحويل البلاغ الي ما بعد الكشف هل انت متاكد ؟');
if (result==false)
                                                 e.processOnServer = false;
return false;
}" />
                                          </dx:ASPxButton>
                                          <dx:ASPxButton ID="btnedit"   runat="server" CausesValidation="true"  CssClass="btn btn-info" Text="تعديل بيانات البلاغ" OnClick="btnedit_Click"></dx:ASPxButton>
                                         <dx:ASPxButton ID="btnclose"   runat="server"  CausesValidation="true"  CssClass="btn btn-danger" Text="اقفال البلاغ" OnClick="btnclose_Click">
                                             <ClientSideEvents Click="function(s, e) {
	var result=confirm('انت علي وشك اقفال البلاغ نهائيا هل انت متاكد ؟');
if (result==false)
                                                 e.processOnServer = false;
return false;
}" />
                                          </dx:ASPxButton>
                                         <dx:ASPxHyperLink ID="btnclear" ClientInstanceName="btnprint" CausesValidation="false" Target="_blank" Height="40px" runat="server"  CssClass="btn btn-warning" Text="خطاب فتح الباب">
                                             <ClientSideEvents Click="function(s, e) {
	if (checkComboBox.GetText()==&quot;&quot;){
		alert('الرجاء تحديد رقم الشقة المتسببة في المشكلة');
                                                 ASPxClientUtils.PreventEvent(e.htmlEvent);
                                                 }
}" />
                                          </dx:ASPxHyperLink>
                                       <dx:ASPxHyperLink ID="btnprint" Target="_blank" CausesValidation="false" Height="40px" runat="server"  CssClass="btn btn-default" Text="طباعة البلاغ"></dx:ASPxHyperLink>
                                        
                                    </center>
                                     
                            </div>
                        <!-- /.panel-body -->
                        
                    </div>
                    <!-- /.panel -->
                    
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
       
        <!-- /#page-wrapper -->
       
        
        </div>
            
       
    
</asp:Content>
