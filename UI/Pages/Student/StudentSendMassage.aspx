<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Pages/Student/MainStudent.master" AutoEventWireup="true" CodeFile="StudentSendMassage.aspx.cs" Inherits="UI_Pages_Student_StudentSendMassage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%--<section class="content-header">
      <h1>
       پیام ها
        <small>۱۳ پیام جدید</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> خانه</a></li>
        <li class="active">صندوق پیام</li>
      </ol>
    </section>--%>

    <!-- Main content -->
    <section class="content">
      <div class="row">

           <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#activity" data-toggle="tab"> صندوق دريافت</a></li>
              <li><a href="#settings" data-toggle="tab">ارسال پيام</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
               
             <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title margin-bottom">صندوق دریافت</h3>

              <div class="box-tools pull-right">
                <div class="has-feedback margin-bottom">
                  <input type="text" class="form-control input-sm" placeholder="جستجو"/>
<%--                  <span class="fa fa-camera"></span>--%>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
               <div class="pull-left" >
                 <div class="btn-group margin-bottom" style="margin-right:600px" >
                  <button type="button" class="btn btn-primary btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
                   <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-trash-o"></i></button>
                   <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-reply"></i></button>
                   <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-share"></i></button>
                 </div>
               </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-refresh"></i></button>
              </div>
                <div class="col-md-11 col-md-offset-1">
              <div class="table-responsive mailbox-messages ">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                    <td><input type="checkbox"/></td>
                    <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                    <td class="mailbox-name"><a href="readmail.aspx">محبوبه شایسته</a></td>
                    <td class="mailbox-subject"><b>تایید سفارش</b> - کالا با موفقیت ثبت شد.
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date">5 دقیقه پیش</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                    <td class="mailbox-name"><a href="readmail.aspx">زهرا شاکری</a></td>
                    <td class="mailbox-subject"><b>تایید سفارش</b> - کالا با موفقیت ثبت شد.
                    </td>
                    <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                    <td class="mailbox-date">28 دقیقه پیش</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                    <td class="mailbox-name"><a href="readmail.aspx">مهلا حسین زاده</a></td>
                    <td class="mailbox-subject"><b>تایید سفارش</b> - کالا باموفیت ثبت شد.
                    </td>
                    <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                    <td class="mailbox-date">11 ساعت پیش</td>
                  </tr>
                         <tr>
                    <td><input type="checkbox"/></td>
                    <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                    <td class="mailbox-name"><a href="readmail.aspx">  سمانه اسدی</a></td>
                    <td class="mailbox-subject"><b>تایید سفارش</b> - کالا باموفیت ثبت شد.
                    </td>
                    <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                    <td class="mailbox-date">11 ساعت پیش</td>
                  </tr>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
                    </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">

                <div class="pull-left" style="margin-right:650px">
          1/200
                    <button type="button" class="btn btn-primary btn-sm margin-bottom"><i class="fa fa-chevron-right"></i></button> 
                    
                    <button type="button" class="btn btn-primary btn-sm margin-bottom"><i class="fa fa-chevron-left"></i></button>
               
                  <!-- /.btn-group -->
                </div>
           
                <!-- /.pull-right -->
              </div>
            </div>
             
          </div>
            <!-- /.box-body -->
            
                   </div>

              <div class="tab-pane" id="settings">
                
       <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <input class="form-control" placeholder="آدرس">
              </div>
              <div class="form-group">
                <input class="form-control" placeholder="موضوع">
              </div>
              <div class="form-group">
                    <textarea id="mytextarea" class="form-control" style="height: 150px; resize:none;">

                    </textarea>
              </div>
              <div class="form-group">
                <div class="btn btn-default btn-file">
                  <i class="fa fa-paperclip"></i> ضميمه
                  <input type="file" name="attachment">
                </div>
                <p class="help-block">حداکثر سايز 32MB</p>
              </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <div class="pull-right">
              <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> ارسال</button>
                <button type="button" class="btn btn-info"><i class="fa fa-pencil"></i> پيش نويس</button>
              </div>
                   <div class="pull-left">
              <button type="reset" class="btn btn-danger"><i class="fa fa-times"></i> انصراف</button>
                       </div>
            </div>
</div >
                </div>
              <!-- /.tab-pane -->
           
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        
       <div class="col-md-3">
          <a href="mail1.aspx" class="btn btn-primary btn-block margin-bottom btn3d">
              <i class="fa fa-envelope-o"></i>
              ارسال پیام جدید
          </a>

          <div class="box box-solid">
            <div class="box-header with-border">
                <%--<div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>--%>
              <h3 class="box-title">پوشه </h3>
 
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked" >
                <li class="active"><a href="#"><span class="label label-primary pull-left">12</span>
                    <i class="fa fa-inbox"></i> صندوق دریافت</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> صندوق ارسال</a></li>
                <li><a href="#"><i class="fa fa-file-text-o"></i> پیش نویس</a></li>  
                <li><a href="#"><i class="fa fa-trash-o"></i> سطح زباله</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.col -->
        </div>
      
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

</asp:Content>

