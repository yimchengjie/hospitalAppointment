<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
                $("#country1").change(function(){
                    $("#country2").empty();
                    console.log($("#country1").val());
                    if($("#country1").val()=="1")
                    {
                        var txt1=" <option >沈阳市</option>"; 
                        var txt2=" <option >大连市</option>";  
                        var txt3=" <option >北京市</option>";

                        $("#country2").append(txt1,txt2,txt3);   
                    }
                    else if($("#country1").val()=="2")
                    {
                        var txt1=" <option >济南市</option>"; 
                        var txt2=" <option >济宁市</option>";  
                        var txt3=" <option >天津市</option>";

                        $("#country2").append(txt1,txt2,txt3);   
                    }
                    else if($("#country1").val()=="3")
                    {
                        var txt1=" <option >火星</option>"; 
                        var txt2=" <option >彗星星</option>";  
                        var txt3=" <option >M78星云</option>";

                        $("#country2").append(txt1,txt2,txt3);   
                    }else
                    {
                        $("#country2").append("<option>请选择医生</option>");   
                    }
                });
            });
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
						<h1><a href="index.jsp">MediBulk</a></h1>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">主页</a></li>
							<li><a href="about.jsp">关于我们</a></li>
							<li><a href="services.jsp">服务</a></li>
							<li><a href="gallery.jsp">展览</a></li>
							<li><a href="doctorDepartment.jsp">医生</a></li>
							
							<!-- <li><a href="#">个人资料</a></li> -->
							
							<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-hover="Pages" data-toggle="dropdown">个人资料 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#" data-toggle="modal" data-target="#myModal">个人信息</a></li>
										<li><a href="#" data-toggle="modal" data-target="#Historical">病历账单</a></li>
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
					<form action="#" method="post">
						<div class="cuisine"> 
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<input type="text" name="Location" placeholder="请输入姓名" required="">
						</div>
						<div class="phone_email"> 
							<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
							<input type="text" name="Phone" placeholder="请输入手机号码" required=""> 
						</div>
						<div class="phone_email1"> 
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							<select id="country1" class="frm-field sect" required>
									<option id="" >请选择科室</option>
									<option value="1">外科</option>
									<option value="2">内科</option>         
									<option value="3">皮肤科</option>
								</select> 
						</div>
						<div class="clearfix"> </div>
						<div class="agileits_reservation_grid">
							<div  class="span1_of_1 book_date"> 
								<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								<input class="date" id="datepicker" name="Text" placeholder="选择 日期"  type="text" required="">
							</div>
							<div class="span1_of_1 section_room"> 
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>  
								<select id="Time"  >
									<option id="" >请选择时间</option>
									<option value="1">9：00-9：30</option>
									<option value="2">9：30-10：00</option>         
									<option value="3">10：00-10:30</option>
									<option value="4">10：30-11：00</option>         
									<option value="5">11：00-11:30</option>
									<option value="6">13：30-14：00</option>         
									<option value="7">14：00-14:30</option>
									<option value="8">14：30-15：00</option>         
									<option value="9">15：00-15:30</option>
									<option value="10">15：30-16：00</option>         
									<option value="11">16：00-16:30</6option>
									<option value="12">16：30-17：00</option> 
								</select>
								<!-- <input type="text" name="Time" class= value="选择时间">	 --> 
							</div>
							<div class="span1_of_1 section_room">
								<!-- start_section_room --> 
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								<select id="country2" class="frm-field sect" required name="qqq">
									<option id="">请选择医生</option>
								</select> 
							</div>  
							<div class="clearfix"></div>
							
							
						</div>
						<div class="date_btn" style="margin:20 150;"> 
							<input type="button" data-toggle="modal" data-target="#resever" class="btn btn-info btn-lg" value="预  约" style="width:200px;"/> 
						</div> 
					</form>
				</div>
 </div>
	<!-- //slider -->
<!-- // banner -->

<!-- /About -->


 	<div class="w3-about about-gap" id="about">
		<div class="container">
			<div class="w3-heading-all">
				<h3>优质专家</h3>
			</div>
		<div class="w3-about-grids">
				<div class="col-md-6 w3-about-left-grid">
				
				<!-- 更换图片在style.css的716行 -->
				
					<div class=" w3-about-left-grid-inner-head">
					<!-- <img src="images/ab33.jpg" alt="img" /> -->
						<!-- <i class="fa fa-microphone" aria-hidden="true"></i> -->
						<!-- <h3>Lets Talk about Hospitality</h3> -->
					</div>
					<div class=" w3-about-left-grid-inner2-head">
						<h3>　百廿初心不变，百廿征程再启。伴着党的十九大的温暖春风，随着健康中国建设的有力号角，浙江水利水电医院不忘初心，牢记使命，勇于担当。新时代奋进的征程中，浙江水利水电医院将在浙江省委、省政府和省卫计委的坚强领导下，高举伟大旗帜，踏上伟大征程，实现伟大梦想，努力创建“与国际接轨的国家级名院”，续写浙江水利水电医院更加辉煌灿烂的明天。</h3>
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
						<div class="col-md-8 w3-about-right-text1">
							<h5>Monst ibram 143</h5>
							<h4>Specialist4</h4>
							<h3>Ut sed augue porttitor, vehicula eros in, vehicula elit. Aliquam ut ex aliquam risus vestibulum hendrerit.</h3>
						</div>
						<div class="col-md-4 w3-about-right-img1">
						
							<img src="images/a13.jpg" alt="img" />
							
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
			<h3>我们是您最正确的选择</h3>
		</div>	

		<div class="w3-services-grids">
			<div class="col-md-4 w3-services-grids1">
			<div class="w3-services-grid1">
				<i class="fa fa-user-md" aria-hidden="true"></i>
				<h3> 专业团队</h3>
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
				<h3>优秀的医生</h3>
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
				<h3>专业诊室</h3>
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
				<h3>心脏门诊</h3>
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
				<h3>儿科门诊</h3>
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
				<h3>紧急救援</h3>
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
<!--  
testimonials
	<div class="testimonials" id="testimonials">
		<div class="container">
		<div class="w3-heading-all">
			<h3>致谢信</h3>
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
	-->
	
	
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
												  <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
														</ul>
		</div>
		<div class="col-md-4 footer-right">
			<div class="sign-grds">
				<div class="sign-gd">
					<h4>Information </h4>
					<ul>

						 <!-- <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="about.jsp" >About</a></li>
        <li><a href="services.jsp"> Services</a></li>
		<li><a href="gallery.jsp">Portfolio</a></li>
		<li><a href="contact.jsp">Contact</a></li> -->
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
模态框
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">个人资料</h4>
						</div>
						<div class="modal-body">
							<form>
								<div class="form-group">
									<label for="username"><span class="glyphicon glyphicon-user"></span>用户姓名</label>
									<input type="text" class="form-control" id="username" placeholder="用户姓名">
								</div>
								<div class="form-group">
									<label for="userphone"><span class="glyphicon glyphicon-earphone"></span>手机号码</label>
									<input type="text" class="form-control" id="userphone" placeholder="电话">
								</div>
								<div class="form-group">
									<label for="sex">性别</label>
									<input type="text" class="form-control" id="userphone" placeholder="性别">
								</div>
								<div class="form-group">
									<label for="usercard">身份证号码</label>
									<input type="text" class="form-control" id="usercard" placeholder="身份证号码" />
								</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">修改</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="Historical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">历史病历</h4>
						</div>
						<div class="modal-body">
							<div class="panel panel-primary">
								<div class="panel-heading"><span class="glyphicon glyphicon-time"></span>日期1</div>
								<div class="panel-body">
									Panel content
								</div>
							</div>

							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title"><span class="glyphicon glyphicon-time"></span>日期2</h3>
								</div>
								<div class="panel-body">
									Panel content
								</div>
							</div>
							
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title"><span class="glyphicon glyphicon-time"></span>日期3</h3>
								</div>
								<div class="panel-body">
									Panel content
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="resever" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">請付款</h4>
						</div>
						<div class="modal-body"><img src="images/pay.jpg"></div>
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