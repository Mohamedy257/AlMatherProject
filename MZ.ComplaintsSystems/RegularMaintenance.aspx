<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegularMaintenance.aspx.cs" Inherits="MZ.ComplaintsSystems.RegularMaintenance" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

            <div class="row-title">
                <div class="col-lg-12" >
                    <h1 class="page-header fa fa-wrench fa-2x" style="background-color:white"> الصيانة الدورية </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
         <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        <div class="row">
                         <div class="col-lg-8">
                     <div class="col-lg-2">
             <div class="form-horizontal">
             <dx:ASPxLabel runat="server" ID="lblothertxt" ClientInstanceName="lblothertxt"  Font-Bold="true"  Text=":تاريخ الصيانة"></dx:ASPxLabel>
             </div>
             </div>
                  <div class="col-lg-3">
             <div class="form-horizontal">
                      <dx:ASPxDateEdit ID="dtemaintenance" RightToLeft="True" NullText="يوم/شهر/سنة" CssClass="form-control" runat="server"></dx:ASPxDateEdit>
               
                   </div>
                  </div>
                             <div class="col-lg-1">
             <div class="form-horizontal">
             <dx:ASPxLabel runat="server" ID="ASPxLabel1" ClientInstanceName="lblothertxt"  Font-Bold="true" Text=":البرج"></dx:ASPxLabel>
             </div>
             </div>
                  <div class="col-lg-3">
             <div class="form-horizontal">
                        <dx:ASPxComboBox ID="drptower" RightToLeft="True" Width="100%" ClientInstanceName="drptower" NullText="الرجاء الاختيار" required="true" runat="server" CssClass="form-control">
                                                 <Items>
                                                     <dx:ListEditItem />
                                                 </Items>
                                                </dx:ASPxComboBox>
               
                   </div>
                  </div>
                   <div class="col-lg-2">
             <div class="form-horizontal">
                      <dx:ASPxButton ID="btncreatenewrequest" runat="server" Text="فتح بلاغ صيانة دورية" OnClick="Unnamed1_Click"></dx:ASPxButton>
                        
               
                   </div>
                  </div>
                             <div class="col-lg-1">
             <div class="form-horizontal">
                             <dx:ASPxButton ID="btnprint" runat="server" Text="طباعة" OnClick="Unnamed1_Click"></dx:ASPxButton>
                 </div>
                                 </div>
                  </div>
             </div>
         </div>
                           
                        <div class="panel-body">
         <div class="row">
               <div class="col-lg-12">
    <dx:ASPxGridView ID="grditems"  Width="100%" RightToLeft="True" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" KeyFieldName="ID;ItemId" OnBatchUpdate="grditems_BatchUpdate" >
       
        <Columns>
            <dx:GridViewDataSpinEditColumn Caption="العدد" FieldName="ItemCount" VisibleIndex="2" Width="30%">
                <PropertiesSpinEdit DisplayFormatString="g">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataTextColumn Caption="الصنف" FieldName="item" ReadOnly="true" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" VisibleIndex="3" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ItemId" FieldName="ItemId" VisibleIndex="4" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="MaintenenceDate" FieldName="MaintenenceDate" VisibleIndex="5" Visible="false">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings ShowStatusBar="Visible" />
        <SettingsCommandButton>
            <UpdateButton ButtonType="Button" Text="حفظ">
            </UpdateButton>
            <CancelButton ButtonType="Button" Text="الغاء">
            </CancelButton>
            <EditButton ButtonType="Button">
            </EditButton>
        </SettingsCommandButton>
    </dx:ASPxGridView>
                   </div>
             </div>
             
           </div>
           </div>
          </div>
</asp:Content>
