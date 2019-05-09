<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<base href="<%=basePath%>">
	
	<title>Home</title>
	
	<!-- for-mobile-apps -->
	<!--/metadata -->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //for-mobile-apps -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
	<!-- for banner css -->
	 
	<!-- //for banner css -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/wickedpicker.css" rel="stylesheet" type='text/css' media="all" />  <!-- time-picker-CSS -->
	<!-- <link href="http://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet"> -->
	<!--//fonts-->
	 <script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            $(function(){
            	$(".time").hide();
                $("#country1").change(function(){
                    $("#country2").empty();
                    $("#time option:first").prop("selected", 'selected');
                    $("#country2").append("<option value='0'>请选择医生</option>"); 
                    var doctors=${sessionScope.doctors};
                    doctors.forEach(function(doctor) {
                        if(doctor.departmentId==$("#country1").val()){
                        	$("#country2").append("<option value='"+doctor.id+"'>"+doctor.type+" "+doctor.name+"</option>");   
                        }
                     })
                     if($("#country2").val()=="0")
                     	$(".time").hide();
                });
                
                $("#reseve").click(function(){
                	var json={};
        			json.name=$("#name").val();
        			json.tel=$("#tel").val();
        			json.doctor_id=$("#country2").val();
        			json.datetime=$("#datepicker").val()+" "+$("#time").val()+":00";
        			/* alert(json.username);
        			alert(json.tel);
        			alert(json.doctor_id);
        			alert(json.datetime); */
        			 $.ajax({
        				type: "post",
        				url: "reserve",
        				data: json,
        				dataType: "text", 
        				contentType: "application/x-www-form-urlencoded; charset=utf-8",
        				success: function(data) {
        					if(data=="success"){
        						alert("预约成功");
        						location.reload();
        					}
        					else if(data="error"){
        						alert("预约失败");
        					}
        				},
        				error: function() {
        					alert("无法连接服务器");
        				}
        			}); 
                })
                
                $("#country2").change(function(){
					$("#time option:first").prop("selected", 'selected'); 
                    if($("#country2").val()=="0")
                    	$(".time").hide();
                	datetime();
                })
                 $("#datepicker").change(function(){
                	datetime();
                })
            });
            
            function datetime(){
           	 if($("#datepicker").val()!="" && $("#country2").val()!="0"  ){
           		 $("option").show();
           		var json={};
           		 json.id=$("#country2").val();
           		 json.date=$("#datepicker").val();
           		 $.ajax({
        				type: "post",
        				url: "datetime",
        				data: json,
        				dataType: "text", 
        				contentType: "application/x-www-form-urlencoded; charset=utf-8",
        				success: function(data) {
        					/* $.each(data,function(index,item){
        						var s1=json[index];
        							alert(s1);
        						}); */
        						var json=eval(data);
        						$.each(json,function(index,item){
        							var s1=json[index];
        							$("#t"+s1).hide();
        							});
        				},
        				error: function() {
        					alert("无法连接服务器");
        				}
        			}); 
           	}                		
           }
        </script>

</head>
<body>
<div class="banner-top">
	<div class="banner-header">
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
						<h1><a href="index.html">MediBulk</a></h1>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.html">Home</a></li>
							<li><a href="about.html">About Us</a></li>
							<li><a href="services.html">Our Services</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-hover="Pages" data-toggle="dropdown">Short Codes <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="icons.html">Icons</a></li>
										<li><a href="typography.html">Typography</a></li>
									</ul>
							  </li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
		<!--//header-->
</div>

<!-- slider -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
			<li data-target="#myCarousel" data-slide-to="4" class=""></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active"> 
				<div class="banner-dott">
				<div class="container">
					<div class="carousel-caption">
						<h3>We provide best medical services</h3>
						<div class="contrast">
							  <p> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>
						 </div>
					</div>
				</div>
				</div>
			</div>
			<div class="item item1"> 
				<div class="banner-dott">
				<div class="container">
					<div class="carousel-caption">
						<h3>We provide best dental services</h3>
						<div class="contrast">
							  <p> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>
						 </div>
					</div>
				</div>
				</div>
			</div>
			<div class="item item2"> 
				<div class="banner-dott">
				<div class="container">
					<div class="carousel-caption">
						<h3>We provide best baby services </h3>
						  <div class="contrast">
							  <p> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>
						  </div>
					</div>
				</div>
				</div>
			</div>
			<div class="item item3"> 
				<div class="banner-dott">
				<div class="container">
					<div class="carousel-caption">
						 <h3>We provide top doctors</h3>
						 
						  <div class="contrast">
							  <p> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>
						  </div>
					</div>
				</div>
				</div>
			</div>
			
			<div class="item item4"> 
				<div class="banner-dott">
				<div class="container">
					<div class="carousel-caption">
						 <h3>Food is our common ground </h3>
						  
						  <div class="contrast">
							  <p> Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>
						  </div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
    </div> 
	<div class="agileits_reservation">
						<div class="cuisine"> 
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<input type="text" id="name" name="Location" placeholder="请输入姓名" required="" value="${user.name}" disabled="disabled">
						</div>
						<div class="phone_email"> 
							<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
							<input type="text" id="tel" name="Phone" placeholder="请输入手机号码" required=""  value="${user.tel}" disabled="disabled"> 
						</div>
						<div class="phone_email1"> 
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							<select id="country1" class="frm-field sect" required>
									<option id="" value="0" >请选择科室</option>
									<c:forEach items="${departments}" var="department" varStatus="loop">
									<option value="${department.id}">${department.name}</option>
									</c:forEach>
								</select> 
						</div>
						<div class="clearfix"> </div>
						<div class="agileits_reservation_grid">
							<div  class="span1_of_1 book_date"> 
								<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								<input class="date" id="datepicker"  name="Text" placeholder="选择 日期"  type="text" required="">
								
							</div>
							<div class="span1_of_1 section_room"> 
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>  
								<select id="time" class="frm-field sect" required name="qqq">
									<option id="t0" value="0">选择就诊时间</option>
									<option class="time"  id="t8" value="8">8：00-9：00</option> 
									<option class="time" id="t9" value="9">9：00-10：00</option>        
									<option class="time" id="t10" value="10">10：00-11:00</option>         
									<option class="time" id="t11" value="11">11：00-12:00</option>          
									<option class="time" id="t14" value="14">14：00-15:00</option>
									<option class="time" id="t15" value="15">15：00-16：00</option>         
									<option class="time" id="t16" value="16">16：00-17:00</option>
								</select> 
							</div>
							<div class="span1_of_1 section_room">
								<!-- start_section_room --> 
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								<select  id="country2" class="frm-field sect" required name="qqq">
									<option id="" value="0">请选择医生</option>
								</select> 
							</div>  
							<div class="clearfix"></div>
							
							
						</div>
						<div class="date_btn"> 
							<button id="reseve">预约</button> 
						</div> 
					</div>
				</div>
 </div>
	<!-- //slider -->
<!-- // banner -->

<!-- /About -->
	<div class="w3-about about-gap" id="about">
		<div class="container">
			<div class="w3-heading-all">
				<h3>About us</h3>
			</div>
		<div class="w3-about-grids">
				<div class="col-md-6 w3-about-left-grid">
					<div class=" w3-about-left-grid-inner-head">
						<i class="fa fa-microphone" aria-hidden="true"></i>
						<h3>Lets Talk about Hospitality</h3>
					</div>
					<div class=" w3-about-left-grid-inner2-head">
						<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida, ante egestas egestas vulputate, elit risus maximus mauris, non gravida arcu justo eget est. Cras eu mauris nisl. Maecenas ut scelerisque metus.</h3>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-6 w3-about-right-grid">
						<div class="col-md-8 w3-about-right-text1">
							<h5>Lorem ipsum 109</h5>
							<h4>Specialist1</h4>
							<h3>Ut sed augue porttitor, vehicula eros in, vehicula elit. Aliquam ut ex aliquam risus vestibulum hendrerit.</h3>
				
						</div>
						<div class="col-md-4 w3-about-right-img1">
								<img src="images/a11.jpg" alt="img" />
						</div>
						<div class="clearfix"></div>
						<div class="col-md-8 w3-about-right-text1">
							<h5>Dunke alpha 212</h5>
							<h4>Specialist2</h4>
							<h3>Ut sed augue porttitor, vehicula eros in, vehicula elit. Aliquam ut ex aliquam risus vestibulum hendrerit.</h3>
						</div>
						<div class="col-md-4 w3-about-right-img1">
								<img src="images/a121.jpg" alt="img" />
						</div>
						<div class="clearfix"></div>
						<div class="col-md-8 w3-about-right-text1">
							<h5>Monst ibram 143</h5>
							<h4>Specialist3</h4>
							<h3>Ut sed augue porttitor, vehicula eros in, vehicula elit. Aliquam ut ex aliquam risus vestibulum hendrerit.</h3>
						</div>
						<div class="col-md-4 w3-about-right-img1">
							<img src="images/a13.jpg" alt="img" />
						</div>
						<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
		</div>
		</div>
	</div>
	<!-- //About -->
<!-- /services -->
<div class="services" id="services">
	<div class="container">
		<div class="w3-heading-all services-head">
			<h3>Services</h3>
		</div>	

		<div class="w3-services-grids">
			<div class="col-md-4 w3-services-grids1">
			<div class="w3-services-grid1">
				<i class="fa fa-user-md" aria-hidden="true"></i>
				<h3> Special Team</h3>
				<div class="w3-services-grid1-left">
					<h4>10 </h4>
					<p>ipsum</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>5</h4>
					<p>basusx</p>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<div class="col-md-4 w3-services-grids1 ">
			<div class=" w3-services-grid2">
		<i class="fa fa-laptop" aria-hidden="true"></i>
				<h3>Qualified Doctors</h3>
			<div class="w3-services-grid1-left">
					<h4>20 </h4>
					<p>basus</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>10</h4>
					<p>basus</p>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<div class="col-md-4 w3-services-grids1">
			<div class=" w3-services-grid3">
			<i class="fa fa-hospital-o" aria-hidden="true"></i>
				<h3>Special sergery</h3>
			<div class="w3-services-grid1-left">
					<h4>15 </h4>
					<p>mpsum</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>20</h4>
					<p>rasus</p>
				</div>
				<div class="clearfix"></div>
		
			</div>
			</div>
			
			<div class="clearfix"></div>
			<div class="w3-services-grid-bottom">
			<div class="col-md-4 w3-services-grids1">
			<div class="w3-services-grid4">
							<i class="fa fa-heartbeat" aria-hidden="true"></i>
				<h3>Cardiac Clinic</h3>
				<div class="w3-services-grid1-left">
					<h4>25 </h4>
					<p>ipsum</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>30</h4>
					<p>basusx</p>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<div class="col-md-4 w3-services-grids1">
			<div class=" w3-services-grid5">
							<i class="fa fa-flask" aria-hidden="true"></i>
				<h3>Pediatric Clinic</h3>
				<div class="w3-services-grid1-left">
					<h4>35</h4>
					<p>ipsum</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>25</h4>
					<p>basusx</p>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<div class="col-md-4 w3-services-grids1">
			<div class=" w3-services-grid6">
							<i class="fa fa-ambulance" aria-hidden="true"></i>
				<h3>Emergency Help</h3>
				<div class="w3-services-grid1-left">
					<h4>40 </h4>
					<p>ipsum</p>
				</div>
				<div class="w3-services-grid1-right">
				<h4>45</h4>
					<p>basusx</p>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			
			<div class="clearfix"></div>
		</div>
		</div>
</div>
</div>
<!-- //services -->
<!-- testimonials -->
	<div class="testimonials" id="testimonials">
		<div class="container">
		<div class="w3-heading-all">
			<h3>Testimonials</h3>
		</div>
			<div class="w3ls_testimonials_grids">
				 <section class="center slider">
						<div class="agileits_testimonial_grid">
							<div class="w3l_testimonial_grid">
								<p>In eu auctor felis, id eleifend dolor. Integer bibendum dictum erat, 
									non laoreet dolor.</p>
								<h4>Rosy Crisp</h4>
								<h5>Student</h5>
								<div class="w3l_testimonial_grid_pos">
									<img src="images/tm1.jpg" alt=" " class="img-responsive" />
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
									<img src="images/tm2.jpg" alt=" " class="img-responsive" />
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
									<img src="images/tm3.jpg" alt=" " class="img-responsive" />
								</div>
							</div>
						</div>
				</section>
			</div>
		</div>
	</div>
<!-- //testimonials -->
<!-- footer -->
<div class="footer">
	<div class="container">
	<div class="footer_agile_inner_info_w3l">
		<div class="col-md-4 footer-left">
			<h2><a href="index.html">MediBulk </a></h2>
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
						 <li><a href="index.html" class="active">Home</a></li>
        <li><a href="about.html" >About</a></li>
        <li><a href="services.html"> Services</a></li>
		<li><a href="gallery.html">Portfolio</a></li>
		<li><a href="contact.html">Contact</a></li>
						
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
								<p>Broome St, NY 10002,California, USA. 
								
								</p>
							</div>
							
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
				
		
		<div class="clearfix"></div>
			
		<p class="copy-right">Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
	</div>
</div>
</div>
<!-- //footer -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
			<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
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


			<script src="js/SmoothScroll.min.js"></script>
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
<!-- Time select -->
				<script type="text/javascript" src="js/wickedpicker.js"></script>
				<script type="text/javascript">
					$('.timepicker').wickedpicker({twentyFour: false});
				</script>
				<!-- //Time select -->
				<!-- Calendar -->
				<link rel="stylesheet" href="css/jquery-ui.css" />
				<script src="js/jquery-ui.js"></script>
				  <script>
						  $(function() {
							$( "#datepicker" ).datepicker();
						  });
				  </script>
				<!-- //Calendar -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 

</body>
</html>