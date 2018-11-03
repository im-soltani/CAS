<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherNewAPChecking.aspx.cs" Inherits="UI_Pages_Teacher_TeacherNewAPChecking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <%--<section class="content-header">     
    </section>--%>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">

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
                                                <th style="width: 5%">رديف</th>
                                                <th style="width: 25%">نام و نام خانوادگي</th>
                                                <th style="width: 25%">شماره دانشجویی</th>
                                                <th style="width: 10%">تاخير</th>
                                                <th style="width: 20%">وضعيت حضور</th>
                                            </tr>
                                        </thead>

                                        <tbody>


                                            <%if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                                {
                                                    EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                }
                                               
                                                int i = 0;
                                                Srl = Session["TaecherSrl"] as string;
                                                Term = Session["TermSrl"] as string;

                                                AllAPStudent = APChecking.GetTeacherNewAPCheckingData(EraeSrl,Term);
                                                if (AllAPStudent != null)
                                                {
                                                    Count = AllAPStudent.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllAPStudent.Columns.Count);
                                                    for (i = 0,j=1; i < Count; i++,j++)
                                                    {%>
                                            <tr>
                                                <td><%=j%></td>
                                                <td><a href="#"><%=AllAPStudent.Rows[i]["Name"].ToString() + " " + AllAPStudent.Rows[i]["Family"].ToString() %></a></td>
                                                <td><%=AllAPStudent.Rows[i]["code"].ToString()%></td>
                                                <td>
                                                    <input type="hidden" class="Srl" value="<%=AllAPStudent.Rows[i]["Srl_Student"].ToString()%>"/>
                                                    <input type="text" runat="server" class="Delay" style="text-emphasis-position: right" /></td>
                                                <td>
                                                    <input type="checkbox" runat="server" class="DelayCheck" />
                                                </td>
                                            </tr>
                                            <%} }%>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-lg-2 col-lg-offset-10" style="margin-top: 20px">
<%--                                    <input type="button" name="name" value="ذخیره" class="btn btn-block btn-primary Normal" runat="server" onserverclick="_btn_Saved_ServerClick" />--%>
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

    </form>

    <script>
        $(function () {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
        });
</script>

    <script type="text/javascript">
        function APChecking(Delay, Absent,Srl)
        {
            Delay = Delay.val()
            Absent = Absent.get(0).checked
                $.ajax
                ({
                    type: 'get',
                    data: {
                        Delay: Delay,
                        'Absent': !Absent ? 1 : 0,
                        StudentSrl: Srl,
                        //SessionSrl:<%=Request.QueryString["SessionSrl"]%>
                    },
                    dataType:"json",
                    contentType: 'application/json; charset =utf-8',
                    success: function (data) {
                        console.log(data);
                        if (data.code == 200)
                        { alert("ok"); }
                        else
                        { alert("!خطا");}
                       
                    },

                    error: function (result) {
                        console.error(result.responseText);
                    }
                });
        }

        var FN = function (en) {
            var TR = $(this).parent().parent();
            var D = TR.find(".Delay")
            var DCH = TR.find(".DelayCheck")
            window.setTimeout(function () {
                APChecking(D, DCH,TR.find(".Srl").val())
            },3000)
            
        }
        $(".Delay").blur(FN);
        $(".DelayCheck").change(FN);

    </script>

</asp:Content>

