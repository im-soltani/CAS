<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Student/MainStudent.master" AutoEventWireup="true" CodeFile="StudentAPChecking.aspx.cs" Inherits="UI_Pages_Student_StudentAPChecking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <%--<section class="content-header">
      <h1>
       حضورغياب       
      </h1>      
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
                                            <th style="width: 10%">درس</th>
                                            <th style="width: 15%">استاد</th>
                                            <th style="width: 10%">تاریخ</th>
                                            <th style="width: 10%">ساعت شروع </th>
                                            <th style="width: 10%">ساعت پایان</th>
                                            <th style="width: 10%">حضور / غیبت</th>
                                            <th style="width: 10%">تأخیر</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            Srl = Session["StrudentSrl"] as string ;
                                            Term = Session["TermSrl"] as string ;

                                            if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                            {
                                                EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                AllAPChecking = APChecking.GetStudentAPCheckingData(EraeSrl, Term);
                                            }
                                            else {
                                                AllAPChecking = APChecking.GetStudentAllAPCheckingData(Term);
                                            }


                                            if (AllAPChecking != null)
                                            {
                                                int count = AllAPChecking.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0,j = 1; i < count; i++,j++)
                                                {%>

                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllAPChecking.Rows[i]["CourseName"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["Name"].ToString()+" "+AllAPChecking.Rows[i]["Family"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["Tarikh"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["StartTime"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["EndTime"].ToString()%></td>

                                            <%if (AllAPChecking.Rows[i]["Delay"].ToString() == "-1")
                                                { %>
                                            <td><i class="fa fa-close"style="color:#ff0000"></i></td>
                                            <%}
                                             else
                                               {%>
                                            <td><i class="fa fa-check" style="color:#42b13d"></i></td>
                                            <%} %>
                                            <td><%=AllAPChecking.Rows[i]["Delay"].ToString()%></td>
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

