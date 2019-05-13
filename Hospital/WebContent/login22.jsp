<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<style type="text/css">
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
	#loginform{
		color: white;
	}
</style>
<script type="text/javascript">
			//绑定事件
			$(function() {
				//判断用户名是否符合格式
				var flagname = false;

				//选择登录方式
				$("[name=LoginType]").click(function(){
					//普通用户 
					if($("[name=LoginType]:checked").val()=="admin"){
						$("#username").text("用户名");
						$("#inputName").attr("placeholder","用户名");
						$('#inputName~span').css("visibility", 'hidden');
						$('#login').removeAttr("disabled");
						flagname = true;
					}
					//管理员
					else{
						$("#username").text("手机号");
						$("#inputName").attr("placeholder","手机号");
						$('#login').attr("disabled", "disabled");
					}
				})
				//用户名格式验证
				$('[name=username]').blur(
					function() {
						if($("[name=LoginType]:checked").val()=="admin"){
							return;
						}
						var username = $('[name=username]').val();
						//用户名---手机号的验证方式11位数字 1开头第二位不为1，2，6，9，0
						var reg = /^1[34578]\d{9}$/;
						//格式错误
						if(reg.test(username) == false) {
							$('#inputName~span').css("visibility", 'visible');
							flagname = false;
							$('#login').attr("disabled", "disabled");
						} 
						//格式正确
						else {
							$('#inputName~span').css("visibility", 'hidden');
							flagname = true;
							$('#login').removeAttr("disabled");
						}
					}
				)
			//绑定回车为登录事件
			$(document).keydown(function(event){
			    if(event.keyCode==13){
			       $("#login").click();
			    }
			 });
				
				
			$("#login").click(function(){
				//提交登录表单
				//$(".loading").css("display","block");
				var json={
					username:$("#inputName").val(),
					password:$("#inputPassword3").val(),
					type:$("[name=LoginType]:checked").val(),
				};
				/* json.username=$("#inputName").val();
				json.password=$("#inputPassword3").val();
				json.type=$("[name=LoginType]:checked").val(); */
				//输入为空不提交
				if(json.username==""||json.password==""||flagname==false)
					return;
				$.ajax({
					type: "post",
					url: "login",
					data: json,
					dataType: 'text', 
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					success: function(data) {
						//$(".loading").css("display","none");
						if(data=="success"){
							if(json.type=="user")
							window.location = "index.jsp";
							else if(json.type=="admin")
								window.location = "UserManegeMain.jsp";
						}
						else if(data=="error"){
							alert("登录失败,用户名或密码错误");	
						}
					},
					error: function() {
						alert("无法连接服务器");
					}
				});
			})
		})
	</script>
<title>登陆</title>
</head>
<body>
	<!-- <div class="loading" style="color:red;position:absolute;left:40%;top:30%;display:none;"  ><h1>正在登录，请稍等……</h1></div> -->
	<div class="container-fluid"  id="main" >
		<div class="container-fluid  col-sm-12" style="height: 60px;"></div>
		<div class="container-fluid  col-sm-4 col-md-offset-2 page-header" style="color: white;">
			<div class="container-fluid  col-sm-12" style="height: 120px;"></div>
			<h1>浙江水利水电医院<small style="color:#DDDDDD;">在线预约挂号</small></h1>
		</div>
		<div class="container-fluid  col-sm-5 col-md-offset-1" id="loginform">
			<div class="form-horizontal">
				<div style="height: 100px; margin-top: 50px;" class="col-sm-12">
					<h2 style="margin-left: 150px;">登陆</h2>
				</div>
				<div class="form-group" style="height: 30px;">
					<label id="username" for="inputName" class="col-sm-2 control-label" style="text-align: center;">手机号:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="text"
							class="form-control" id="inputName" name="username"
							placeholder="手机号"> 
							<span style="display: block; color:red; height: 8px; visibility: hidden;" class="alert">手机号不存在</span>
					</div>
				</div>
				<div class="form-group" style="height: 30px;">
					<label for="inputPassword3" class="col-sm-2 control-label" style="text-align: center;">密码:</label>
					<div class="col-sm-10">
						<input style="width: 56%; display: inline;" type="password"
							class="form-control" id="inputPassword3" name="userpwd"
							placeholder="密码 "> <span
							style="display: block; height: 8px; visibility: hidden;"
							class="alert">密码错误</span>
					</div>
				</div>
				<div class="form-group" style="height: 30px;">
					<label for="inputName" class="col-sm-2 control-label">登录方式:</label>
					<div class="col-sm-10">
						<div class="radio" style="float:left;">
						  <label>
						    <input type="radio" name="LoginType" id="optionsRadios1" value="user" checked>
						    普通用户
						  </label>
						</div>
						<div class="radio" style="float:left; margin-left:40px;">
						  <label>
						    <input type="radio" name="LoginType" id="optionsRadios2" value="admin">
						    管理员
						  </label>
						</div>
					</div>
				</div>
				
				<div class="form-group" style="height: 30px;">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<button  id="login" style="width: 25%;"
							class="btn btn-success" disabled="disabled">登陆</button>
							<button  id="login" style="width: 25%; margin-left:5%"
							class="btn btn-success" onclick="window.location = 'register.jsp'">注册</button>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>




</html>