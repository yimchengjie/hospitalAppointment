<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Services</title>
<!--/metadata -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
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
							<li ><a href="about.jsp">关于我们</a></li>
							<li class="active"><a href="services.jsp">服务</a></li>
							<li><a href="gallery.jsp">展览</a></li>
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
<!-- offer-bottom -->
	<div class="banner-bottom">
		<div class="container">
		<div class="w3-heading-all">
				<h3>Special Services</h3>
			</div>
			<div class="col-md-4 w3l_services_footer_top_left">
				<img src="../images/sp5.jpg" alt=" " class="img-responsive" />
			</div>
			<div class="col-md-8 w3l_services_footer_top_right">
				<div class="w3l_services_footer_top_right_main">
					<div class="w3l_services_footer_top_right_main_l">
						<h3>20 January 2018</h3>
					</div>
					<div class="w3l_services_footer_top_right_main_l1">	
						<div class="w3ls_service_icon">
							<i class="fa fa-globe" aria-hidden="true"></i>
						</div>
					</div>
					<div class="w3l_services_footer_top_right_main_r">
						<a href="#" >Maximus pretium </a>
						<p>Morbi sollicitudin odio massa, et rutrum sem rutrum in. 
							Duis elementum turpis ultricies, finibus leo.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3l_services_footer_top_right_main">
					<div class="w3l_services_footer_top_right_main_l">
						<h3>25 January 2018</h3>
					</div>
					<div class="w3l_services_footer_top_right_main_l1">	
						<div class="w3ls_service_icon">
							<i class="fa fa-map" aria-hidden="true"></i>
						</div>
					</div>
					<div class="w3l_services_footer_top_right_main_r">
						<a href="#" >Aliquam faucibus </a>
						<p>Morbi sollicitudin odio massa, et rutrum sem rutrum in. 
							Duis elementum turpis ultricies, finibus leo.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3l_services_footer_top_right_main">
					<div class="w3l_services_footer_top_right_main_l">
						<h3>30 January 2018</h3>
					</div>
					<div class="w3l_services_footer_top_right_main_l1">	
						<div class="w3ls_service_icon">
							<i class="fa fa-pie-chart" aria-hidden="true"></i>
						</div>
					</div>
					<div class="w3l_services_footer_top_right_main_r">
						<a href="#">Vitae faucibus</a>
						<p>Morbi sollicitudin odio massa, et rutrum sem rutrum in. 
							Duis elementum turpis ultricies, finibus leo.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //offer-bottom -->
<!-- offer -->
	<div class="offer">
		<div class="container">
			<div class="w3ls_banner_bottom_grids">
				<div class="col-md-4 agile_offer_grid">
					<div class="agileits_w3layouts_offer_grid">
						<div class="agile_offer_grid_pos">
							<p>01.</p>
						</div>
					</div>
					<div class="wthree_offer_grid1">
						<h4>Operation Theatre </h4>
						<p class="w3_agileits_service_para">Praesent nec blandit lorem, et facilisis mi. Ut fringilla massa massa, 
							id consequat eros iaculis quis.</p>
					</div>
				</div>
				<div class="col-md-4 agile_offer_grid">
					<div class="agileits_w3layouts_offer_grid">
						<div class="agile_offer_grid_pos">
							<p>02.</p>
						</div>
					</div>
					<div class="wthree_offer_grid1">
						<h4>Outdoor Checkup </h4>
						<p class="w3_agileits_service_para">Praesent nec blandit lorem, et facilisis mi. Ut fringilla massa massa, 
							id consequat eros iaculis quis.</p>
					</div>
				</div>
				<div class="col-md-4 agile_offer_grid">
					<div class="agileits_w3layouts_offer_grid">
						<div class="agile_offer_grid_pos">
							<p>03.</p>
						</div>
					</div>
					<div class="wthree_offer_grid1">
						<h4>Cancer Service </h4>
						<p class="w3_agileits_service_para">Praesent nec blandit lorem, et facilisis mi. Ut fringilla massa massa, 
							id consequat eros iaculis quis.</p>
					</div>
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //offer -->
<!-- testimonials -->
	<div class="testimonials" id="testimonials">
		<div class="container">
		<div class="w3-heading-all">
			<h3>Testimonials</h3>
			<div class="w3ls_testimonials_grids">
				 <section class="center slider">
						<div class="agileits_testimonial_grid">
							<div class="w3l_testimonial_grid">
								<p>In eu auctor felis, id eleifend dolor. Integer bibendum dictum erat, 
									non laoreet dolor.</p>
								<h4>Rosy Crisp</h4>
								<h5>Student</h5>
								<div class="w3l_testimonial_grid_pos">
									<img src="../images/tm1.jpg" alt=" " class="img-responsive" />
								</div>
							</div>
						</div>
						<div class="agileits_testimonial_grid">
							<div class="w3l_testimonial_grid">
								<p>In eu auctor felis, id eleifend dolor. Integer bibendum dictum erat, 
									non laoreet dolor.</p>
								<h4>Laura Paul</h4>
								<h5>Student</h5>
								<div class="w3l_testimonial_grid_pos">
									<img src="../images/tm2.jpg" alt=" " class="img-responsive" />
								</div>
							</div>
						</div>
						<div class="agileits_testimonial_grid">
							<div class="w3l_testimonial_grid">
								<p>In eu auctor felis, id eleifend dolor. Integer bibendum dictum erat, 
									non laoreet dolor.</p>
								<h4>Michael Doe</h4>
								<h5>Student</h5>
								<div class="w3l_testimonial_grid_pos">
									<img src="../images/tm3.jpg" alt=" " class="img-responsive" />
								</div>
							</div>
						</div>
				</section>
			</div>
		</div>
	</div>
		</div>
<!-- //testimonials -->


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
	<!-- carousal -->
	<script src="../js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
		  $(".center").slick({
			dots: true,
			infinite: true,
			centerMode: true,
			slidesToShow: 2,
			slidesToScroll: 2,
			responsive: [
				{
				  breakpoint: 768,
				  settings: {
					arrows: true,
					centerMode: false,
					slidesToShow: 2
				  }
				},
				{
				  breakpoint: 480,
				  settings: {
					arrows: true,
					centerMode: false,
					centerPadding: '40px',
					slidesToShow: 1
				  }
				}
			 ]
		  });
		});
	</script>
<!-- //carousal -->

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