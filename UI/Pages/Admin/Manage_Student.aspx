<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Student.aspx.cs" Inherits="UI_Pages_Admin_Manage_Student" %>

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
                                            <th style="width: 3%">#</th>
                                            <th style="width: 10%">تصویر</th>
                                            <th style="width: 10%">نام و نام خانوادگی </th>
                                            <th style="width: 10%">شماره دانشجویی</th>
                                            <th style="width: 10%">شماره تلفن  </th>
                                            <th style="width: 10%">تلگرام</th>
                                            <th style="width: 10%">ایمیل</th>
                                            <th style="width: 10%">مدیریت </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                            {
                                                Srl = Convert.ToInt32(Request.QueryString["Srl"]);
                                            }

                                            TermSrl = Session["TermSrl"] as string;
                                            AllStudent = Student.GetManageStudentData(TermSrl);
                                            if (AllStudent != null)
                                            {
                                                Count = AllStudent.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0,j=1; i < Count; i++,j++)
                                                {%>

                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllStudent.Rows[i]["picture"].ToString()%></td>
                                            <td><%=AllStudent.Rows[i]["Name"].ToString() + " " + AllStudent.Rows[i]["Family"].ToString() %></td>
                                            <td><%=AllStudent.Rows[i]["Code"].ToString()%></td>
                                            <td><%=AllStudent.Rows[i]["Mobile"].ToString()%></td>
                                            <td><%=AllStudent.Rows[i]["TelegramID"].ToString()%></td>
                                            <td><%=AllStudent.Rows[i]["Email"].ToString()%></td>
                                            <td class="text-center">
                                                <a href="Manage_Teacher.aspx?asrl=<%=AllStudent.Rows[i]["Srl"].ToString()%>" id="DeleteHomeWork" class="btn btn-danger btn-xs"><i class="fa fa-close"></i>حذف</a>
                                                <a href="#.aspx?asrl=<%=AllStudent.Rows[i]["Srl"].ToString()%>" id="_Edite" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>ویرایش</a>
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

