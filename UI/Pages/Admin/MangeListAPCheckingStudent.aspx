<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="MangeListAPCheckingStudent.aspx.cs" Inherits="UI_Pages_Admin_MangeListAPCheckingStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <%--<section class="content-header">     
    </section>--%>

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
                                    <button type="button" class="btn btn-primary btn-sm "><i class="fa fa-chevron-right"></i>&nbsp</button>
                                    <button type="button" class="btn btn-primary btn-sm">درس</button>
                                    <button type="button" class="btn btn-primary  btn-sm"><i class="fa fa-chevron-left"></i>&nbsp</button>
                                  </div>
                                <div class="col-sm-2">                                                               
                                </div>
                                                                
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>

                                            <tr>
                                                <th style="width: 1%">#</th>
                                                <th style="width: 15%">نام و نام خانوادگي</th>
                                                <th style="width: 10%">شماره دانشجویی</th>
                                                <th style="width: 10%">حضور/غیاب</th>
                                                <th style="width: 10%">تأخیر</th>
                                            </tr>
                                        </thead>

                                        <tbody>


                                            <%if (Request.QueryString["SessionSrl"] != null && Request.QueryString["SessionSrl"] != "")
                                                {
                                                    SessionSrl = Convert.ToInt32(Request.QueryString["SessionSrl"]);
                                                }
                                   
                                                Srl = Session["TaecherSrl"] as string;
                                                Term = Session["TermSrl"] as string;

                                                AllStudent = Student.GetManageAPCheckingListStudentData(SessionSrl);
                                                if (AllStudent != null)
                                                {
                                                    Count = AllStudent.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllAPStudent.Columns.Count);
                                                    for (int i = 0,j=1; i < Count; i++,j++)
                                                    {%>

                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=AllStudent.Rows[i]["Name"].ToString() + " " + AllStudent.Rows[i]["Family"].ToString() %></td>
                                                <td><%=AllStudent.Rows[i]["code"].ToString()%></td>
                                                <%if (AllStudent.Rows[i]["Delay"].ToString() == "-1")
                                                { %>
                                            <td><i class="fa fa-close"style="color:#ff0000"></i></td>
                                            <%}
                                             else
                                               {%>
                                            <td><i class="fa fa-check" style="color:#42b13d"></i></td>
                                            <%} %>
                                            <td><%=AllStudent.Rows[i]["Delay"].ToString()%></td>
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

