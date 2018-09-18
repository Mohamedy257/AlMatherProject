﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MZ.ComplaintsSystems.Search" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="wrapper">





        <div class="row-title">

            <div class="col-lg-12">
                <h1 class="page-header fa fa-search fa-2x">البحث عن بلاغ </h1>

                <div id="resultmessage" runat="server" style="font: message-box">
                    <asp:Label ID="lbltxtresult" runat="server"></asp:Label>

                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <span class="fa fa-user"></span>
                        البحث عن بلاغ
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>رقم البرج</label>
                                    <dx:ASPxComboBox ID="drptower" RightToLeft="True" Width="100%" ClientInstanceName="drptower" NullText="الرجاء الاختيار" required="true" runat="server" CssClass="form-control">

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


                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>رقم الشقة</label>
                                    <dx:ASPxComboBox ID="drpapartmentnumber" RightToLeft="True" Width="100%" NullText="الرجاء الاختيار" ClientInstanceName="drpapartmentnumber" runat="server" CssClass="form-control" OnCallback="drpapartmentnumber_Callback1">
                                        <Items>
                                            <dx:ListEditItem Text="الرجاء الاختيار" Value="-1" ImageUrl="" />
                                        </Items>
                                        <ValidationSettings ErrorDisplayMode="None" SetFocusOnError="True">
                                            <RequiredField ErrorText="" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>

                                </div>


                            </div>
                            <div class="col-lg-12">
                                <asp:Button ID="btnsrch" runat="server" CssClass="btn btn-info" Text="بحث" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">


            <div class="col-lg-12">
                <div class="panel panel-info">

                    <div class="panel-heading">
                        <span class="fa fa-search"></span>
                        نتيجة البحث
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <dx:ASPxGridView ID="ASPxGridView1" Width="100%" RightToLeft="True" runat="server" EnableTheming="True" Theme="Office2010Blue" AutoGenerateColumns="False">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="FullName" CellStyle-CssClass="row" VisibleIndex="2">
                                        <CellStyle CssClass="row"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="البرج" FieldName="Name" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="الشقة" FieldName="flat" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="البلاغ" FieldName="Item" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="تاريخ البلاغ" FieldName="CreateDateTime" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="تاريخ الاصلاح" FieldName="AppointmentDateTime" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="حالة البلاغ" FieldName="StatusName" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn VisibleIndex="0" Caption="#">
                                        <DataItemTemplate>
                                            <a href='<%#"/Editcomplaints.aspx?Id="+Eval("ID").ToString()%>'>تحديد</a>
                                            <a href='<%#"/PrintWO.aspx?Id="+Eval("Id").ToString()%>'>طباعة</a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="رقم البلاغ" FieldName="ID" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="926/{0:0000000}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
