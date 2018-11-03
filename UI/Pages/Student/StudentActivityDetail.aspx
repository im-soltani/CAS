<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Student/MainStudent.master" AutoEventWireup="true" CodeFile="StudentActivityDetail.aspx.cs" Inherits="UI_Pages_Student_StudentActivityDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <%-- <section class="content-header">
    </section>--%>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h4 class="modal-title text-right">&nbsp;تمرين &nbsp;&nbsp;</h4>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="box-header with-border pull-right">
                                    <%--                                <div class="user-block">
                                    <img class="img-circle pull-right " src="Course.png" style="width:8%;height:8%;">
                                    <span class="username"><a href="#">نام کاربري</a></span>
                                    <span class="description">امروز - 5 بعد از ظهر</span>
                                </div>--%>
                                </div>
                                <div class="form-group">

                                    <%--<span class="text-bold pull-right"> <h4><a href="#">
                                   <%--<i class="glyphicon glyphicon-book "></i>عنوان</a></h4></span>--%>
                                    <div class="row">
                                    <div class="col-md-12 ">
                                        <div class="form-group " style="text-align: right">
                                            <label>توضيحات استاد</label>
                                            <asp:Label ID="MasterDescription" class="form-control" runat="server" Text="" Style="height: 110px;"></asp:Label>

                                        </div>
                                    </div>

                                    <div class="col-md-12 ">
                                        <div class="col-md-2">
                                            <div class="form-group" style="margin-top: 25px; text-align: right">
                                                <label>بارگذاري فايل</label>

                                                <asp:FileUpload ID="_FileActivity" runat="server" />

                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-group" style="text-align: right">
                                                <label>توضيحات دانشجو</label>
                                                <div class="controls ">
                                                    <textarea id="_Description" runat="server" required="" style="width: 100%; height: 85px; resize: none;"></textarea>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                        </div>

                                </div>
                                <!-- /.tab-content -->
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <asp:Button ID="Save" runat="server" Text="ذخیره" class="btn btn-primary" OnClick="Save_Click" />
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
        </div>
    </form>

</asp:Content>

