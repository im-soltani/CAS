<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherActivity.aspx.cs" Inherits="UI_Pages_Teacher_TeacherActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <%--<section class="content-header">    
    </section>--%>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">

                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="col-md-12 custyle">
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button>
                                    <button type="button" class="btn btn-primary btn-sm">ترم 1397 </button>
                                    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button>
                                    <button type="button" class="btn btn-primary btn-sm">درس</button>
                                    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                </div>
                                <div class="col-sm-2">
                                    <a href="TeacherActivityDetail.aspx" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>تمرین جدید</a>

                                </div>
                                <div class="col-sm-1">
                                </div>
                                <%--<div class="col-sm-2 col-md-offset-7">
                                    <button type="button" class="btn btn-primary btn-sm " onclick="TeacherCourse(++TermSrl)" id="_NextTerm"><i class="fa fa-chevron-right"></i>&nbsp</button>
                                    <button type="button" class="btn btn-primary btn-sm" id="_NameTerm"> </button>
                                    <button type="button" class="btn btn-primary  btn-sm" onclick="TeacherCourse(--TermSrl)"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                </div>--%>
                                <table id="example2" class="table table-bordered table-striped custab" style="margin-top: 0%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 1%">#</th>
                                            <th style="width: 10%">درس</th>
                                            <th style="width: 10%">تمرین</th>
                                            <th style="width: 10%">نمره</th>
                                            <th style="width: 10%">درصد در نمره پایانی </th>
                                            <th style="width: 10%">تاریخ تحویل </th>
                                            <th style="width: 10%">ساعت تحویل </th>
                                            <th style="width: 15%">توضیحات </th>
                                            <th style="width: 10%">لیست دانشجویان</th>
                                            <th style="width: 20%">مدیریت </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            Srl = Session["TaecherSrl"] as string;
                                            TermSrl = Session["TermSrl"] as string;
                                            if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                            {
                                                EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                AllHomeWork = Activity.GetTeacherHomeWorkData(EraeSrl);
                                            }
                                            else
                                            {
                                                AllHomeWork = Activity.GetTeacherAllHomWorkData(Srl, TermSrl);
                                            }

                                            if (AllHomeWork != null)
                                            {
                                                Count = AllHomeWork.Rows.Count;
                                                System.Diagnostics.Debug.WriteLine(AllHomeWork.Columns.Count);
                                                for (int i = 0; i < Count; i++)
                                                {%>
                                        <tr>
                                            <td><%=AllHomeWork.Rows[i]["Srl"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["Name"].ToString() %></td>
                                            <td><%=AllHomeWork.Rows[i]["Title"].ToString() %></td>
                                            <td><%=AllHomeWork.Rows[i]["Grade"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["FinalPercent"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["DeadlineDate"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["DeadlineTime"].ToString()%></td>
                                            <%Description = AllHomeWork.Rows[i]["Description"].ToString();%>
                                            <td class="required-field-block"><%=AllHomeWork.Rows[i]["Description"].ToString()%></td>
                                            <td class="text-center">
                                                <a href="TeacherNewActivity.aspx?EraeSrl=<%= Convert.ToInt32(Request.QueryString["EraeSrl"])%>" class="btn btn-primary btn-xs"><i class="fa fa-inbox"></i>داشجویان</a>
                                            </td>
                                            <td class="text-center">
                                                <a href="TeacherActivityDetail.aspx?EraeSrl=<%= Convert.ToInt32(Request.QueryString["EraeSrl"])%>&asrl=<%=AllHomeWork.Rows[i]["Srl"].ToString()%>" id="_Edite" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>ویرایش</a>
                                                <a href="TeacherHomeWork.aspx?EraeSrl=<%= Convert.ToInt32(Request.QueryString["EraeSrl"])%>&asrl=<%=AllHomeWork.Rows[i]["Srl"].ToString()%>" id="DeleteHomeWork" class="btn btn-danger btn-xs"><i class="fa fa-close"></i>حذف</a>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.footer -->
                        <div class="box-footer ">
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



    <!-- Modal -->
    
 <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header modal-header-primary">
                        <button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">×</button>
                        <h1><i class=""></i></h1>
                    </div>
                    <div class="modal-body">
                        <form runat="server" style="direction:rtl">
                            <div class="col-md-6" >
                                <div class="form-group">
                                    <label>نام تمرین: </label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-paper-plane"></i>
                                        </div>
                                        <input type="text" runat="server" class="form-control pull-right Name" />
                                    </div>
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-md-6" >
                                <div class="form-group" style="direction:rtl">
                                    <label>نام درس:</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-book"></i>
                                        </div>
                                        <input type="text" runat="server" class="form-control pull-right CourseName " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" >
                                <div class="form-group" style="direction:rtl">
                                    <label>ساعت تحویل:</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                        <input type="time" runat="server" class="form-control pull-right _Time" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="direction:rtl">
                                    <label>تاریخ تحویل :</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="date" runat="server" class="form-control pull-right Tarikh" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="direction:rtl">
                                    <label>درصد در نمره پایانی:</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <input type="text" runat="server" class="form-control pull-right FinalPercent" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="direction:rtl">
                                    <label>نمره درس:</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <input type="text" runat="server" class="form-control pull-right Grade" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="direction:rtl">
                                    <label>فایل</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-pencil"></i>
                                        </div>
                                        <asp:FileUpload ID="_File" runat="server" class="_File"/>  
<%--                                        <input type="file" id="_File" runat="server" class="form-control pull-right" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="direction:rtl">
                                    <label>توضیحات:</label>
                                    <div class="input-group date" style="direction:ltr">
                                        <div class="input-group-addon">
                                            <i class="fa fa-comment"></i>
                                        </div>
                                        <input type="text" runat="server" class="form-control pull-right _Description" />
                                    </div>
                                </div>
                            </div>
                             </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn_Save" data-dismiss="modal">ذخیره</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    <!-- Modal -->


    <script>
        $(function () {
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true
            });
        });
    </script>

    <style>
        .modal-header-primary {
            color: #fff;
            padding: 9px 15px;
            border-bottom: 1px solid #eee;
            background-color: #428bca;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
    </style>

    <script type="text/javascript">
        function NewActivity(Name, CourseName, _Time, Tarikh, FinalPercent, Grade, _File, _Description) {
            Name = Name.val()
            CourseName = CourseName.val()
            _Time = _Time.val()
            Tarikh = Tarikh.val()
            FinalPercent = FinalPercent.val()
            _File = _File.val()
            _Description = _Description.val()
            $.ajax
            ({
                type: 'get',
                data: {
                    Name: Name,
                    CourseName: CourseName,
                    _Time: _Time,
                    Tarikh: Tarikh,
                    FinalPercent: FinalPercent,
                    _File: _File,
                    _Description: _Description
                },
                dataType: "json",
                contentType: 'application/json; charset =utf-8',
                success: function (data) {
                    console.log(data);
                    if (data.code == 200)
                    { alert("ok"); }
                    else
                    { alert("!خطا"); }

                },

                error: function (result) {
                    console.error(result.responseText);
                }
            });
        }    </script>


</asp:Content>

