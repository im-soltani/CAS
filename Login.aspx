<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ورود</title>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <link href="UI/Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="UI/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/font-awesome.min.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/animate.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/hamburgers.min.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/select2.min.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/util.css" rel="stylesheet" />
    <link href="UI/Bootstrap/dist/css/main.css" rel="stylesheet" />
</head>
<body>
    <div class="limiter">       
        <div class="container-login100">

            <%--<div id="Alert" class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-warning"></i> Alert!</h4>
                Warning alert preview. This alert is dismissable.
              </div>--%>

            <div class="wrap-login100">
                <div class="login100-pic js-tilt">
                    <img src="UI/img/University_icon.jpg" alt="IMG" />
                </div>
                <form id="form1" runat="server" style="direction: rtl">
                    <span class="login100-form-title">به سامانه حضور و غیاب خوش آمدید.
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" id="_txt_UserName" type="text" runat="server" name="Name" placeholder="نام کاربری" />
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" id="_txt_PassWord" type="password" runat="server" name="name" placeholder="رمز عبور" />
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <input type="button" name="name" value="ورود" class="login100-form-btn" runat="server" onserverclick="_btn_login_ServerClick" />
                    </div>

                    <%--<div>
                        <asp:Label ID="L_Message" data-toggle="modal" data-target="#myModal" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>--%>

                    <div class="text-center p-t-12">
                        <%--<span class="txt1">
							فراموشی
						</span>
						<a class="txt2" href="#">
							؟ نام کاربری / رمزعبور
						</a>--%>

                        <div class="text-center p-t-50">

                            <a class="txt2" style="color: blue" href="#">در صورت فراموشی به آموزش مراجعه شود
                            </a>
                        </div>
                    </div>

                    <%--<div class="text-center p-t-136">
						<a class="txt2" href="#">
							عضویت
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>--%>
                </form>


            </div>
        </div>
    </div>


    <script src="UI/Bootstrap/js/bootstrap.js"></script>
    <script src="UI/Bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery.js"></script>
    <!--===============================================================================================-->
    <script src="UI/Bootstrap/dist/js/popper.js"></script>
    <!--===============================================================================================-->
    <script src="UI/Bootstrap/dist/js/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="UI/Bootstrap/plugins/fastclick/fastclick.js"></script>
    <script src="UI/Bootstrap/dist/js/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>

    <%--<script type='text/javascript'>
        
        function Alert() {

            var e = document.getElementById("#Alert");
            if (e.style.display == 'block')
                e.style.display = 'none';
            else
                e.style.display = 'block';
        }

    </script>--%>

   <%-- <style>
        .alert {display:none;}
   </style>--%>
  

<%--    data-toggle="modal" data-target="#myModal"--%>

</body>
</html>
