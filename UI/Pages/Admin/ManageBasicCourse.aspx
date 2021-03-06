﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageBasicCourse.aspx.cs" Inherits="UI_Pages_Admin_ManageBasicCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <!-- Main content -->
        <section class="content">
            <div class="row">
                   <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="col-md-12 custyle">
                                <div class="col-sm-1">
  <button type="button" class="btn btn-success  btn-sm" style="">بروزرسانی</button>
                                         </div> 
                                <div class="col-sm-2" >
     <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button> 
     <button type="button" class="btn btn-primary btn-sm"> ترم 1397 </button>
    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                         </div>
                                <div class="col-sm-2">
 <a data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-sm glyphicon glyphicon-plus">ترم جدید  </a>
</div>
                                <div class="col-sm-2">                                                               
                                </div>
                                                                
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>

                                    <tr >
                                        <th style="width: 1%">#</th>
                                        <th style="width: 10%">نام درس</th>
                                        <th style="width: 10%">کد درس</th>
                                        <th style="width: 10%">نوع درس</th>
                                        <th style="width: 15%">مدیریت</th>
                                    </tr>

                                </thead>
                                <tbody>
                                            <%TermSrl = Session["TermSrl"] as string ;
                                                AllCourse = Course.GetManageCourseData(TermSrl);
                                                if (AllCourse != null)
                                                {
                                                    Count = AllCourse.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                    for (int i = 0; i < Count; i++)
                                                    {%>
                                            <tr>
                                                <td><%=AllCourse.Rows[i]["Srl"].ToString()%></td>
                                                <td><%=AllCourse.Rows[i]["Name"].ToString()%></td>
                                                <td><%=AllCourse.Rows[i]["Srl_Department"].ToString()+""+ AllCourse.Rows[i]["Srl_Group"].ToString()+""+ AllCourse.Rows[i]["Code"].ToString()%></td>
                                                <td><%=AllCourse.Rows[i]["CourseType"].ToString()%></td>

                                                <td class="text-center">
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-tag"></i>برنامه کلاسی</a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="Manage_HomeWork.aspx?Srl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-bookmark"></i>تمرین ها</a>
                                                    <a href="Manage_APChecking.aspx?Srl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" class="btn btn-success btn-xs"><i class="fa fa-check-square-o"></i>حضور و غیاب</a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="TeacherEditeHomeWork.aspx?asrl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" id="_Edite" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>ویرایش</a>
                                                    <a href="TeacherListHomeWork.aspx?asrl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" id="DeleteHomeWork" class="btn btn-danger btn-xs"><i class="fa fa-close"></i>حذف</a>
                                                </td>
                                            </tr>
                                            <%}
                                                }%>
                                        </tbody>

                            </table>
                            </div>  
                        </div>
                        </div>
                       </div>
                </div>
           
                        <!-- /.box-body -->
                         <!-- /.footer -->
                            <div class="box-footer ">
                            </div>
   
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <script>
        $(function () {
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
            });
        });
    </script>
    

</asp:Content>

