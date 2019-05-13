<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8" />
		<link rel="icon" type="image/png" href="../img/.png">
		<!--这里可以链接一张照片-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>
			注册
		</title>
		<!--     Fonts and icons     -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		<!-- CSS Files -->
		<link href="../css/bootstrap.min.css" rel="stylesheet" />
		<link href="../css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>	
		<style type="text/css">
		input:-webkit-autofill {

   			 transition:background-color 5000s ease-in-out 0s;
   			text-fill-color:#fff;
   			-webkit-text-fill-color:#fff;
		} 
			
		</style>	
<script type="text/javascript">
			//绑定事件
			$(function() {
				//判断姓名是否符合格式
				var flagname = false;
				//判断密码是否符合格式
				var flagpwd = false;
				//判断身份证是否符合格式
				var flagidcard = false;
				//判断手机号是否符合格式
				var flagtel = false;
				//判断确认密码是否符合格式
				var flagpwd2=false;
				
				//验证姓名格式
				$('#username').blur(
					function() {
						var username = $(this).val();
						//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
						var reg =  /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
						//格式错误
						if(reg.test(username) == false) {
							flagname = false;
							$('#username').parent().removeClass("has-success");
							$('#username').parent().addClass("has-danger");
						} 
						//格式正确
						else {
							$('#username').parent().removeClass("has-danger");
							$('#username').parent().addClass("has-success");
							flagname = true;
							if(flagname && flagpwd &&flagidcard && flagtel &&flagpwd2) {
								$('#register').removeAttr("disabled");
							}
						}
					}
				)
				//验证手机号格式
				$('#tel').blur(
					function() {
						var tel = $(this).val();
						//手机号正则
						var reg = /^1[34578]\d{9}$/;
						//格式错误
						if(reg.test(tel) == false) {
							flagtel = false;
							$('#tel').parent().removeClass("has-success");
							$('#tel').parent().addClass("has-danger");
						} 
						//格式正确
						else {
							$('#tel').parent().removeClass("has-danger");
							$('#tel').parent().addClass("has-success");
							flagtel = true;
							if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2) {
								$('#register').removeAttr("disabled");
							}
						}
					}
				)
				//验证身份证号格式
				$('#idcard').blur(
					function() {
						var idcard = $(this).val();
						//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
						var reg = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
						//格式错误
						if(reg.test(idcard) == false) {
							flagidcard = false;
							$('#idcard').parent().removeClass("has-success");
							$('#idcard').parent().addClass("has-danger");
						}
						//格式正确
						else {
							$('#idcard').parent().removeClass("has-danger");
							$('#idcard').parent().addClass("has-success");
							flagidcard = true;
							if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2)  {
								$('#register').removeAttr("disabled");
							}
						}
					}
				)
				//验证密码格式
				$('#password').blur(
					function() {
						var userpwd = $('#password').val();
						var userpwd2 = $('#password2').val();
						//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
						var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{4,10}$/;
						//格式错误
						if(reg.test(userpwd) == false) {
							$('#password').parent().removeClass("has-success");
							$('#password').parent().addClass("has-danger");
							if(userpwd2!=""){
								$('#password2').parent().removeClass("has-success");
								$('#password2').parent().addClass("has-danger");
							}
							flagpwd = false;
						} 
						//格式正确
						else {
							//密码和确认密码不同
							if(userpwd2!="" && userpwd2!=userpwd){
								$('#password2').parent().removeClass("has-success");
								$('#password2').parent().addClass("has-danger");
								flagpwd2 = false;
							}
							//密码和确认密码相同
							else if(userpwd2==userpwd){
								$('#password2').parent().removeClass("has-danger");
								$('#password2').parent().addClass("has-success");
								flagpwd2 = true;
								if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2) {
									$('#register').removeAttr("disabled");
								}
							}
							$('#password').parent().removeClass("has-danger");
							$('#password').parent().addClass("has-success");
							flagpwd = true;
							if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2) {
								$('#register').removeAttr("disabled");
							}
						}
					}
				)
			//验证确认密码
			$('#password2').blur(
					function() {
						var userpwd = $('#password').val();
						var userpwd2 = $('#password2').val();
						//确认密码和密码不同
						if(userpwd!=userpwd2||userpwd2=="") {
							$('#password2').parent().removeClass("has-success");
							$('#password2').parent().addClass("has-danger");
							flagpwd2 = false;
						} 
						//确认密码和密码相同
						else if(userpwd==userpwd2){
							$('#password2').parent().removeClass("has-danger");
							$('#password2').parent().addClass("has-success");
							flagpwd2 = true;
							if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2) {
								$('#register').removeAttr("disabled");
							}
						}
					}
				)
				
			//提交注册信息
			$("#register").click(function(){
				 var json={};
				json.username=$("#username").val();
				json.tel=$("#tel").val();
				json.password=$("#password").val();
				json.gender=$("[name=checkbox]:checked").val()=="on"?"男":"女",
				json.idcard=$("#idcard").val();
				 $.ajax({
					type: "post",
					url: "register",
					data: json,
					dataType: "text", 
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					success: function(data) {
						if(data=="success"){
							alert("注册成功");
						}
						else if(data=="erroridcard"){
							alert("注册失败,该身份证号已注册");	
						}
						else if(data=="errortel"){
							alert("注册失败,该手机号已注册");	
						}
					},
					error: function() {
						alert("无法连接服务器");
					}
				});  
			})
			})
				
	</script>
	</head>

	<body class="login-page sidebar-collapse">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
			<div class="container">
				<div class="dropdown button-dropdown">
					<a href="#" class="dropdown-toggle" id="navbarDropdown" data-toggle="dropdown">
						<span class="button-bar"></span>
						<span class="button-bar"></span>
						<span class="button-bar"></span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-header">个人信息</a>
						<a class="dropdown-item" href="#">个人信息</a>
						<a class="dropdown-item" href="#">预约记录</a>
						<a class="dropdown-item" href="#">账单中心</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">退出登陆</a>
						<a class="dropdown-item" href="#">其他</a>
					</div>
				</div>
				<div class="navbar-translate">
					<a class="navbar-brand" href="#" rel="tooltip"  data-placement="bottom" target="_blank">
						请注册
						<!--从session中取值-->
					</a>
					<button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
			          <span class="navbar-toggler-bar top-bar"></span>
			          <span class="navbar-toggler-bar middle-bar"></span>
			          <span class="navbar-toggler-bar bottom-bar"></span>
			        </button>
				</div>
				<div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="../img/blurred-image-1.jpg">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="login.jsp">已有帐号？去登陆</a>
						</li>
						<!-- <li class="nav-item">
							<a class="nav-link" href="https://github.com/creativetimofficial/now-ui-kit/issues">注册</a>
						</li> -->
						<li class="nav-item">
							<a class="nav-link" rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="https://twitter.com/CreativeTim" target="_blank">
								<i class="fab fa-twitter"></i>
								<p class="d-lg-none d-xl-none">Twitter</p>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="https://www.qq.com/CreativeTim" target="_blank">
								<i class="fab fa-facebook-square"></i>
								<p class="d-lg-none d-xl-none">Facebook</p>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="https://www.instagram.com/CreativeTimOfficial" target="_blank">
								<i class="fab fa-instagram"></i>
								<p class="d-lg-none d-xl-none">Instagram</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->

		<div class="page-header clear-filter" filter-color="black">
			<div class="page-header-image" style="background-image:url(../img/banner-bg.jpg)"></div>
			<div class="content">
				<div class="container">
					<div class="col-md-4 ml-auto mr-auto">
						<div class="card card-login card-plain">
							<!-- <form class="form" method="" action=""> -->
								<div class="card-header text-center">
									<div class="logo-container">
										<img src="../img/now-logo.png" alt="">
									</div>
								</div>
								<div class="card-body">
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input type="text" id="tel" class="form-control" placeholder="请输入手机号">
									</div>
									<div class="input-group no-border input-lg ">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input  type="text" id="username" class="form-control" placeholder="请输入姓名">
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
						                    </span>
										</div>
										<input type="password" id="password"  placeholder="请输入密码" class="form-control form-control-danger" />
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
						                    </span>
										</div>
										<input type="password"  id="password2" placeholder="请确认密码" class="form-control form-control-success" />
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input type="text"  id="idcard" class="form-control" placeholder="请输入身份证">
									</div>
									<div style="margin-left: 230px;"><input type="checkbox" checked name="checkbox" class="bootstrap-switch" size="5" data-on-label="男" data-off-label="女" /></div>

									<!--<div style="margin-left: 150px;"><input type="radio" >管理员  <input type="radio" >用户	</div>-->

								</div>
								<div class="card-footer text-center">
									<button disabled="disabled" id="register"class="btn btn-primary btn-round btn-lg btn-block">注册</button>

										<!--<div style="margin-left: 230px;"><input type="checkbox" checked name="checkbox" class="bootstrap-switch" size="5" data-on-label="管理员" data-off-label="用户" /></div>-->
									<!--<div class="pull-left">
										  <h6>
						                    <a href="#pablo" class="link">Create Account</a>
						                  </h6>
										</div>
										<div class="pull-right">
										  <h6>
						                    <a href="#pablo" class="link">Need Help?</a>
						                  </h6>
										</div>-->
							</div>
							<!-- </form> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				
				<div class=" container ">
				<nav>
					<ul>
						<li>
							<a href="https://www.creative-tim.com">
								Connect Us
							</a>
						</li>
						<li>
							<a href="http://presentation.creative-tim.com">
								About Us
							</a>
						</li>
						<li>
							<a href="http://presentation.creative-tim.com">
								Help
							</a>
						</li>
					</ul>
				</nav>
				</div>
			<!--<div class=" container ">
					<div class="copyright" id="copyright">
						&copy;2019 Designed by
						<a href="#" target="_blank">Swq&Jrc&Ycj</a>. Coded by
						<a href="#" target="_blank">Jjw&Xac</a>.
					</div>
				</div> -->
			</footer>

		</div>
		<!--   Core JS Files   -->
		<script src="../js/core/jquery.min.js" type="text/javascript"></script>
		<script src="../js/core/popper.min.js" type="text/javascript"></script>
		<script src="../js/core/bootstrap.min.js" type="text/javascript"></script>
		<script src="../js/plugins/bootstrap-switch.js"></script>
		<script src="../js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
	</body>

</html>