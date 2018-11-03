<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherAPChecking.aspx.cs" Inherits="UI_Pages_Teacher_TeacherAPChecking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form2" runat="server">
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
                                            <th style="width: 5%">#</th>
                                            <th style="width: 10%">نام درس</th>
                                            <th style="width: 10%">تاریخ</th>
                                            <th style="width: 10%">ساعت شروع </th>
                                            <th style="width: 10%">ساعت پایان</th>
                                            <th style="width: 10%">تاخیر</th>
                                            <th style="width: 10%">لیست دانشجویان</th>
                                            <th style="width: 20%">مدیریت</th>
                                        </tr>
                                    </thead>

                                    <tbody>


                                        <%Srl = Session["TeacherSrl"] as string;
                                            Term = Session["TermSrl"] as string;

                                            if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                            {
                                                EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                AllAPChecking = APChecking.GetTeacherAPCheckingData(EraeSrl);

                                            }
                                            else {
                                               AllAPChecking = APChecking.GetTeacherAllAPCheckingData(Srl,Term);
                                            }
                                            
                                            if (AllAPChecking != null)
                                            {
                                                Count = AllAPChecking.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllAPChecking.Columns.Count);
                                                for (int i = 0,j = 1; i < Count; i++,j++)
                                                {%>
                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllAPChecking.Rows[i]["Name"].ToString() %></td>
                                            <td><%=AllAPChecking.Rows[i]["Tarikh"].ToString() %></td>
                                            <td><%=AllAPChecking.Rows[i]["StartTime"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["EndTime"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["Delay"].ToString()%></td>
                                            <td class="text-center">
                                                <a href="TeacherNewAPChecking.aspx?EraeSrl=<%=AllAPChecking.Rows[i]["Srl_Erae"].ToString() %>&SessionSrl=<%=AllAPChecking.Rows[i]["Srl_Session"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-inbox"></i>دانشجویان</a>
                                            </td>
                                            <td class="text-center">
                                                <a href="TeacherAPChecking.aspx?EraeSrl=<%=AllAPChecking.Rows[i]["Srl_Erae"].ToString() %>&asrl=<%=AllAPChecking.Rows[i]["Srl"].ToString()%>" id="_Edite" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>ویرایش</a>
                                                <a href="TeacherAPChecking.aspx?EraeSrl=<%=AllAPChecking.Rows[i]["Srl_Erae"].ToString() %>&asrl=<%=AllAPChecking.Rows[i]["Srl"].ToString()%>" id="" class="btn btn-danger btn-xs"><i class="fa fa-close"></i>حذف</a>
                                            </td>
                                        </tr>

                                        <%}
                                            }%>
                                    </tbody>

                                </table>
                            </div>

                           <%-- <!--modal-->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <%--                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>--%>
                                       <%-- </div>
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <div class="control-group">
                                                    <label class="control-label">درس</label>
                                                    <div class="controls">
                                                        <input type="date" value="" id="_txt_Name" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="control-group">
                                                    <label class="control-label">تاریخ</label>
                                                    <div class="controls">
                                                        <input type="date" value="" id="_date" />
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="control-group">
                                                    <label class="control-label">ساعت شروع</label>
                                                    <div class="controls">
                                                        <input type="time" value="" id="_time_end" />
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="control-group">
                                                    <label class="control-label">ساعت پایان</label>
                                                    <div class="controls">
                                                        <input type="time" value="" id="_time_start" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default " data-dismiss="modal">بستن</button>
                                            <input type="button" class="btn btn-primary " id="AddHomeWork" value="ذخیره" runat="server" onserverclick="_btn_Saved_ServerClick" />
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

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

    </form>


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


    <script>
        $(document).ready(function () {
            $("#DeleteHomeWork").click(function (ev) {
                confirm("آیا مطمئنید که می خواهید این حضور و غیاب همه دانشجویان برای این تاریخ را حذف کنید؟");
            });
        });
    </script>

    <%--<script type="text/javascript">
        $(document).ready(function () {
            $("#AddHomeWork").click(function (ev) {
                $('#Button1').click(function () {
                    var name = $('#_txt_name').val();
                    var tarikh = $('#_date').val();
                    var MGrade = $('#_MGrade').val();
                    var checkbox = $('#_check').val();
                    if (name != '' && tarikh != '' && checkbox != '' && MGrade != '') {
                        $.ajax
                        ({
                            type: 'POST',
                            url: 'TeacherListHomeWork.aspx/InsertData',
                            async: false,
                            data: "{name:'" + name + "','tarikh':'" + tarikh + "',checkbox:'" + checkbox + "',MGrade:'" + MGrade + "'}",
                            contentType: 'application/json; charset =utf-8',
                            success: function (data) {

                                var obj = data.d;
                                if (obj == 'true') {
                                    $('#_txt_name').val('');
                                    $('#_date').val('');
                                    $('#_MGrade').val('');
                                    $('#_check').val('');
                                    alert("Data Saved Successfully");

                                }
                            },

                            error: function (result) {
                                alert("Error Occured, Try Again : " + result);
                            }
                        });
                    } else {
                        alert("Pleae Fill all the Fields");
                        return false;
                    }
                });
            });
        });
    </script>--%>

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

</asp:Content>

