<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_HomeWork.aspx.cs" Inherits="UI_Pages_Admin_Manage_HomeWork" %>

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
                                            <th style="width: 10%"> تمرین</th>
                                            <th style="width: 15%">استاد</th>
                                            <th style="width: 10%">تاریخ</th>
                                            <th style="width: 10%">نمره تمرین</th>
                                            <th style="width: 10%">لیست دانشجویان</th>
                                            <th style="width: 15%">مدیریت</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                            {
                                                Srl = Convert.ToInt32(Request.QueryString["Srl"]);
                                            }
                                            TermSrl = Session["TermSrl"] as string;
                                            AllHomeWork = Activity.GetManageHomeWorkData(TermSrl);
                                            if (AllHomeWork != null)
                                            {
                                                Count = AllHomeWork.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0, j = 1; i < Count; i++, j++)
                                                {%>

                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllHomeWork.Rows[i]["Title"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["Name"].ToString()+ " "+AllHomeWork.Rows[i]["Family"].ToString()  %></td>
                                            <td><%=AllHomeWork.Rows[i]["Tarikh"].ToString()%></td>
                                            <td><%=AllHomeWork.Rows[i]["Grade"].ToString()  %></td>
                                            <td class="text-center">
                                                <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-inbox"></i>دانشجویان</a>
                                            </td>
                                            <td class="text-center">
                                                <a href="Manage_HomeWork.aspx?EraeSrl=<%=AllHomeWork.Rows[i]["Srl_Erae"].ToString()%>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>ویرایش</a>
                                                <a href="Manage_HomeWork.aspx?EraeSrl=<%=AllHomeWork.Rows[i]["Srl_Erae"].ToString()%>" class="btn btn-danger btn-xs"><i class="fa fa-close"></i>حذف</a>
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

