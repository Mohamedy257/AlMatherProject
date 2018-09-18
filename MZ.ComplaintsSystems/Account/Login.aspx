<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Auth.Master" CodeBehind="Login.aspx.cs" Inherits="MZ.ComplaintsSystems.Account.Login" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div class="container">
    <div class="row">
         <img src="../Content/Images/logo.jpg" style="width:160px;height:120px;margin:auto;display:block"/>
        <div class="col-md-4 col-md-offset-4">
           <div class="login-panel panel panel-default">
                <div class="panel-heading">
                        <h3 class="panel-title">تسجيل الدخول</h3>
                    </div>
                     <div class="panel-body">
                    <fieldset>
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">اسم المستخدم</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="الرجاء ادخال اسم المستخدم" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">كلمة المرور</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="الرجاء ادخال كلمة المرور" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="تسجيل الدخول" CssClass="btn btn-lg btn-success btn-block" />
                        </div>
                    </div>
                        </fieldset>
                         </div>
                </div>
               
            </div>
        </div>

        
    </div>
       
</asp:Content>
