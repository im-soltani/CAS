<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Student/MainStudent.master" AutoEventWireup="true" CodeFile="StudentCourse.aspx.cs" Inherits="UI_Pages_Student_StudentCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <%-- <section class="content-header">
    </section>--%>
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
                                            <th style="width: 1%">#</th>
                                            <th style="width: 10%">نام درس</th>
                                            <th style="width: 10%">کد درس</th>
                                            <th style="width: 15%">استاد</th>
                                            <th style="width: 10%">نمره فعالیت</th>
                                            <th style="width: 10%">تعداد غیبت</th>
                                            <th style="width: 20%">فعالیت</th>
                                        </tr>
                                    </thead>
                                    <tbody id="Course">   
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
    </div>

    <script>
        $(function () {
            $("#example1").DataTable();
      
        });

        function TeacherCourse(TermSrl) {
            $.ajax
                   ({
                       type: 'Get',
                       data: {
                           GetCourseList: TermSrl
                       },
                       contentType: 'application/json; charset =utf-8',
                       dataType: "json",
                       success: function (data) {
                           var outdata = [];
                           var template = '<tr>\
                                            <td>{{ID}}</td>\
                                            <td>{{NAME}}</td>\
                                            <td>{{CODE}}</td>\
                                            <td>{{SUMFP}}</td>\
                                            <td>{{SMFH}}</td>\
                                            <td class="text-center">\
                                                <a href="{{SA}}>" class="btn btn-success btn-xs"><i class="fa fa-bookmark"></i>فعالیت </a>\
                                                <a href="{{SAPC}}" class="btn btn-primary btn-xs"><i class="fa fa-check-square-o"></i>حضور و غیاب</a>\
                                            </td>\
                                        </tr>';
                           $("#_NameTerm").html(data.TermSrl)
                           if (data.code == 200) {
                               if (data.message.length > 0) {
                                   //$("#course").html("")
                                   for (var i in data.message) {
                                       outdata.push([
                                           data.message[i].id,
                                           data.message[i].CourseName,
                                           data.message[i].Code,
                                           data.message[i].Name,
                                           data.message[i].SumActivity,
                                           data.message[i].SumAPChecking,
                                           '<a href="' + data.message[i].Activity + '" class="btn btn-success btn-xs"><i class="fa fa-bookmark"></i>فعالیت </a>'+
                                           '<a href="' + data.message[i].APChecking + '" class="btn btn-primary btn-xs"><i class="fa fa-check-square-o"></i>حضور و غیاب</a>'
                                       ]);
                                       /*
                                       var tmp = template.replace("{{ID}}", data.message[i].id)
                                       .replace("{{NAME}}", data.message[i].Name)
                                       .replace("{{CODE}}", data.message[i].CodeErae)
                                       .replace("{{SUMFP}}", data.message[i].SumFinalPercent)
                                       .replace("{{SMFH}}", data.message[i].GetSumMeeting)
                                           .replace("{{TSL}}", data.message[i].EraeSrl)
                                       .replace("{{THW}}", data.message[i].TeacherHomeWork)
                                       .replace("{{TAPC}}", data.message[i].TeacherAPChecking)
                                       */
                                       //$("#course").append(tmp)

                                   }
                               }

                           }
                           else {
                               alert("خطا!")
                           }


                           $('#example2').DataTable({
                               "destroy": true,
                               "paging": true,
                               data:outdata,
                               "lengthChange": true,
                               "searching": true,
                               "ordering": true,
                               "info": true,
                               "autoWidth": true
                           });
                       },

                       error: function (result) {
                           alert("Error Occured, Try Again : " + result);
                       }
                   });
        }
        var TermSrl=<%=Session["TermSrl"]%>
        TeacherCourse(TermSrl);
    </script>

</asp:Content>

