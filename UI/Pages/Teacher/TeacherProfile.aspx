<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Teacher/MainTeacher.master" AutoEventWireup="true" CodeFile="TeacherProfile.aspx.cs" Inherits="UI_Pages_Teacher_TeacherProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form runat="server">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <%--<section class="content-header">
    </section>--%>

            <!-- Main content -->
            <section class="content">

                <%
                    Term = Session["TermSrl"] as string;
                    Srl = Session["TeacherSrl"] as string;

                    TeacherData = Teacher.GetTeacherData(Srl);
                    GroupName = Teacher.GetGroupData(TeacherData["Srl_Group"].ToString());
                %>


                <div class="row ">
                    <div class="col-md-8 ">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs pull-right">
                                <li><a href="#settings" data-toggle="tab">تنظيمات کلمه عبور</a></li>
                                <li><a href="#activity" data-toggle="tab">تنظيمات حساب کاربري</a></li>
                                <li class="active"><a href="#ClassRoomPlan" data-toggle="tab">برنامه کلاسی</a></li>
                            </ul>
                            <div class="tab-content">

                                <div class=" active tab-pane" id="ClassRoomPlan">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-md-12 custyle">
                                                <table id="example2" class="table table-bordered table-striped custab">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">ایام هفته</th>
                                                            <th style="width: 10%">8-10</th>
                                                            <th style="width: 10%">10-12</th>
                                                            <th style="width: 10%">12-14</th>
                                                            <th style="width: 10%">14-16</th>
                                                            <th style="width: 10%">16-18</th>
                                                            <th style="width: 10%">18-20</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            Srl = Session["TeacherSrl"] as string;
                                                            Term = Session["TermSrl"] as string;

                                                            for (int i = 0; i <= 6; i++)
                                                            {
                                                        %>
                                                        <tr>
                                                            <% AllDayOfWeak = Teacher.GetTeacherDayOfWeak(i);
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "8:00", "10:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString() + "(" + AllDayOfWeak["SessionTypeName"].ToString() + ")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "10:00", "12:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "12:00", "14:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "14:00", "16:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "16:00", "18:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>

                                                            <% AllDayOfWeak = Teacher.GetTeacherClassRoomPlan(Srl, Term, i, "18:00", "20:00");
                                                                if (AllDayOfWeak != null)
                                                                {%>
                                                            <td><%=AllDayOfWeak["Name"].ToString()+"("+AllDayOfWeak["SessionTypeName"].ToString()+")"%></td>
                                                            <%}
                                                                else
                                                                { %>
                                                            <td></td>
                                                            <%} %>
                                                        </tr>
                                                        <% 
                                                            }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class=" tab-pane" id="activity">
                                    <div class="form-horizontal">

                                        <div class="form-group ">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_Name" runat="server" />
                                            </div>
                                            <label for="inputName" class="col-md-3  control-label">نام </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_Family" runat="server" />
                                            </div>
                                            <label class="col-md-3 control-label">نام خانوادگي</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_Code" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">شماره استادی </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_Mobile" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">شماره تلفن همراه</label>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <input type="email" class="form-control" id="_Email" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">آدرس ايميل &nbsp; &nbsp; &nbsp;</label>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_TelgramID" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">تلگرام &nbsp; &nbsp; &nbsp;</label>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <img src="../../img/StudentPicture/<%=TeacherData["Picture"]%>" style="width: 70px; height: 50px" />
                                            </div>
                                            <label class="col-sm-3 control-label">تصوير قبلي &nbsp; &nbsp;&nbsp; </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-md-offset-2">
                                                <asp:FileUpload ID="_Picture" runat="server" />
                                            </div>
                                            <label for="inputEmail" class="col-sm-3 control-label">تصوير جديد&nbsp; &nbsp;&nbsp; </label>
                                        </div>

                                        <div class="modal-footer">
                                            <asp:Button ID="Button2" runat="server" Text="تغییرات" class="btn btn-success" OnClick="Button2_Click" />
                                        </div>

                                    </div>
                                </div>


                                <div class="tab-pane" id="settings">
                                    <div class="form-horizontal">

                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_OldUserName" runat="server" />
                                            </div>
                                            <label for="inputEmail" class="col-sm-3 control-label">نام کاربری قبلی</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_OldPassWord" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">رمز عبور قبلی </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_NewUserName" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">نام کاربری جدید</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_PassWord" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">کلمه عبور جديد</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-2">
                                                <input type="text" class="form-control" id="_RPassWord" runat="server" />
                                            </div>
                                            <label class="col-sm-3 control-label">تکرار کلمه عبور جديد</label>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="Button1" runat="server" Text="تغییرات" class="btn btn-success" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                    </div>

                    <div class="col-md-4">

                        <!-- Profile Image -->
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                                <img class="profile-user-img img-responsive img-circle" src="../../img/Admin.png" alt="User profile picture" />

                                <h3 class="profile-username text-center"><%=TeacherData["Name"].ToString() + " "+TeacherData["Family"].ToString()%></h3>

                                <p class="text-muted text-center"><%=GroupName["Name"]%></p>

                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b><i class="fa fa-barcode margin-r-5"></i>شماره استادی</b>
                                        <a style="margin-right: 120px"><%=TeacherData["Code"].ToString()%></a>
                                    </li>
                                    <li class="list-group-item">

                                        <b><i class="fa fa-phone margin-r-5"></i>شماره تلفن</b>
                                        <a style="margin-right: 110px"><%=TeacherData["Mobile"].ToString()%></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b><i class="fa fa-yahoo margin-r-5"></i>آدرس ايميل</b>
                                        <a style="margin-right: 10px"><%=TeacherData["Email"].ToString()%></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b><i class="fa fa-telegram margin-r-5"></i>آدرس تلگرام</b>
                                        <a style="margin-right: 120px"><%=TeacherData["TelegramID"].ToString()%></a>
                                    </li>
                                </ul>

                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    <!-- /.col -->

                    <!-- /.col -->
                </div>
                <!-- /.row -->

            </section>
            <!-- /.content -->
        </div>
    </form>

</asp:Content>

