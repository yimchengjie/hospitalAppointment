<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8" />
		<!-- <link rel="icon" type="image/png" href="../assets/img/.png"> -->
		<!--这里可以链接一张照片-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		
		<title>
			登陆
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
				//选择登录方式
				$('input[type=checkbox]').on('switchChange.bootstrapSwitch', function (event,state) {

						//普通用户 
						if(state!=true){
							$("#username").attr("placeholder","请输入手机号登录");
							$("#username").val("");
							$("#password").val("");
						}
						//管理员
						else{
							$("#username").val("");
							$("#password").val("");
							$("#username").attr("placeholder","请输入用户名登录");
						}
		            });
			//绑定回车为登录事件
			$(document).keydown(function(event){
			    if(event.keyCode==13){
			       $("#login").click();
			    }
			 });
				
				
			$("#login").click(function(){
				//提交登录表单
				//$(".loading").css("display","block");
				var json={};
				json.username=$("#username").val(),
				json.password=$("#password").val(),
				json.type=$("[name=checkbox]:checked").val()=="on"?"admin":"user";
				var flag=true;
				if(json.type=="user"){
					var reg = /^1[34578]\d{9}$/;
					falg=reg.test(json.username)
				}
				//输入为空不提交
				 if(json.username==""||json.password=="" || flag==false){
					 if(falg == false){			
							alert("登录失败,用户名或密码错误");
							return;
						}
					return;
				}	 
				$.ajax({
					type: "post",
					url: "login",
					data: json,
					dataType: 'text', 
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					success: function(data) {
						//$(".loading").css("display","none");
						if(data=="success"){
							//if(json.type=="user")
							//window.location = "index.jsp";
							//else if(json.type=="admin")
								window.location = "goindex?type="+json.type;
						}
						else if(data=="error"){
							alert("登录失败,用户名或密码错误");	
							window.location = "login.jsp";
						}
						else if(data=="stateerror"){
							alert("登录失败,该用户已登录！已强制注销！");	
							window.location = "login.jsp";
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
					<a href="#pablo" class="dropdown-toggle" id="navbarDropdown" data-toggle="dropdown">
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
					<a class="navbar-brand" href="#" rel="tooltip" >
						请登录
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
							<a class="nav-link" href="register.jsp">没有帐号？去注册</a>
						</li>
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
										<input style="background-color:rgba(255,255,255,0.1);" type="text" id="username" class="form-control" placeholder="请输入手机号登陆">
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
						                    </span>
										</div>
										<input type="password" id="password" placeholder="请输入密码" class="form-control" />
										
									</div>
									<div style="margin-left: 230px;">
										<input type="checkbox"  name="checkbox" class="bootstrap-switch" size="5" data-off-label="用户" data-on-label="管理员" />
										<!--	<div style="margin-left: 150px;"><input type="radio" >管理员  <input type="radio" >用户	</div>-->
									</div>					
								</div>
								<div class="card-footer text-center ">
									<button  id="login" class="btn btn-primary btn-round btn-lg btn-block">登录</button>
										<div style="margin-left: 230px;"></div>
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
		<!--   Core JS Files   -->
		<script src="../js/core/jquery.min.js" type="text/javascript"></script>
		<script src="../js/core/popper.min.js" type="text/javascript"></script>
		<script src="../js/core/bootstrap.min.js" type="text/javascript"></script>
		<script src="../js/plugins/bootstrap-switch.js"></script>
		<script src="../js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
	</body>

</html>