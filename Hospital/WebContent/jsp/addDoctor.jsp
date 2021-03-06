<%@page import="evil.devil.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="evil.devil.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		var photochange=false;
		//判断姓名是否符合格式
		var flagname = false;
		//判断密码是否符合格式
		var flagcolleage = false;
		//判断身份证是否符合格式
		var flagprice = false;
		//判断手机号是否符合格式
		var realurl=null;
		
		function getObjectURL(file) {  
		     var url = null;  
		     if (window.createObjcectURL != undefined) {  
		         url = window.createOjcectURL(file);  
		     } else if (window.URL != undefined) {  
		         url = window.URL.createObjectURL(file);  
		     } else if (window.webkitURL != undefined) {  
		         url = window.webkitURL.createObjectURL(file);  
		     }  
		     return url;  
		 }
		
		
		$("img").click(function() {
			$("#photo").click();
		})
		
		
		
		$("#photo").change(function() {
			 var file = this.files[0];
			 realurl = getObjectURL(file);
				$("img").attr("src",realurl);
		})
		
	
		

		var flagname = false;
		//判断密码是否符合格式
		var flagcolleage = false;
		//判断身份证是否符合格式
		var flagprice = false;	
		
		$("#adddoctor").click(function() {
			if(flagname&&flagcolleage&&flagprice){
			var editoradd=$(this).attr("id");
			var formData = new FormData();
			formData.append('photo', $('#photo')[0].files[0]);
			formData.append('name', $('#name').val());
			formData.append('gender', $("#gender").find(':selected').text());
			formData.append('depart', $("#depart").find(':selected').val());
			formData.append('colleage',$("#colleage").val());
			formData.append('tel', $("#tel").val());
			formData.append('type', $("#type").val());
			formData.append('price', $("#price").val());
			formData.append('editoradd',editoradd);
			$.ajax({
				type : "post",
				url : "DoctorEditAdd",
				async : true, //异步
				data: formData,
			    processData: false,
			    contentType: false,
				dataType : "text",
				success : function(data) {
					alert(data);
				}
			});}
			else{alert("请正确填写必要信息");}
			
			
			
		})
		
		
	
		
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
		

		
		
		
			$(document).ready(function(){
				$.ajax({
					type : "post",
					url : "DoctorSelect",
					data: "key=key",
					dataType : "text",
					success : function(data) {
						windows.onload("doctorDetailManegement.jsp");
					}
				});
				
			})
		
	})
</script>



<meta charset="UTF-8">
<title>医生添加</title>

<style type="text/css">
.my {
	font-size: .8rem;
	border-radius: 10rem;
}
</style>

</head>
<body class="bg-gradient-primary" >

	<div class="container" >


		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block ">
						<img src="../doctor/Error.jpg" height="620px" alt="点击上传图片" /> 
						<input id="photo" type="file" style="display:none;">
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">添加医生</h1>
							</div>
							<form class="user">
								<div class="form-group row">
									<div class="col-sm-7 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user "
											id="name" placeholder="请输入医生姓名" >

										<br /> <input type="text"
											class="form-control form-control-user" id="type"
											placeholder="请输入医生类型" >
									</div>
									<div class="col-sm-4 ml-auto">


										<select class="form-control my " id="depart">
											<option selected disabled value="0">请选择所属科室</option>
											<c:forEach items="${departments}" var="department" varStatus="loop">
											<option value="${department.id}">${department.name}</option>
											</c:forEach>
										</select> <select class="form-control my" id="gender">
											<option selected disabled value="0">请选择性别</option>
											<option  value="男">男</option>
											<option value="女">女</option>
										</select>
									</div>
								</div>






								<div class="form-group">

									<input type="text" class="form-control form-control-user"
										id="tel" placeholder="请输入电话">
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="colleage" placeholder="请输入毕业院校"
											>
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user"
											id="price" 
											placeholder="请输入门诊价格">
									</div>
								</div>
								<hr>
									<button  id="adddoctor" class="btn btn-warning btn-user btn-block">添加医生 </button>
									<a href="DoctorSelect" class="btn btn-primary btn-user btn-block">返回查看所有医生 </a> 
									
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="DoctorSelect">查看所有医生</a>
							</div>
							<div class="text-center">
								<a class="small" href="addDocor.jsp">添加医生</a>
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