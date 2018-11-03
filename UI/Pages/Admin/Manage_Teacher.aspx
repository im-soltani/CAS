<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Teacher.aspx.cs" Inherits="UI_Pages_Admin_Manage_Teacher" %>

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
                                            <th style="width: 5%">تصویر</th>
                                            <th style="width: 20%">نام و نام خانوادگی </th>
                                            <th style="width: 10%">شماره استادی </th>
                                            <th style="width: 10%">شماره تلفن </th>
                                            <th style="width: 10%">گروه </th>
                                            <th style="width: 10%">ID_Telegram </th>
                                            <th style="width: 10%"> ایمیل</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                            <%TermSrl = Session["TermSrl"] as string ;
                                                AllTaecher =Teacher.GetManageTeacherData(TermSrl);
                                                if (AllTaecher != null)
                                                {
                                                    Count = AllTaecher.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                    for (int i = 0, j=1; i < Count; i++,j++)
                                                    {%>

                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=AllTaecher.Rows[i]["Picture"].ToString()%></td>
                                                <td><%=AllTaecher.Rows[i]["Name"].ToString() + " " + AllTaecher.Rows[i]["Family"].ToString() %></td>
                                                <td><%=AllTaecher.Rows[i]["Code"].ToString()%></td>
                                                <td><%=AllTaecher.Rows[i]["Mobile"].ToString()%></td>
                                                <td><%=AllTaecher.Rows[i]["Srl_Group"].ToString()%></td>
                                                <td><%=AllTaecher.Rows[i]["TelegramID"].ToString()%></td>
                                                <td><%=AllTaecher.Rows[i]["Email"].ToString()%></td>
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

