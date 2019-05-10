<%@page import="evil.devil.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="evil.devil.dao.impl.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="../fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#select>[type=button]").click(function() {
			alert("hello");
			var way = $(this).attr("name");
			alert(way);
			$.ajax({
				type : "post",
				url : "DepartSelect",
				async : true, //异步
				data : 'way=' + way,
				dataType : "text",
				success : function(data) {
					alert(data);
					window.location = "departManegeMain.jsp";
				}

			});
		})
		
		
		
		//判断姓名是否符合格式
		var flagname = false;
		//判断密码是否符合格式
		var flagcolleage = false;
		//判断身份证是否符合格式
		var flagprice = false;
		//判断手机号是否符合格式
		var flagtel = false;

		
		//验证姓名格式
		$('#name').blur(function() {
			var name = $(this).val();
			//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
			var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
			//格式错误
			if (reg.test(name) == false) {
				flagname = false;
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
			}
			else {
				flagname = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
			}
		})

		
		
		//验证手机号格式
		$('#tel').blur(function() {
			var tel = $(this).val();
			//手机号正则
			var reg = /^1[34578]\d{9}$/;
			//格式错误
			if (reg.test(tel) == false) {
				flagtel = false;
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
			}
			//格式正确
			else {
				flagtel = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
			}
		})

		//验证價格格式
	
					$('#price').blur(
						function() {
							var price = $(this).val();
							//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
							var reg = /^[0-9]{1,3}$/;
							//格式错误
							if (reg.test(price) == false) {
								flagprice = false;
								$(this).removeClass("is-valid");
								$(this).addClass("is-invalid");
							}
							//格式正确
							else {
								flagprice = true;
								$(this).removeClass("is-invalid");
								$(this).addClass("is-valid");
							}
						})

		//验证大学格式
		$('#colleage').blur(function() {
			var colleage = $('#colleage').val();
			//只能是中文4-10个字
			var reg = /^[\u4e00-\u9fa5]{3,10}$/;
			//格式错误
			if (reg.test(colleage) == false) {
				flagcolleage = false;
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
			}
			//格式正确
			else {
				flagcolleage = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
			}
		})
		
		
			//验证大学格式
		$('#type').blur(function() {
				$(this).addClass("is-valid");
		})
		
		
		$('#gender').blur(function() {
				$(this).addClass("is-valid");
		})
		
		
		$('#depart')on("change",function() {
			
			alert($(this).find(':selected').val());
			
		})
		
		
	
		
		
			
			$(document).ready(function(){
				var departid=$('body').attr("id");
				alert(departid);
				$("#depart>option:eq("+departid+")").attr("selected");
			})
		
	})
</script>



<meta charset="UTF-8">
<title>医生修改</title>

		<style type="text/css">
			.my {
				font-size: .8rem;
				border-radius: 10rem;
			}
		</style>

	</head>
<%Doctor doctor=new DoctorMapperImpl().selectByPrimaryKey(Integer.parseInt(request.getParameter("id"))) ;%>
	<body class="bg-gradient-primary" id="<%=doctor.getDepartmentId()%>">

		<div class="container">


			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block "><img src="../images/d<%=doctor.getId()%>.JPG" height="620px" /></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">添加/修改医生信息</h1>
								</div>
								<form class="user">
									<div class="form-group row">
										<div class="col-sm-7 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user " id="name" placeholder="请输入医生姓名"  value='<%=doctor.getName()%>'>
										
											<br />
											<input type="text" class="form-control form-control-user" id="type" placeholder="请输入医生类型"  value='<%=doctor.getType()%>'>
										</div> 
										<div class="col-sm-4 ml-auto">
											
								
											<select class="form-control my " id="depart">
												<option disabled selected value="0">请选择所属科室</option>
												<option value="1">内科</option>
												<option  value="2">外科</option>
												<option  value="3">神经科</option>
											</select>
								
							
											<select  class="form-control my" id="gender">
											<!--	<option selected="selected" class="try">请选择性别</option>  -->
											<%if (doctor.getGender().equals("男")){%>
												<option selected="selected">男</option>
												<option>女</option>
												<%}else if (doctor.getGender().equals("女")){%>
												<option >男</option>
												<option selected="selected">女</option>
												<%}%>
											</select>
										</div>
									</div>
									
									
									
									
										

									<div class="form-group">

										<input type="text" class="form-control form-control-user" id="tel" placeholder="请输入电话"  value='<%=doctor.getTel()%>'>
									</div>

									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user" id="colleage" placeholder="请输入毕业院校" value='<%=doctor.getColleage()%>'>
										</div>
										<div class="col-sm-6">
											<input type="text" class="form-control form-control-user" id="price"  value='<%=doctor.getPrice()%>' placeholder="请输入门诊价格">
										</div>
									</div>
									<hr>

									<a href="login.html" class="btn btn-primary btn-user btn-block">
										添加医生
									</a>
									<a href="login.html" class="btn btn-warning btn-user btn-block">
										修改医生
									</a>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="forgot-password.html">查看所有医生</a>
								</div>
								<div class="text-center">
									<a class="small" href="login.html">查看所有科室</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Bootstrap core JavaScript-->
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="../js/sb-admin-2.min.js"></script>

	</body>
</html>