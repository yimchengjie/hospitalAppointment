<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gallery</title>
<!-- for-mobile-apps -->
<!--/metadata -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
	<!--gallery -->
	<link type="text/css" rel="stylesheet" href="../css/cm-overlay.css" />
	<!-- //gallery -->
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- <link href="http://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet"> -->
<!--//fonts-->
<script src="../js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/user.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		//模态框修改按钮
        		$("#confirmEdit")
        				.click(
        						function() { //直接传递到后台，返回是刷新的
        							var json = {};
        							json.id = ${user.id};
        							json.username = $("#Pname").val();
        							json.userpwd = $("#pwd").val();
        							json.gender = $("[name=gender]:checked").val();
        							json.idcard = $("#idcard").val();
        							json.tel = $("#Ptel").val();
        							/*		var username = $(".modal-body input").eq(0).attr("value");
        									var userpwd = $(".modal-body input").eq(1).attr("value");
        									var idcard = $(".modal-body input").eq(4).attr("value");
        									var phone = $(".modal-body input").eq(5).attr("value");
        									var id = $(".modal-body input").eq(6).attr("value");//得到id*/
        							$.ajax({
        										type : "post",
        										url : "update",
        										data : json,
        										dataType : "text",
        										contentType : "application/x-www-form-urlencoded; charset=utf-8",
        										success : function(data) {
        											if (data == "success") {
        												alert("修改成功");
        											} else if (data == "erroridcard") {
        												alert("修改失败,该身份证号存在");
        											} else if (data == "errortel") {
        												alert("修改失败,该手机号存在");
        											}
        											window.location = "index.jsp";
        										},
        										error : function() {
        											alert("无法连接服务器");
        										}
        									});

        						})
	})
	
	</script> 
</head>
	
<body>

<div class="banner-header banner2">
	<div class="banner-dott1">
		<!--header-->
		<div class="header">
		<div class="container-fluid">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="w3_navigation_pos">
						<h1><a href="index.jsp">MediBulk</a></h1>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">主页</a></li>
							<li><a href="about.jsp">关于我们</a></li>
							<li><a href="services.jsp">服务</a></li>
							<li class="active"><a href="gallery.jsp">展览</a></li>
							<li><a href="doctorDepartment.jsp">医生</a></li>
							<!-- <li><a href="#">个人主页</a></li> -->
							
							<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-hover="Pages" data-toggle="dropdown">个人资料 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#" data-toggle="modal" data-target="#editModel">个人信息</a></li>
										<li><a href="#" data-toggle="modal" data-target="#Historical">病历账单</a></li>
										<li><a href="logout">退出登录</a></li>
									</ul>
							  </li> 
							  
							<li><a href="contact.jsp">联系</a></li>
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
		<!--//header-->
	</div>
</div>
<!-- // banner -->
<div class="section-w3ls agileits-gallery" id="portfolio">
	<div class="w3-heading-all">
				<h3>Our gallery</h3>
			</div>
		<div class="gallery-w3layouts">
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g1.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g1.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g2.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g2.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven </p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g3.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g3.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g4.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g4.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g5.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g5.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g8.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g8.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g7.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g7.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="col-sm-3 w3_tab_img_left">
				<div class="demo">
					<a class="cm-overlay" href="../images/g6.jpg">
						<figure class="imghvr-shutter-in-out-diag-2">
							<img src="../images/g6.jpg" alt=" " class="img-responsive" />
						</figure>
					</a>
				</div>
				<div class="agile-gallery-info">
					<h5>MediBulk</h5>
					<p>we are innovation driven</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //menu -->

<!-- footer -->
<div class="footer">
	<div class="container">
	<div class="footer_agile_inner_info_w3l">
		<div class="col-md-4 footer-left">
			<h2><a href="index.jsp">MediBulk </a></h2>
			<p>Lorem ipsum quia dolor
			sit amet, consectetur, adipisci velit, sed quia non 
			numquam eius modi tempora.</p>
			<ul class="social-nav model-3d-0 footer-social w3_agile_social two">
															<li><a href="#" class="facebook">
																  <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="twitter"> 
																  <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="instagram">
																  <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="pinterest">
																  <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
														</ul>
		</div>
		<div class="col-md-4 footer-right">
			<div class="sign-grds">
				<div class="sign-gd">
					<h4>Information </h4>
					<ul>
						 <li><a href="index.jsp" class="active">主页</a></li>
        <li><a href="about.jsp" >关于我们</a></li>
        <li><a href="services.jsp">服务</a></li>
		<li><a href="gallery.jsp">照片</a></li>
		<li><a href="contact.jsp">联系</a></li>
						
					</ul>
				</div>
				</div>
			</div>
				<div class="col-md-4 sign-gd-two">
					<h4>Address</h4>
					<div class="w3-address">
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-phone" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Phone Number</h6>
								<p>+1 234 567 8901</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Email Address</h6>
								<p>Email :<a href="mailto:example@email.com"> mail@example.com</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-map-marker" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Location</h6>
								<p>Shuili St, NY 58888,HangZhou, China.
								
								</p>
							</div>
							
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
				
		
		<div class="clearfix"></div>
			
		<p class="copy-right">Copyright &copy; 2019.ZheJiangShuilishuidian Hospital.</a></p>
	</div>
</div>
</div>
<!-- //footer -->
<!-- 模态框1 -->
<div class="modal fade" id="Historical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">历史病历</h4>
						</div>
						
						<div class="modal-body" style="height:600px;overflow-y:auto;">
							<c:forEach items="${accounts}" var="account" varStatus="loop">
								<div class="panel panel-primary">
									<div class="panel-heading"><span class="glyphicon glyphicon-time">${account.dateTime}</span></div>
									<div class="panel-body">
									<span class="glyphicon glyphicon-home">${accountDepartments[loop.count-1].name}</span>
									<span class="glyphicon glyphicon-education">${accountDoctors[loop.count-1].type}</span>
										<span class="glyphicon glyphicon-user">${accountDoctors[loop.count-1].name}</span>
									 <button name="reserveAgin" class="btn btn-primary" data-dismiss="modal">再次预约</button>
									 </div>
								</div>
									
							</c:forEach>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
<!-- 模态框1 -->		
<!-- 模态框2 -->	
			<div class="modal fade" id="editModel" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">修改操作</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">

							<form>
								<div class="form-group" style="height: 40px;">
									<label class="control-label">姓名:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 150px;" type="text"
											class="form-control" id="Pname" value="${user.name}">
									</div>
								</div>

								<div class="form-group" style="height: 40px;">
									<label class="control-label">密码:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 150px;" type="password"
											class="form-control" id="pwd" value="${user.password}">
											<span class="glyphicon glyphicon-eye-open" id="passwordsee"></span>
									</div>
								</div>
		
								<div class="form-group" style="height: 40px;">
									<label class="control-label"> 性别:</label>
									<div style="display: inline; width: 200px;">
										<label class="radio-inline"> <input type="radio"
											name="gender" id="inlineRadio1" value="男" ${user.gender=="男"?"checked='checked'":false}  >
											男
										</label> <label class="radio-inline"> <input type="radio"
											name="gender" id="inlineRadio2" value="女" ${user.gender=="女"?"checked='checked'":false}  > 女
										</label>
									</div>
								</div>

								<div class="form-group " style="height: 40px;">
									<label for="message-text" class="control-label ">身份证号:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 300px;" type="text"
											class="form-control" value="${user.idcard}" id="idcard">
									</div>
								</div>

								<div class="form-group" style="height: 40px;">
									<label for="message-text" class="control-label ">联系电话:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 300px;" type="text"
											class="form-control" value="${user.tel}" id="Ptel">
									</div>
								</div>

								<input type="text" class="form-control" id="id"
									style="visibility: hidden;">
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="closeEdit"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" id="confirmEdit"
								disabled="disabled">确认修改</button>
						</div>
					</div>
				</div>
			</div>
<!-- 模态框2 -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>

<!-- //gallery -->
	<script src="../js/jquery.tools.min.js"></script>
	<script src="../js/jquery.mobile.custom.min.js"></script>
	<script src="../js/jquery.cm-overlay.js"></script>

	<script>
		$(document).ready(function () {
			$('.cm-overlay').cmOverlay();
		});
	</script>
	<!-- //gallery -->

	<!-- //Tour-Locations-JavaScript -->
			<!-- <script src="../js/SmoothScroll.min.js"></script> -->
		<!-- smooth scrolling-bottom-to-top -->
				<script type="text/javascript">
					$(document).ready(function() {
					/*
						var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
						};
					*/								
					$().UItoTop({ easingType: 'easeOutQuart' });
					});
				</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
		<!-- //smooth scrolling-bottom-to-top -->
		<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 

</body>
</html>