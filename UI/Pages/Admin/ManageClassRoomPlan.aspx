<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageClassRoomPlan.aspx.cs" Inherits="UI_Pages_Admin_ManageClassRoomPlan" %>

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
                                    <tr>
                                        <th style="width: 10%">ایام هفته</th>
                                        <th style="width: 10%">8-10</th>
                                        <th style="width: 10%">10-12</th>
                                        <th style="width: 10%">12-14</th>
                                        <th style="width: 10%">14-16</th>
                                        <th style="width: 10%">16-18</th>
                                        <th style="width: 10%">18-20</th>
                                    </tr>
                                </thead>
                                <tbody>
                                            <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                                {
                                                    UserSrl = Convert.ToString(Request.QueryString["Srl"]);
                                                }
                                              TermSrl = Session["TermSrl"] as string ;
                                                for (int i = 0; i <= 6; i++)
                                                    {
                                                        %>
                                            <tr>
                                                <% AllDayOfWeak = Student.GetStudentDayOfWeak(i);
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "8:00", "10:00");
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString() + "(" + AllDayOfWeak["SessionTypeName"].ToString() + ")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "10:00", "12:00");
                                                 if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "12:00", "14:00");
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "14:00", "16:00");
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "16:00", "18:00");
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                <% AllDayOfWeak = Student.GetStudentClassRoomPlan(UserSrl, TermSrl, i, "18:00", "20:00");
                                                    if (AllDayOfWeak != null)
                                                    {%>
                                                <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                <%}
                                                 else
                                                  { %>
                                                <td></td>
                                                <%} %>

                                                
                                            </tr>
                                            <% 
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

