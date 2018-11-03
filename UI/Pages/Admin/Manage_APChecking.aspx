<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_APChecking.aspx.cs" Inherits="UI_Pages_Admin_Manage_APChecking" %>

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
                                <div class="col-sm-2"></div>
                                <div class="col-sm-2"></div>
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>

                                        <tr>
                                            <th style="width: 1%">#</th>
                                            
                                            <th style="width: 10%">تاریخ </th>
                                            <th style="width: 10%">ساعت شروع</th>
                                            <th style="width: 10%">ساعت پایان</th>
                                            <th style="width: 10%">لیست دانشجویان</th>
                                        </tr>

                                    </thead>
                                    <tbody>

                                        <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                            {
                                                Srl = Convert.ToInt32(Request.QueryString["Srl"]);
                                            }

                                            TermSrl = Session["TermSrl"] as string;
                                            AllAPChecking = APChecking.GetManageAPCheckingData(Request.QueryString["Srl"]);
                                            if (AllAPChecking != null)
                                            {
                                                Count = AllAPChecking.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0,j=1; i < Count; i++,j++)
                                                {%>

                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllAPChecking.Rows[i]["Tarikh"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["StartTime"].ToString()%></td>
                                            <td><%=AllAPChecking.Rows[i]["EndTime"].ToString()%></td>
                                            <td class="text-center">
                                                <a href="MangeListAPCheckingStudent.aspx?SessionSrl=<%=AllAPChecking.Rows[i]["Srl"].ToString()%>" class="btn btn-primary btn-xs"><i class="fa fa-users"></i>دانشجویان</a>
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

