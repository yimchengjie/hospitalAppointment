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
 <script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
           function changedoctor(doctor){
        	   $("#country2").children().each(function(i,n){
        		     var obj = $(n);
        		     if($.trim(obj.html()) == $.trim(doctor))
        		    	obj.attr("selected",true);
        		    }); 
           }
            //通过后台调取医生当天的预约显示未被预约的时间段
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
            
         	
            
            
          //绑定事件
        	$(function() {
        		
    		     //再次预约
        		$("[name=reserveAgin]").click(function(){
        			var json={};
             		json.department=$(this).parent().children().eq(0).html();
        			json.doctor=$(this).parent().children().eq(1).html();
        			 $.ajax({
         				type: "post",
         				url: "reserveAgin",
         				data: json,
         				dataType: "text", 
         				contentType: "application/x-www-form-urlencoded; charset=utf-8",
         				success: function(data) {
         					var json=eval(data);
         					/* $.each(json,function(index,item){
         						var s1=json[index].id;
         						var s2=json[index].name;
         						con=""+s1+" "+s2; 
         						$("#rightmessage").html($("#rightmessage").html()+con);
         						}); */
         					 $("#country1").children().each(function(i,n){
                   		     var obj = $(n);
                   		     if($.trim(obj.html()) == $.trim(json[0]))
                   		    	obj.attr("selected",true);
                   		     
                   		    }); 
         					$("#country2").children().each(function(i,n){
                      		     var obj = $(n);

                      		     if($.trim(obj.html()) == $.trim(json[0]))
                      		    	obj.attr("selected",true);
                      		    }); 
         					 $("#country1").change();
         						changedoctor(json[1]);
                      		     
         				},
         				error: function() {
         					alert("无法连接服务器");
         				}
         			}); 
             	})
             	
             	
             	$(".time").hide();
                $("#country1").change(function(){
                    $("#country2").empty();
                    $("#time option:first").prop("selected", 'selected');
                    $("#country2").append("<option value='0'>请选择医生</option>"); 
                    var doctors=${sessionScope.doctors};
                    doctors.forEach(function(doctor) {
                        if(doctor.departmentId==$("#country1").val()){
                        	$("#country2").append("<option value='"+doctor.id+"'>"+doctor.name+"</option>");   
                        }
                     })
                     if($("#country2").val()=="0")
                     	$(".time").hide();
                });
                
                $("#reserve").click(function(){
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
             	
        		$(".edit").click(
        				//转发到show的servlet上
        				//
        				function() {
        					alert($("#way").val());
        					var id = $(this).parent().parent().parent().children()
        							.eq(0).html();
        					var username = $(this).parent().parent().parent()
        							.children().eq(1).html();
        					var userpwd = $(this).parent().parent().parent().children()
        							.eq(2).html();
        					var gender = $(this).parent().parent().parent().children()
        							.eq(3).html();
        					var idcard = $(this).parent().parent().parent().children()
        							.eq(4).html();
        					var phone = $(this).parent().parent().parent().children()
        							.eq(5).html();
        					var age = $(this).parent().parent().parent().children().eq(
        							6).html();
        					//得到兄弟元素
        					$(".modal-body input").eq(0).attr("value", username);
        					$(".modal-body input").eq(1).attr("value", userpwd);
        					$(".modal-body input").eq(4).attr("value", idcard);
        					$(".modal-body input").eq(5).attr("value", phone);
        					$(".modal-body input").eq(6).attr("value", age);
        					$(".modal-body input").eq(7).attr("value", id);
        					if (gender == "女") {
        						$(".modal-body input").eq(3).attr("checked", true);
        					}

        				})

        		//判断姓名是否符合格式
        		var flagname = false;
        		//判断密码是否符合格式
        		var flagpwd = false;
        		//判断身份证是否符合格式
        		var flagidcard = false;
        		//判断手机号是否符合格式
        		var flagtel = false;

        		//验证姓名格式
        		$('#Pname').blur(function() {
        			var name = $(this).val();
        			//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
        			var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
        			//格式错误
        			if (reg.test(name) == false) {
        				flagname = false;
        				$(this).parent().parent().removeClass("has-success");
        				$(this).parent().parent().addClass("has-error");
        				$("#confirmEdit").attr("disabled", "disabled");
        			}
        			//格式正确
        			else {
        				flagname = true;
        				$(this).parent().parent().removeClass("has-error");
        				$(this).parent().parent().addClass("has-success");
        				if (flagpwd && flagtel && flagidcard) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})

        		//验证手机号格式
        		$('#Ptel').blur(function() {
        			var tel = $(this).val();
        			//手机号正则
        			var reg = /^1[34578]\d{9}$/;
        			//格式错误
        			if (reg.test(tel) == false) {
        				flagtel = false;
        				$(this).parent().parent().removeClass("has-success");
        				$(this).parent().parent().addClass("has-error");
        				$("#confirmEdit").attr("disabled", "disabled");
        			}
        			//格式正确
        			else {
        				flagtel = true;
        				$(this).parent().parent().removeClass("has-error");
        				$(this).parent().parent().addClass("has-success");
        				if (flagpwd && flagname && flagidcard) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})

        		//验证身份证号格式
        		$('#idcard').blur(
        						function() {
        							var idcard = $(this).val();
        							//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
        							var reg = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
        							//格式错误
        							if (reg.test(idcard) == false) {
        								flagidcard = false;
        								$(this).parent().parent().removeClass(
        										"has-success");
        								$(this).parent().parent().addClass("has-error");
        								$("#confirmEdit").attr("disabled", "disabled");
        							}
        							//格式正确
        							else {
        								flagidcard = true;
        								$(this).parent().parent().removeClass(
        										"has-error");
        								$(this).parent().parent().addClass(
        										"has-success");
        								if (flagpwd && flagname && flagtel) {
        									$("#confirmEdit").removeAttr("disabled");
        								}
        							}
        						})

        		//验证密码格式
        		$('#pwd').blur(function() {
        			var pwd = $('#pwd').val();
        			//密码---3-10位，不能以数字开头，只能是中文或者英文字符
        			var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{3,10}$/;
        			//格式错误
        			if (reg.test(pwd) == false) {
        				flagpwd = false;
        				$(this).parent().parent().removeClass("has-success");
        				$(this).parent().parent().addClass("has-error");
        				$("#confirmEdit").attr("disabled", "disabled");
        			}
        			//格式正确
        			else {
        				flagpwd = true;
        				$(this).parent().parent().removeClass("has-error");
        				$(this).parent().parent().addClass("has-success");
        				if (flagidcard && flagname && flagtel) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})

        		$("#closeEdit").click(function() {
        			$("#pwd").parent().parent().attr("class", "form-group");
        			$("#name").parent().parent().attr("class", "form-group");
        			$("#tel").parent().parent().attr("class", "form-group");
        			$("#idcard").parent().parent().attr("class", "form-group");
        		})

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
        											window.location = "jsp/index.jsp";
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
							
							<!-- <li><a href="#">个人资料</a></li> -->
							
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
									<option   value="${department.id}"> ${department.name}</option>
									<%-- <c:if test="${depatment!=null}">${depatment}</c:if> --%>
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
						<div class="date_btn" style="margin:20 150;"> 
							<input type="button" id="reserve" class="btn btn-info btn-lg" value="预  约" style="width:200px;"/> 
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
			<h2><a href="index.html">MediBulk </a></h2>
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
										<input style="display: inline; width: 150px;" type="text"
											class="form-control" id="pwd" value="${user.password}">
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
<%-- <div class="modal fade" id="editModel" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="exampleModalLabel">修改操作</h4>
				</div>

				<div class="modal-body" style="height: 400px;">
					<form>
						<div class="form-group" style="height: 40px;">
							<label for="recipient-name" class="control-label col-md-2">姓名:</label>
							<div class="col-md-10" style="width: 200px;">
								<input type="text" value="${user.name}" class="form-control" id="name" value="">
							</div>
						</div>

						<div class="form-group" style="height: 40px;">
							<label for="message-text" class="control-label col-md-2">密码:</label>
							<div class="col-md-10" style="width: 200px;">
								<input type="text" value="${user.password}" class="form-control" id="pwd" value="">
							</div>
						</div>

						<div class="form-group" style="height: 40px;">
							<label for="message-text" class="control-label col-sm-2">性别:</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio1" value="男" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio2" value="女"> 女
								</label>
							</div>
						</div>

						<div class="form-group " style="height: 40px;">
							<label for="message-text" class="control-label col-md-2">身份证号:</label>
							<div class="col-md-10" style="width: 300px;">
								<input type="text" value="${user.idcard}" class="form-control" id="idcard">
							</div>
						</div>

						<div class="form-group" style="height: 40px;">
							<label for="message-text" class="control-label col-md-2">联系电话:</label>
								<input type="text"  value="${user.tel}" class="form-control" id="tel">
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
	</div> --%>
	
	
	
			<div class="modal fade" id="Historical" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">历史病历</h4>
						</div>
						
						<div class="modal-body">
							<c:forEach items="${accounts}" var="account" varStatus="loop">
								<div class="panel panel-primary">
									<div class="panel-heading"><span class="glyphicon glyphicon-time">${account.dateTime}</span></div>
									<div class="panel-body">
									<span class="glyphicon glyphicon-home">${accountDepartments[loop.count-1].name}</span>
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