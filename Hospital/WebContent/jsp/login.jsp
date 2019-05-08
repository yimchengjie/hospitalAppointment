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
				
				
			$("#login").click(function(){
			//提交登录表单
			var json={};
			json.username=$("#inputName").val();
			json.password=$("#inputPassword3").val();
			json.type=$("[name=LoginType]:checked").val();
			//输入为空不提交
			if(json.username==""||json.password==""||flagname==false)
				return;
			$.ajax({
				type: "post",
				url: "login",
				data: json,
				dataType: "text", 
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				success: function(data) {
					if(data=="success"){
						alert("登录成功");
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
	<div class="container-fluid  col-sm-4">
	
		<div class="form-horizontal">

			<div style="height: 100px; margin-top: 50px;" class="col-sm-12">
				<h2 class="col-sm-2"></h2>
				<h2 class="col-sm-10">登陆</h2>
			</div>

			<div class="form-group" style="height: 30px;">
				<label id="username" for="inputName" class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-10">
					<input style="width: 56%; display: inline;" type="text"
						class="form-control" id="inputName" name="username"
						placeholder="手机号"> 
						<span style="display: block; color:red; height: 8px; visibility: hidden;" class="alert">手机号不存在</span>
				</div>
			</div>

			<div class="form-group" style="height: 30px;">
				<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input style="width: 56%; display: inline;" type="password"
						class="form-control" id="inputPassword3" name="userpwd"
						placeholder="密码 "> <span
						style="display: block; height: 8px; visibility: hidden;"
						class="alert">密码错误</span>
				</div>
			</div>
			<div class="form-group" style="height: 30px;">
				<label for="inputName" class="col-sm-2 control-label">登录方式</label>
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
					<button  id="login" style="width: 56%;"
						class="btn btn-success  btn-block" disabled="disabled">登陆</button>
				</div>
			</div>


		</div>
	</div>
</body>




</html>