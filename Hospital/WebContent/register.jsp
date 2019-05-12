<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		<!-- CSS Files -->
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
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
					<a class="navbar-brand" href="login.jsp" rel="tooltip"  data-placement="bottom" target="_blank">
						请登录
						<!--从session中取值-->
					</a>
					<button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
			          <span class="navbar-toggler-bar top-bar"></span>
			          <span class="navbar-toggler-bar middle-bar"></span>
			          <span class="navbar-toggler-bar bottom-bar"></span>
			        </button>
				</div>
				<div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="img/blurred-image-1.jpg">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="../index.html">回到首页</a>
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
			<div class="page-header-image" style="background-image:url(img/banner-bg.jpg)"></div>
			<div class="content">
				<div class="container">
					<div class="col-md-4 ml-auto mr-auto">
						<div class="card card-login card-plain">
							<form class="form" method="" action="">
								<div class="card-header text-center">
									<div class="logo-container">
										<img src="img/now-logo.png" alt="">
									</div>
								</div>
								<div class="card-body">
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input type="text" class="form-control" placeholder="请输入手机号">
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input type="text" class="form-control" placeholder="请输入姓名">
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
						                    </span>
										</div>
										<input type="text" placeholder="请输入密码" class="form-control" />
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons ui-1_lock-circle-open"></i>
						                    </span>
										</div>
										<input type="text" placeholder="请确认密码" class="form-control" />
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">
						                      <i class="now-ui-icons users_single-02"></i>
						                    </span>
										</div>
										<input type="text" class="form-control" placeholder="请输入身份证">
									</div>
									<div style="margin-left:10px;"><input type="checkbox" checked name="checkbox" class="bootstrap-switch" size="5" data-on-label="男" data-off-label="女" /></div>

									<!--<div style="margin-left: 150px;"><input type="radio" >管理员  <input type="radio" >用户	</div>-->

								</div>
								<div class="card-footer text-center">
									<a href="#pablo" class="btn btn-primary btn-round btn-lg btn-block">注册</a>

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
							</form>
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
		<script src="js/core/jquery.min.js" type="text/javascript"></script>
		<script src="js/core/popper.min.js" type="text/javascript"></script>
		<script src="js/core/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/plugins/bootstrap-switch.js"></script>
		<script src="js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
	</body>

</html>