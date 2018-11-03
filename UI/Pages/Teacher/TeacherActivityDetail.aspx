<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherActivityDetail.aspx.cs" Inherits="UI_Pages_Teacher_TeacherActivityDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form runat="server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <%--<section class="content-header">    
    </section>--%>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body" style="direction:rtl">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>نام تمرین: </label>
                                    <div class="input-group date">
                                        <input type="text" id="_Name" runat="server" class="form-control pull-right" />
                                        <div class="input-group-addon">
                                            <i class="fa fa-paper-plane"></i>
                                        </div>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>نام درس:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-book"></i>
                                        </div>
                                        <input type="text" id="_NameCourse" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>ساعت تحویل:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                        <input type="time" id="_Time" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>تاریخ تحویل :</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="date" id="_Tarikh" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>درصد در نمره پایانی:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <input type="text" id="_FinalPercent" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>نمره درس:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <input type="text" id="_Grade" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>فایل</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <asp:FileUpload ID="_File" runat="server" />
<%--                                        <input type="file" id="_File" runat="server" class="form-control pull-right" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>توضیحات:</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-comment"></i>
                                        </div>
                                        <input type="text" id="_Description" runat="server" class="form-control pull-right" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.footer -->
                        <div class="box-footer ">
                            <asp:Button ID="Button1" class="btn btn-primary " runat="server" Text="ذخیره" OnClick="Button1_Click" />
                        </div>
                        <!-- /.footer -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
</form>

    <%--<script type="text/javascript">
        //function Save(){
        //$(document).ready(function () {
        //function Save(_txt_Name,_Tarikh,_Time,_txt_Grade,_txt_FinalPercent,_txt_Description) {

        //    $.ajax
        //    ({
        //        type: 'POST',
        //        url: 'TeacherActivityDetail.aspx',
        //        data: "{type:'New','Title':'" + document.getElementById('_txt_Name').value + "','DeadlineDate:'" + document.getElementById('_Tarikh').value + "','DeadlineTime:'" + document.getElementById('_Time').value + "','Garde:'" + document.getElementById('_txt_Grade').value + "','FinalPercent:'" + document.getElementById('_txt_FinalPercent').value + "','Description:'" + document.getElementById('_txt_Description').value + "','DocumentFile:'" + document.getElementById('_File').value + "'}",
        //        async: false,
        //        contentType: 'application/json; charset =utf-8',
        //        success: function (returndata) {
        //            console.log(returnedata);
        //            $('#_txt_Name').val('');
        //            $('#_Tarikh');
        //            $('#_Time');
        //            $('#_txt_Grade').val('');
        //            $('#_txt_FinalPercent').val('');
        //            $('#_txt_Description').val('');
        //            $('#_File').val('');
        //            alert("record has been saved in database");

        //        }
        //        ,

        //        error: function () {
        //            console.log('there is some error');
        //        }
        //    });

        //}

        //document.getElementById("AddHomeWork").addEventListener("click", Save);
        //});
        //});
    </script>--%>

</asp:Content>

