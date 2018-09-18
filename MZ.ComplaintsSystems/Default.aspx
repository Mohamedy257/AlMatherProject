<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MZ.ComplaintsSystems._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView ID="LoginView1" runat="server">
          <AnonymousTemplate>
                <p> You are unothorized to view this page</p>
            </AnonymousTemplate>
            <LoggedInTemplate>
                  
               
            </LoggedInTemplate>
        
       <RoleGroups >
           <asp:RoleGroup Roles="Operator">
               <ContentTemplate>
                              
                      
       
            <div class="row-title">
                <div class="col-lg-12">
                    <h1 class="page-header fa fa-home fa-2x" style="background-color:white"> الصفحة الرئيسية </h1>
               
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-ticket fa-3x"></i>
                                </div>
                                <div class="col-xs-7 text-right">
                                    
                                    <div><strong>بلاغ جديد</strong></div>
                                </div>
                            </div>
                        </div>
         
                        <a href="/Complaints">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>الكشف المبدئي</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/search.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                 <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-square fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>عمليات ما بعد الكشف</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/search2.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cogs fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>الصيانة الدورية</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/RegularMaintenance.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
                
              
                
            </div>
            <!-- /.row -->
           
                   </ContentTemplate>
               
           </asp:RoleGroup>
           <asp:RoleGroup Roles="Manager">
               <ContentTemplate>
                              
             
            <div class="row-title">
                <div class="col-lg-12">
                    <h1 class="page-header fa fa-home fa-2x"> الصفحة الرئيسية </h1>
               
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bar-chart fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong>التقارير</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/report.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
                
                
                
              
               
           
</div>
                   </ContentTemplate>
               
           </asp:RoleGroup>
           <asp:RoleGroup Roles="Admin">
                        <ContentTemplate>
                            
                      
                  <div class="row-title">
                <div class="col-lg-12">
                    <h1 class="page-header fa fa-home fa-2x" style="background-color:white"> الصفحة الرئيسية </h1>
               
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-ticket fa-3x"></i>
                                </div>
                                <div class="col-xs-7 text-right">
                                    
                                    <div><strong>بلاغ جديد</strong></div>
                                </div>
                            </div>
                        </div>
         
                        <a href="/Complaints">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-circle fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>الكشف المبدئي</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/search.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info2">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-check-square fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>عمليات ما بعد الكشف</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/search2.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cogs fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>الصيانة الدورية</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/RegularMaintenance.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
                
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bar-chart fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>التقارير</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/report.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    
                                    <div><strong>المستخدمين</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="/Register.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">عرض</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
           
           

    
</div></div>
                              </ContentTemplate>
                   </asp:RoleGroup>
       </RoleGroups>
    </asp:LoginView>
</asp:Content>
