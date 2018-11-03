<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Session.aspx.cs" Inherits="UI_Pages_Admin_Manage_galase" %>

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
 <a data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-sm glyphicon glyphicon-plus">جلسه جدید  </a>
</div>
                                <div class="col-sm-2">                                                               
                                </div>
                                                                
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 1%">ردیف</th>
                                            <th style="width: 10%">تاریخ</th>
                                            <th style="width: 15%">زمان شروع </th>
                                            <th style="width: 15%">زمان پایان </th>
                                            <th style="width: 10%">نوع جلسه </th>
                                            <th style="width: 10%">فعال / غیر فعال  </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%if (Request.QueryString["Srl"] != null && Request.QueryString["Srl"] != "")
                                            {
                                                Srl = Convert.ToInt32(Request.QueryString["Srl"]);
                                            }

                                            //????ایجاد یه ویو
                                            AllSession = SessionClass.GetManageSessionData(TermSrl);
                                            if ( AllSession != null)
                                            {
                                                Count =  AllSession.Rows.Count;
                                                for (int i = 0, j = 1; i < Count; i++, j++)
                                                {%>

                                        <tr>
                                                <td><%=j%></td>
                                                <td><%=AllSession.Rows[i]["Tarikh"].ToString()%></td>
                                                <td><%=AllSession.Rows[i]["StartTime"].ToString() %></td>
                                                <td><%=AllSession.Rows[i]["EndTime"].ToString()%></td>
                                                <td><%=AllSession.Rows[i]["IsStart"].ToString()%>
                                            <%if (AllSession.Rows[i]["IsStart"].ToString() == "True")
                                                {%>
                                            <td><i class="fa fa-check" style="color:#42b13d"></i></td>
                                            <%}
                                                else 
                                                {%>
                                            <td><i class="fa fa-close" style="color: #ff0000"></i></td>
                                            <%} %>
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
<h4 class="modal-title" id="myModalLabel" style="margin-right:30px">ثبت کلاس جدید</h4>
                                            </div>
                                            <div class="modal-body">
                                  
                               <div class="row">
                                  <div class="form-group">
                                <div class="col-md-5 pull-right">
                                            <div class="form-group">
                                                <label> تاریخ جلسه : </label>
                                                <div class="input-group" style="direction: ltr">
                                                    <input id="Date1" type="date" runat="server" name="name" class="form-control" />
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                                         <div class="col-md-1 pull-right"></div>
                                  <div class="col-md-5 pull-right">
                                            <div class="form-group">
                                                <label>زمان شروع :</label>
                                                <div class="input-group" style="direction: ltr">
                                                    <input id="time1" type="time" runat="server" name="name" class="form-control" />
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <!-- /.input group -->
                                        </div>
                            </div>
                                   
                                </div>
                               <div class="row">
                                  <div class="form-group">
                                <div class="col-md-5 pull-right">
                                            <div class="form-group">
                                                <label>زمان پایان :</label>
                                                <div class="input-group" style="direction: ltr">
                                                    <input id="Date2" type="time" runat="server" name="name" class="form-control" />
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                                         <div class="col-md-1 pull-right"></div>
                                  <div class="col-md-5   pull-right">
                                            <div class="form-group">
                                                <label>نوع جلسه : </label>
                                  <input type="text" class="form-control" id="_txt_Email" />
                                                </div>
                                        </div>
                            </div>
                                   
                                </div>
                           
                                                
                               <div class="modal-footer">
                    <br />
                     <button type="button" class="btn btn-success pull-right " data-dismiss="modal"><i class="fa fa-check"></i>ذخيره</button>
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

