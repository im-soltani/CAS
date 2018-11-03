<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherNewActivity.aspx.cs" Inherits="UI_Pages_Teacher_TeacherNewActivity" %>

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
                                 <div class="col-sm-1">
                                         </div> 
                                <div class="col-sm-2"></div>
   <table id="example2" class="table table-bordered table-striped custab" style="margin-top:0%;">
                                    <thead>
                                            <tr>
                                                <th style="width: 1%">رديف</th>
                                                <th style="width: 20%">نام و نام خانوادگي</th> 
                                                <th style="width: 15%">شماره دانشجويي</th>
                                                <th style="width: 10%">تاریخ تحویل</th>
                                                <th style="width: 10%">ساعت تحویل</th>
                                                <th style="width: 20%">توضیحات</th>
                                                <th style="width: 10%">فایل</th>
                                                <th style="width: 5%">نمره</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%if (Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
                                                {
                                                    EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
                                                }
                                                Srl = Session["TeacherSrl"] as string;
                                                Term = Session["TermSrl"] as string;

                                                AllStudent = Activity.GetNewHomeWorkData(EraeSrl,Term);
                                                if (AllStudent != null)
                                                {
                                                    Count = AllStudent.Rows.Count;
                                                    //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
                                                    for (int i = 0,j=1; i < Count; i++,j++)
                                                    {%>
                                            <tr>
                                                <td><%=j%></td>
                                                <td><%=AllStudent.Rows[i]["Name"].ToString() + " " + AllStudent.Rows[i]["Family"].ToString() %></td>
                                                <td><%=AllStudent.Rows[i]["code"].ToString()  %></td>
                                                <td><%=AllStudent.Rows[i]["RegDate"].ToString()  %></td>
                                                <td><%=AllStudent.Rows[i]["RegTime"].ToString()  %></td>
                                                <td><%=AllStudent.Rows[i]["Description"].ToString()  %></td>
                                                <td><input id="_download" value="دانلود" class="btn btn-success btn-xs"/></td>
                                                <td>
                                                    <input type="hidden" class="Srl" value="<%=AllStudent.Rows[i]["Srl_Student"].ToString()%>"/>
                                                    <input type="text" class="Grade" style="text-emphasis-position: right" />

                                                </td>
                                            </tr>
                                            <%}
                                                }%>
                                        </tbody>
                                    </table>
                                    <div class="col-md-2 col-md-offset-10" style="margin-top:15px">
                                    <input type="button" id="Save" name="name" value="ذخیره" class="btn btn-primary btn-md" />
                                </div>
                                </div>
                                
                            </div>
                            <!-- /.box-body -->
                            <!-- /.footer -->
                            <div class="box-footer">
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

    <!--DataTable-->
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

    <!--Insert-->
    <script type="text/javascript">
        function Activity(Garde,Srl)
        {
            Grade = Grade.val()
                $.ajax
                ({
                    type: 'get',
                    data: {
                        Grade: Grade,
                        StudentSrl: Srl,
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
            var D = TR.find(".Grade")
            //var DCH = TR.find(".DelayCheck")
            window.setTimeout(function () {
                APChecking(D,TR.find(".Srl").val())
            },3000)
            
        }
        $(".Delay").blur(FN);
       // $(".DelayCheck").change(FN);

        

    </script>
</asp:Content>

