<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Student/MainStudent.master" AutoEventWireup="true" CodeFile="StudentHomeWork.aspx.cs" Inherits="UI_Pages_Student_StudentHomeWork" %>

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
                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="col-md-12 custyle">
                                                        <div class="col-sm-2" >
     <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button> 
     <button type="button" class="btn btn-primary btn-sm"> ترم 1397 </button>
    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                         </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button>
                                    <button type="button" class="btn btn-primary btn-sm">درس</button>
                                    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                  </div>

                                 <div class="col-sm-2">                                                               
                                </div>
                                 <div class="col-sm-1">                                                               
                                </div>
                                   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">

                                      <thead>
                                        <tr>
                                            <th style="width: 1%">#</th>
                                            <th style="width: 15%">درس</th>
                                            <th style="width: 10%">استاد</th>
                                            <th style="width: 10%">عنوان </th>
                                            <th style="width: 8%">نمره</th>
                                            <th style="width: 5%">درصد پایانی </th>
                                            <th style="width: 9%">تاریخ تحویل</th>
                                            <th style="width: 8%">ساعت تحویل</th>
                                            <th style="width: 5%">دانلود تمرین </th>
                                            <th style="width: 5%">جزئیات</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            Srl = Session["StudentSrl"] as string ;
                                            Term = Session["TermSrl"] as string ;
                                            if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                            {
                                                EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                AllHomeWork = Activity.GetStudentHomWorkData(Srl,EraeSrl, Term);
                                            }
                                            else {
                                               AllHomeWork = Activity.GetStudentAllHomWorkData(Srl,Term);
                                            }

                                            if (AllHomeWork != null)
                                            {
                                                int count = AllHomeWork.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0,j=1; i < count; i++,j++)
                                                {%>
                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllHomeWork.Rows[i]["Name"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["NameMaster"].ToString()+" "+AllHomeWork.Rows[i]["Family"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["Title"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["Grade"].ToString()%> از <%=AllHomeWork.Rows[i]["GradeActivity"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["FinalPercent"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["DeadlineDate"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["DeadlineTime"].ToString()%></td>
                                            <%if (AllHomeWork.Rows[i]["Srl_Activity"].ToString() == "")
                                                { %>
                                                   <td><a href="../../../File/Activity/TeacherActivity/<%=AllHomeWork.Rows[i]["Srl_Activity"].ToString()%>.pdf" class="btn btn-default btn-xs">دانلود</a></td>
                                            <%}
                                               else
                                                { %>
                                            <td><a href="../../../File/Activity/TeacherActivity/<%=AllHomeWork.Rows[i]["Srl_Activity"].ToString()%>.pdf" class="btn btn-success btn-xs"><i class="fa fa-download"></i>دانلود</a></td>
                                            <%} %>
                                            <td class="text-center">
                                                <a href="StudentActivityDetail.aspx?EraeSrl=<%=AllHomeWork.Rows[i]["Srl_Erae"].ToString()%>&ActivityGradeSrl=<%=AllHomeWork.Rows[i]["Srl"].ToString()%>&ActivitySrl=<%=AllHomeWork.Rows[i]["Srl_Activity"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-inbox"></i>جزئیات</a>
                                            </td>
                                        </tr>

                                        <%}
                                            }%>
                                    </tbody>
                                </table>

                                <!--modal-->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                <%--                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>--%>
                                            </div>
                                            <div class="modal-body">

                                                <div class="col-md-12">
                                                    <div class="col-md-6">
                                                        <div class="control-group">
                                                            <label class="control-label ">درس</label>
                                                            <div class="controls">
                                                                <input type="text" value="" id="_CourseName" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="control-group">
                                                            <label class="control-label ">نام تمرین</label>
                                                            <div class="controls">
                                                                <input type="text" value="" id="_HomeWorkName" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="control-group">
                                                            <label class="control-label">تاریخ</label>
                                                            <div class="controls">
                                                                <input type="date" value="" id="_date" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="control-group">
                                                            <label class="control-label">نمره کامل</label>
                                                            <div class="controls">
                                                                <input type="text" value="" id="_MGrade" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="control-group">
                                                            <label class="control-label">درصد در نمره پایانی</label>
                                                            <div class="controls">
                                                                <input type="text" value="" id="_FinalPercent" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="control-group">
                                                            <label class="control-label">توضیحات</label>
                                                            <div class="controls">
                                                                <textarea id="_Description" cols="20" rows="2"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default " data-dismiss="modal">بستن</button>
                                                <a href="TeacherNewActivity.aspx" class="btn btn-primary">ذخیره</a>
                                                <%--<input type="button" class="btn btn-primary " id="AddHomeWork" value="ذخیره" runat="server" onclick="SendToPopup()" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer ">
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>

    <script>
        $(function () {
            $("#example1").DataTable();
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

     <%--<script>
        function centerModal() {
            $(this).css('display', 'block');
            var $dialog = $(this).find(".modal-dialog");
            var offset = ($(window).height() - $dialog.height()) / 2;
            // Center modal vertically in window
            $dialog.css("margin-top", offset);
        }

        $('.modal').on('show.bs.modal', centerModal);
        $(window).on("resize", function () {
            $('.modal:visible').each(centerModal);
        });
         </script>--%>

    

</asp:Content>

