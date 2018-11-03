<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageListStudent.aspx.cs" Inherits="UI_Pages_Admin_ManageListStudent" %>

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
                                                <th style="width: 1%">رديف</th>
                                                <th style="width: 15%">نام و نام خانوادگي</th>
                                                <th style="width: 10%">شماره دانشجویی</th>
                                                <th style="width: 10%">تعداد غیبت</th>
                                                <th style="width: 10%">نمره فعالیت </th>
                                            </tr>
                                        </thead>

                                        <tbody>


                                            <%if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                                {
                                                    EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                }
                                   
                                                Srl = Session["TaecherSrl"] as string;
                                                Term = Session["TermSrl"] as string;

                                                AllStudent = Course.GetTeacherListStudentData(EraeSrl,Term);
                                                if (AllStudent != null)
                                                {
                                                    Count = AllStudent.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllAPStudent.Columns.Count);
                                                    for (int i = 0; i < Count; i++)
                                                    {%>

                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=AllStudent.Rows[i]["Name"].ToString() + " " + AllStudent.Rows[i]["Family"].ToString() %></td>
                                                <td><%=AllStudent.Rows[i]["code"].ToString()%></td>
                                                <td><%=Activity.GetSumActivity(AllStudent.Rows[i]["Srl_Student"].ToString(),Convert.ToString(Request.QueryString["EraeSrl"])) %> از <%=Activity.GetSumAllActivity(AllStudent.Rows[i]["Srl_Student"].ToString(),Convert.ToString(Request.QueryString["EraeSrl"])) %></td> 
                                                <td><%=APChecking.GetSumAPChecking(AllStudent.Rows[i]["Srl_Student"].ToString(),Convert.ToString(Request.QueryString["EraeSrl"]))%></td>
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

