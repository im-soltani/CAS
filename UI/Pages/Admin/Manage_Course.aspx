<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Course.aspx.cs" Inherits="UI_Pages_Admin_Manage_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                                  </div>
                                <div class="col-sm-2">                                                               
                                </div>
                                                                
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>                              

                                    <tr >
                                        <th style="width: 1%">ردیف</th>
                                        <th style="width: 12%">درس</th>
                                        <th style="width: 10%">کد درس</th>
                                        <th style="width: 18%"> استاد</th>
                                        <th style="width: 1%">جلسات</th>
                                         <th style="width: 8%">جلسات تشکيل شده</th>
                                        <th style="width: 8%">برنامه کلاسی</th>
                                        <th style="width: 8%">لیست دانشجویان</th>
                                        <th style="width: 12%">فعالیت</th>
                                    </tr>

                                </thead>
                                <tbody>
                                            <%
                                                TermSrl = Session["TermSrl"] as string ;

                                                AllCourse = Course.GetManageCourseData(TermSrl);
                                                if (AllCourse != null)
                                                {
                                                    Count = AllCourse.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                    for (int i = 0,j=1; i < Count; i++,j++)
                                                    {%>
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=AllCourse.Rows[i]["Name"].ToString()%></td>
                                                <td><%=AllCourse.Rows[i]["EraeCode"].ToString() +"_"+AllCourse.Rows[i]["Srl_Department"].ToString()+""+ AllCourse.Rows[i]["Srl_Group"].ToString()+""+ AllCourse.Rows[i]["Code"].ToString()%></td>
                                                <td><%=AllCourse.Rows[i]["MasterName"].ToString() + " " + AllCourse.Rows[i]["Family"].ToString() %></td>
                                                <td><%=APChecking.GetSumMeetingHeld(AllCourse.Rows[i]["Srl"].ToString())%> از 16</td>
                                                <td class="text-center">
                                                <a href="Manage_Session.aspx" class="btn btn-info btn-xs"><i class="fa fa-inbox"></i>جزئيات</a>
                                                 </td>
                                                <td class="text-center">
                                                    <a href="ManageListStudent.aspx?EraeSrl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-users"></i>دانشجویان</a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-tag"></i>برنامه کلاسی</a>
                                                </td>
                                                <td class="text-center">
                                                    <a href="Manage_HomeWork.aspx?Srl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-bookmark"></i>تمرین ها</a>
                                                    <a href="Manage_APChecking.aspx?Srl=<%=AllCourse.Rows[i]["Srl"].ToString()%>" class="btn btn-success btn-xs"><i class="fa fa-check-square-o"></i>حضور و غیاب</a>
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

