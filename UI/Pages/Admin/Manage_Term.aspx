<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Term.aspx.cs" Inherits="UI_Pages_Admin_Manage_Term" %>

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
 <a data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-sm glyphicon glyphicon-plus">ترم جدید  </a>
</div>
                                <div class="col-sm-2">                                                               
                                </div>
                                                                
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 1%">#</th>
                                            <th style="width: 10%">نام ترم</th>
                                            <th style="width: 15%">تاریخ شروع ترم </th>
                                            <th style="width: 15%">تاریخ پایان ترم </th>
                                            <th style="width: 10%">وضعیت ترم </th>
                                            <th style="width: 10%">فعال / غیر فعال  </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                            {
                                                Srl = Convert.ToInt32(Request.QueryString["Srl"]);
                                            }


                                            AllTerm = Term.GetManageTermData();
                                            if (AllTerm != null)
                                            {
                                                Count = AllTerm.Rows.Count;
                                                //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                for (int i = 0, j = 1; i < Count; i++, j++)
                                                {%>

                                        <tr>
                                            <td><%=j%></td>
                                            <td><%=AllTerm.Rows[i]["Name"].ToString() %></td>
                                            <td><%=AllTerm.Rows[i]["StartDate"].ToString()%></td>
                                            <td><%=AllTerm.Rows[i]["EndDate"].ToString()%></td>
                                            <%if (AllTerm.Rows[i]["IsActive"].ToString() == "True")
                                                {%>
                                            <td><i class="fa fa-check" style="color:#42b13d"></i></td>
                                            <%}
                                                else 
                                                {%>
                                            <td><i class="fa fa-close" style="color: #ff0000"></i></td>
                                            <%} %>
                                            <td class="text-center">
                                                <input type="checkbox" id="_ActiveTerm" runat="server" />
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
        <div class="modal-content">
       <div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="margin-right:30px">ثبت ترم جدید</h4>
                                            </div>
                                            <div class="modal-body">
                               <div class="row">
                                  <div class="form-group">
                      
                                  <div class="col-md-5 col-sm-5  pull-right">
                                            <div class="form-group">
                                                <label>نام ترم : </label>
                                               
                                  <input type="text" class="form-control" id="_txt_Email" />
                                                    
                                                </div>
                                        </div>

                                <div class="col-md-1 pull-right"></div>
                                  <div class="col-md-5 pull-right">
                                            <div class="form-group">
                                                <label> تاریخ شروع : </label>
                                                <div class="input-group" style="direction: ltr">
                                                    <input id="Date3" type="date" runat="server" name="name" class="form-control" />
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                            </div>
                                   
                                </div>
                               <div class="row">
                                  <div class="form-group">
                                <div class="col-md-5 pull-right">
                                            <div class="form-group">
                                                <label> تاریخ پایان : </label>
                                                <div class="input-group" style="direction: ltr">
                                                    <input id="Date1" type="date" runat="server" name="name" class="form-control" />
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>

                            </div>
                                   
                                </div>
                               
                           
                                                
                               <div class="modal-footer">
                    <br />
                     <button type="button" class="btn btn-success pull-right" data-dismiss="modal"><i class="fa fa-check"></i>ذخيره</button>

                     <button type="button" class="btn btn-danger  " data-dismiss="modal" style="margin-right:415px"><i class="fa fa-close" ></i>انصراف</button>
                </div>   
                                                  
                                                
                                            </div>
                                            
                                        </div>
                                </div></div>
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

