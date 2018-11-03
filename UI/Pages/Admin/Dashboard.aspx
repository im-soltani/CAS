<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="UI_Pages_Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <section class="content-header">
            <div class="col-lg-12" style="background-color: steelblue; height: 40px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; border-top-left-radius: 5px; border-top-right-radius: 5px">
                <a href="داشبورد.aspx" style="color: white">
                    <h4>پیشخوان
                /
                    <small style="color: white">همکارگرامی،مدیرخوش آمدید</small>
                    </h4>
                </a>
            </div>

            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red-gradient">
                        <div class="inner">
                            <h3>1</h3>
                            <p>جلسات کنسل شده</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-remove"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow-gradient">
                        <div class="inner">
                            <h3>3</h3>
                            <p>جلسات برگزارشده</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-check"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green-gradient">
                        <div class="inner">
                            <h3>4</h3>
                            <p>پیام های ارسالی</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-send"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6" >
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>5</h3>
                            <p>پیام های دریافتی</p>
                        </div>
                        <div class="icon" >
                            <i class="fa fa-reply"></i>
                        </div>

                    </div>
                </div>
                <!-- ./col -->
            </div>

        </section>

        <section class="content">
            <div class="row">

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_Teacher.aspx">
                        <div class="btn btn-default Admin_icon">
                            <img class="img_icon" src="../../img/Admin_01.jpg" />
                            <h5 style="padding-top: 15px">مدیریت اساتید</h5>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_Student.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_02.png"/>
                            <h5 style="padding-top: 15px">مدیریت دانشجویان</h5>
                       </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_Course.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_03.png" />
                            <h5 style="padding-top: 15px">مدیریت دروس ارائه شده</h5>
                        </div>
                    </a>
                </div>
            </div>
            <div class="row" style="padding-top: 10px">
                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_APChecking.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" />
                            <h5 style="padding-top: 15px">مدیریت حضور و غیاب</h5>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="ManageSendMassage.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" style=""/>
                            <h5 style="padding-top: 15px">مدیریت پیام</h5>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_HomeWork.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" style=""/>
                            <h5 style="padding-top: 15px">مدیریت تمرین</h5>
                        </div>
                    </a>
                </div>

                <!-- /.col -->
            </div>

            <div class="row" style="padding-top: 10px">
                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_Term.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" />
                            <h5 style="padding-top: 15px">مدیریت ترم</h5>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Manage_Session.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" style=""/>
                            <h5 style="padding-top: 15px">مدیریت جلسات</h5>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-1 col-xs-1 pull-right">
                    <a href="Setting-web.aspx">
                        <div class="btn btn-default Admin_icon">
                        <img class="img_icon" src="../../img/Admin_01.jpg" style=""/>
                            <h5 style="padding-top: 15px">تنظیمات</h5>
                        </div>
                    </a>
                </div>

                <!-- /.col -->
            </div>


        </section>
    </div>

</asp:Content>

