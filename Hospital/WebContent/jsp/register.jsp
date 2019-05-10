<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<style type="text/css">6
.alert {
	font-family: "微软雅黑";
	font-size: 12px;
}


body{
		background: url("../images/ban6.jpg") no-repeat;
		background-size: 100%;
		width:1700px;
		
	}
	#main{
		min-height:750px;
		max-height: 810px;
		width: 100%;
		overflow: hidden;
		background-size: 100%;
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
							$('#usernameflag').css("display", 'inline');
							$('#register').attr("disabled", "disabled");
						} 
						//格式正确
						else {
							$('#usernameflag').css("display", 'none');
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
							$('#telflag').css("display", 'inline');
							$('#register').attr("disabled", "disabled");
						} 
						//格式正确
						else {
							$('#telflag').css("display", 'none');
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
							$('#idcardflag').css("display", 'inline');
							flagidcard = false;
							$('#register').attr("disabled", "disabled");
						}
						//格式正确
						else {
							$('#idcardflag').css("display", 'none');
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
							$('#passwordflag').css("display", 'inline');
							flagpwd = false;
							$('#register').attr("disabled", "disabled");
						} 
						//格式正确
						else {
							//密码和确认密码不同
							if(userpwd2!="" && userpwd2!=userpwd){
								$('#passwordflag2').css("display", "inline");
								flagpwd2 = false;
							}
							//密码和确认密码相同
							else {
								$('#passwordflag2').css("display", "none");
								flagpwd2 = true;
								if(flagname && flagpwd &&flagidcard &&flagtel &&flagpwd2) {
									$('#register').removeAttr("disabled");
								}
							}
							$('#passwordflag').css("display", 'none');
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
						if(userpwd!=userpwd2) {
							$('#passwordflag2').css("display", 'inline');
							flagpwd2 = false;
							$('#register').attr("disabled", "disabled");
						} 
						//确认密码和密码相同
						else {
							$('#passwordflag2').css("display", "none");
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
				json.gender=$("[name=gender]:checked").val()
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
<title>注册</title>
</head>
<body>
	<div class=" container-fluid" id="main">
		<div class="container-fluid  col-sm-12" style="height: 60px;"></div>
		<div class="container-fluid  col-sm-4 col-md-offset-2 page-header" style="color: white;">
			<div class="container-fluid  col-sm-12" style="height: 120px;"></div>
			<h1>浙江水利水电医院<small style="color:#DDDDDD;">在线预约挂号</small></h1>
		</div>
		<div class="container-fluid  col-sm-5 col-md-offset-1" style="color: white;">
			<!--<nav class="navbar navbar-nav ">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"></a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="#" class="glyphicon glyphicon-user"
								style="color: gainsboro;"></a></li>
	
							<li class="active"><a
								style="color: black; font-family: '微软雅黑';" href="#"><strong>Register</strong></a>
							</li>
							<li><a href="login.jsp">Login </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Management<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="Management.jsp">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="dropdown-header">nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>-->
	
			<div class="form-horizontal col-sm-12" >
				<div style="height: 60px; margin-top: 50px;" class="col-sm-12">
					<h2 style="margin-left: 150px;">注册</h2>
				</div>
				<div class="form-group col-sm-12" style="height: 30px; ">
					<label for="inputPhone" class="col-sm-2 control-label">手机号:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="text"
							class="form-control" id="tel" name="phone"
							placeholder="手机号"> <span id="telflag" style="color:red;">*</span>
					</div>
				</div>
				
				<div class="form-group col-sm-12" style="height: 30px; ">
					<label for="inputName" class="col-sm-2 control-label">姓名:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="text"
							class="form-control" id="username" name="username"
							placeholder="姓名"> <span id="usernameflag" style="color:red">*</span>
					</div>
				</div>
	
				<div class="form-group col-sm-12" style="height: 30px;">
					<label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="password"
							class="form-control" id="password" name="userpwd"
							placeholder="密码 "> <span id="passwordflag" style="color:red">*</span>
					</div>
				</div>
				<div class="form-group col-sm-12" style="height: 30px;">
					<label for="inputPassword3" class="col-sm-2 control-label">确认密码:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="password"
							class="form-control" id="password2" name="userpwd2"
							placeholder="确认密码 "> <span id="passwordflag2" style="color:red">*</span>
					</div>
				</div>
				
	
				<div class="form-group col-sm-12" style="height: 30px;">
					<label class="col-sm-2 control-label ">身份证:</label>
					<div class="col-sm-10 " style="height: 30px;">
						<input style="width: 56%; display: inline;" type="text"
							class="form-control" id="idcard" name="username"
							placeholder="身份证"> <span id="idcardflag" style="color:red">*</span>
					</div>
				</div>
	
				<div class="form-group col-sm-12" style="height: 30px;">
					<label class="col-sm-2 control-label ">性别:</label>
					<div class="col-sm-10" style="text-align: left;">
						<label class="radio-inline" > <input type="radio"
							name="gender"  value="男" checked="checked">
							男
						</label> 
						<label style="width: px;" class="radio-inline" > <input
							type="radio" name="gender" id="gender" value="女">
							女
						</label>
					</div>
	
				</div>
				<div class="form-group col-sm-12" style="height: 30px;">
					<br />
					<div class="col-sm-offset-2">
						<button id="register" style="width: 25%;" class="btn btn-primary" disabled="disabled">注册</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="login.jsp" style="color: white;">
						<button class="btn btn-primary" style="width: 25%;">
							登陆
						</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>