<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Admin/Admin.master" AutoEventWireup="true" CodeFile="Setting-web.aspx.cs" Inherits="UI_Pages_Admin_Setting_webservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <section class="content">
        <div class="box box-primary">
        <div class="box-body">
        <div class="col-md-12 custyle">
                               <div class="row">
                                  <div class="form-group">
                                <div class="col-md-4 pull-right">
                                            <div class="form-group">
                                                <label> نام کاربری : </label>
                                   <input type="text" class="form-control" id="_txt_Email1" />
                                         
                                            </div>
                                        </div>
                                  <div class="col-md-4 pull-right">
                                            <div class="form-group">
                                                <label>کلمه عبور :</label>
                                       <input type="password" class="form-control" id="_txt_Email2" />
                                           
                                            </div>
                                            <!-- /.input group -->
                                        </div>

                                      <div class="col-md-4 pull-right">
                                            <div class="form-group">
                                                <label>آدرس وب سرویس :</label>
                 <input type="url" class="form-control" id="_txt_Email" />

                                            </div>
                                            <!-- /.input group -->
                                        </div>
                            </div>
                                </div>
            <div class="modal-footer">
                <br />
                     <button type="button" class="btn btn-success pull-right" data-dismiss="modal"><i class="fa fa-check"></i>ذخيره</button>
                     <button type="button" class="btn btn-danger " data-dismiss="modal" style="margin-right:1030px"><i class="fa fa-close" ></i>انصراف</button>
                </div>
                                </div>
                            </div>
            </div>
        </section>

      </div>


</asp:Content>

