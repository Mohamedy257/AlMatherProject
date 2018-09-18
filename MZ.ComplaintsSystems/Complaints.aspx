﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" Async="true" ViewStateMode="Enabled" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Complaints.aspx.cs" Inherits="MZ.ComplaintsSystems.Complaints" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {
            var displayId = $("#MainContent_displayID").val();

            if (displayId == "true") {
                $("#divIDInfo").css('display', '');
                $("#divCreationDateInfo").css('display', '');
            }
            else {
                $("#divIDInfo").css('display', 'none');
                $("#divCreationDateInfo").css('display', 'none');
            }
        });
        $(function () {
            $('#datetimepicker1').datetimepicker({
                locale: moment.lang('en'),
                allowInputToggle: true
            });
            
        });
    </script>
    <div class="row-title">
        <div class="col-lg-12">
            <h1 class="page-header fa fa-ticket fa-2x" style="background-color: white">فتح بلاغ جديد </h1>

            <div id="resultmessage" runat="server" style="font: message-box;margin-bottom:5px">
                <br />
                <asp:Label ID="lbltxtresult" runat="server"></asp:Label>
            </div>
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
                        <div class="col-lg-6">
                            <div class="form-group" style="display: none" id="divIDInfo">
                                <label>رقم البلاغ</label>
                                <dx:ASPxTextBox runat="server" Width="100%" TabIndex="10" CssClass="form-control" ID="txtID" Enabled="false">
                                    <ValidationSettings ErrorDisplayMode="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            
                            <asp:HiddenField ID="displayID" runat="server" />
                            <div class="form-group">
                                <label>رقم البرج</label>
                                <dx:ASPxComboBox ID="drptower" TabIndex="1" RightToLeft="True" Width="100%" ClientInstanceName="drptower" NullText="الرجاء الاختيار" AutoPostBack="false" required="true" runat="server" CssClass="form-control">
                                    <ClientSideEvents ValueChanged="function(s, e) {
	                                    drpapartmentnumber.PerformCallback(drptower.GetValue());
                                    }" />
                                    <Items>
                                        <dx:ListEditItem />
                                    </Items>
                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </div>
                            <div class="form-group">
                                <label>تصنيف البلاغ الرئيسي</label>
                                <dx:ASPxComboBox ID="drplvl1"
                                    ClientInstanceName="drplvl1" TabIndex="3" RightToLeft="True" Width="100%" NullText="الرجاء الاختيار" runat="server" CssClass="form-control">
                                    <ClientSideEvents ValueChanged="function(s, e) {
     
	                                        drplvl2.PerformCallback(drplvl1.GetValue());
                                        }"
                                        EndCallback="function(s, e) {return;}" />

                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </div>
                            <div class="form-group">
                                <label>تصنيف البلاغ الدقيق</label>
                                <dx:ASPxComboBox ID="drplvl3" Width="100%" RightToLeft="True" TabIndex="5" NullText="الرجاء الاختيار" ClientInstanceName="drplvl3" runat="server" CssClass="form-control" OnCallback="drplvl3_Callback">
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
                                        <dx:ListEditItem Text="الرجاء الاختيار" Value="-1" />
                                    </Items>
                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>

                            </div>
                            <div class="form-group">
                                <label>موضوع البلاغ</label>
                                <dx:ASPxTextBox ID="txtsubject" TabIndex="7" Width="100%" CssClass="form-control" placeholder="تسريبات شقة" runat="server" required="true">
                                    <ValidationSettings ErrorDisplayMode="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                        <div class="col-lg-6">
                            <div class="form-group" style="display: none" id="divCreationDateInfo">
                                <label>تاريخ البلاغ</label>
                                <dx:ASPxTextBox runat="server" Width="100%" TabIndex="10" CssClass="form-control" ID="txtCreationDate" Enabled="false">
                                    <ValidationSettings ErrorDisplayMode="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            <div class="form-group">
                                <label>رقم الشقة \ المحل</label>
                                <dx:ASPxComboBox ID="drpapartmentnumber" Width="100%" TabIndex="2" RightToLeft="True" NullText="الرجاء الاختيار" ClientInstanceName="drpapartmentnumber" runat="server" CssClass="form-control" OnCallback="drpapartmentnumber_Callback">
                                    <Items>
                                        <dx:ListEditItem Text="الرجاء الاختيار" Value="-1" />
                                    </Items>
                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>

                            </div>
                            <div class="form-group">
                                <label>تصنيف البلاغ الفرعي</label>
                                <dx:ASPxComboBox ID="drplvl2" RightToLeft="True" TabIndex="4" Width="100%" NullText="الرجاء الاختيار" ClientInstanceName="drplvl2" runat="server" CssClass="form-control" OnCallback="drplvl2_Callback">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                drplvl3.PerformCallback(drplvl2.GetValue());
                                                }" />
                                    <Items>
                                        <dx:ListEditItem Text="الرجاء الاختيار" Value="-1" />

                                    </Items>
                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>

                            </div>
                            <div class="form-group">
                                <dx:ASPxLabel runat="server" ID="lblothertxt" ClientInstanceName="lblothertxt" ClientVisible="false" Font-Bold="true" Text="وضح"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtother" ClientVisible="false" ClientInstanceName="txtother" runat="server" CssClass="form-control" required="true">
                                    <ValidationSettings ErrorDisplayMode="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>

                            </div>
                            <div class="form-group">
                                <label>وقت الزيارة</label>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <asp:TextBox runat="server" TabIndex="6" ID="txtfixdatetime" class="form-control" required="true"> </asp:TextBox>
                                        <span class="input-group-addon">
                                            <span tabindex="6" class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>ملاحظات</label>
                                <asp:TextBox ID="memonotes" TabIndex="8" runat="server" Rows="3" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>
            <!-- /.row -->
            <!-- /#page-wrapper -->
        </div>
    </div>
    <div class="row" style="margin-bottom:10px">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="fa fa-user"></span>
                    معلومات العميل
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <label>رقم الهوية او الاقامة (اختياري)</label>
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch" ClientIDMode="Static" TabIndex="9" placeholder="2399008884" runat="server" Class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>رقم الجوال</label>
                                <dx:ASPxTextBox ID="txtphone" ClientIDMode="Static" TabIndex="11" Width="100%" placeholder="05xxxxxxxx" runat="server" CssClass="form-control" required="true" NullText="05xxxxxxxx">
                                    <MaskSettings ShowHints="True" />
                                    <ValidationSettings ErrorDisplayMode="None" CausesValidation="True" EnableCustomValidation="True">
                                        <RegularExpression ErrorText="رقم الجوال لابد ان يكون 10 ارقام" ValidationExpression="\d{10}" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>اسم العميل</label>
                                <dx:ASPxTextBox runat="server" placeholder="محمد بن يوسف" Width="100%" TabIndex="10" CssClass="form-control" ID="txtcustomername" required="true">
                                    <ValidationSettings ErrorDisplayMode="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            
                             <div class="form-group">
                                <label>رقم جوال اخر</label>
                                <dx:ASPxTextBox ID="ASPxTextBox1" placeholder="05xxxxxxxx" ClientIDMode="Static" TabIndex="11" Width="100%"  runat="server" CssClass="form-control" NullText="05xxxxxxxx">
                                <MaskSettings ShowHints="True" />
                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="True" EnableCustomValidation="True">
                                        <RegularExpression ErrorText="رقم الجوال لابد ان يكون 10 ارقام" ValidationExpression="\d{10}" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                          
                            <div class="form-group">
                                <label>النوع</label>
                                <dx:ASPxComboBox ID="drpownertype" TabIndex="13" RightToLeft="True" Width="100%" NullText="الرجاء الاختيار" runat="server" CssClass="form-control" OnCallback="drplvl2_Callback">

                                    <Items>
                                        <dx:ListEditItem Text="مالك" Value="1" />
                                        <dx:ListEditItem Text="مستاجر" Value="2" />

                                    </Items>
                                    <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                        <RequiredField ErrorText="" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>

                            </div>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
                    <div class="row" style="margin-right:5px">
                        <dx:ASPxButton ID="btnnew" CausesValidation="false" Visible="false" runat="server" CssClass="btn btn-success" Text="جديد" OnClick="btnnew_Click"></dx:ASPxButton>
                        <dx:ASPxButton ID="btnsumnit" runat="server" CssClass="btn btn-success" Text="حفظ" TabIndex="14" OnClick="btnsbmit_Click"></dx:ASPxButton>
                        <dx:ASPxButton ID="btnprint" CausesValidation="false" Visible="false" runat="server" CssClass="btn btn-success" Text="طباعة" OnClick="btnprint_Click"></dx:ASPxButton>

                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>

</asp:Content>
