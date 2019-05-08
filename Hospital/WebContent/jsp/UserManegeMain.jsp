<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evil.devil.entity.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
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
				
				
	
				$(".edit").click(//转发到show的servlet上
						//
					function() {
						alert($("#way").val());
						var id = $(this).parent().parent().parent().children().eq(0).html();
						var username = $(this).parent().parent().parent().children().eq(1).html();
						var userpwd = $(this).parent().parent().parent().children().eq(2).html();
						var gender = $(this).parent().parent().parent().children().eq(3).html();
						var idcard = $(this).parent().parent().parent().children().eq(4).html();
						var phone = $(this).parent().parent().parent().children().eq(5).html();
						var age = $(this).parent().parent().parent().children().eq(6).html();
						//得到兄弟元素
						$(".modal-body input").eq(0).attr("value", username);
						$(".modal-body input").eq(1).attr("value", userpwd);
						$(".modal-body input").eq(4).attr("value", idcard);
						$(".modal-body input").eq(5).attr("value", phone);
						$(".modal-body input").eq(6).attr("value", age);
						$(".modal-body input").eq(7).attr("value", id);
						if(gender=="女"){
							$(".modal-body input").eq(3).attr("checked", true);
						}

					}
				)

				
				//判断姓名是否符合格式
				var flagname = false;
				//判断密码是否符合格式
				var flagpwd = false;
				//判断身份证是否符合格式
				var flagidcard = false;
				//判断手机号是否符合格式
				var flagtel = false;
				
				
				//验证姓名格式
				$('#name').blur(
					function() {
						var name = $(this).val();
						//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
						var reg =  /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
						//格式错误
						if(reg.test(name) == false) {
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
							if (flagpwd&&flagtel&&flagidcard) {
								$("#confirmEdit").removeAttr("disabled");
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
							$(this).parent().parent().removeClass("has-success");
							$(this).parent().parent().addClass("has-error");
							$("#confirmEdit").attr("disabled", "disabled");
						} 
						//格式正确
						else {
							flagtel = true;
							$(this).parent().parent().removeClass("has-error");
							$(this).parent().parent().addClass("has-success");
							if (flagpwd&&flagname&&flagidcard) {
								$("#confirmEdit").removeAttr("disabled");
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
							flagidcard = false;
							$(this).parent().parent().removeClass("has-success");
							$(this).parent().parent().addClass("has-error");
							$("#confirmEdit").attr("disabled", "disabled");
						}
						//格式正确
						else {
							flagidcard = true;
							$(this).parent().parent().removeClass("has-error");
							$(this).parent().parent().addClass("has-success");
							if (flagpwd&&flagname&&flagtel) {
								$("#confirmEdit").removeAttr("disabled");
							}
						}
					}
				)
				
				
				
				
				
				
				
				//验证密码格式
				$('#pwd').blur(
					function() {
						var pwd = $('#pwd').val();
						//密码---3-10位，不能以数字开头，只能是中文或者英文字符
						var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{3,10}$/;
						//格式错误
						if(reg.test(pwd) == false) {
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
							if (flagidcard&&flagname&&flagtel) {
								$("#confirmEdit").removeAttr("disabled");
							}
						}
					}
				)
				
				
				
				$("#closeEdit").click(
						function() { 
							$("#pwd").parent().parent().attr("class","form-group");
							$("#name").parent().parent().attr("class","form-group");
							$("#tel").parent().parent().attr("class","form-group");
							$("#idcard").parent().parent().attr("class","form-group");
						}
					)
						
						
						
				
				$("#confirmEdit").click(
					function() { //直接传递到后台，返回是刷新的
						 var json={};
							json.id=$(".modal-body input").eq(6).attr("value");
							json.username=$(".modal-body input").eq(0).attr("value");
							json.userpwd=$(".modal-body input").eq(1).attr("value");
							json.gender=$(".modal-body [name=gender]:checked").val();
							json.idcard= $(".modal-body input").eq(4).attr("value");
							json.tel=$(".modal-body input").eq(5).attr("value");
							
					/*		var username = $(".modal-body input").eq(0).attr("value");
							var userpwd = $(".modal-body input").eq(1).attr("value");
							var idcard = $(".modal-body input").eq(4).attr("value");
							var phone = $(".modal-body input").eq(5).attr("value");
							var id = $(".modal-body input").eq(6).attr("value");//得到id*/
							
							
							$.ajax({
								type: "post",
								url: "register",
								data: json,
								dataType: "text", 
								contentType: "application/x-www-form-urlencoded; charset=utf-8",
								success: function(data) {
									if(data=="success"){
										alert("修改成功");
									}
									else if(data=="erroridcard"){
										alert("修改失败,该身份证号存在");	
									}
									else if(data=="errortel"){
										alert("修改失败,该手机号存在");	
									}
								},
								error: function() {
									alert("无法连接服务器");
								}
							}); 
						
						
					}
				)
				
				

				$(".delete").click(
					function() {
							var id = $(this).parent().parent().parent().children().eq(0).html();
							$(this).parent().parent().parent().remove();
							$.ajax({
							type: "post",
							url: "UserDelete",
							async: false, //异步
							data:'id='+id, 
							dataType: "text",
							success: function(data) {
								alert("删除"+data);
							}

						});
						
					}
				)


			
				$("#select").click(
					function() { //直接传递到后台，返回是刷新的
							//得到一个新的list，并且遍历这个list
							var selectmsg=$("#selectmsg").val();
							var way=$("#way").val();
							alert(selectmsg+way);
							/* location.href ="UserSelect?way="+way+'&selectmsg='+selectmsg; */
							$.ajax({
								type: "post",
								url: "UserSelect",
								async: false, //异步
								data:'way='+way+'&selectmsg='+selectmsg, 
								dataType: "text",
								success: function(data) {
									alert("查询成功");
									window.location = "UserManegeMain.jsp";
								}
							});

					})
			})
		</script>

		<title></title>
	</head>
	<body>

		<div class="container-fluid  col-md-12" style="height: 150px;">
			<div class="container-fluid ">
				<div class="navbar-header ">
					<a class="navbar-brand " href="# "></a>
				</div>
				<div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1 ">
					<ul class="nav navbar-nav ">

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理员<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li>
									<a href="">管理员资料</a>
								</li>
								<li>
									<a href="#">退出登录</a>
								</li>
							</ul>
						</li>
						<li>
							<a href=" ">医生管理</a>
						</li>
						<li>
							<a style="color: black; font-family: '微软雅黑'; " href="# "><strong>用户管理</strong></a>
						</li>
						<li>
							<a href=" ">账单管理</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container-fluid  col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading"  >患者管理</div>
				<table class="table">
					<tr  >
						<td width="80">序号</td>
						<td width="100">患者姓名</td>
						<td width="80">密码</td>
						<td width="80">性别</td>
						<td width="200">身份证号</td>
						<td width="120">联系电话</td>
						<td>
							操作
						</td>

					</tr>

					<c:forEach var="item" items="${users}">
						<tr >
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.password}</td>
							<td>${item.gender}</td>
							<td>${item.idcard}</td>
							<td>${item.tel}</td>
							<td>
								<div class="btn-group" role="group">
									<button type="button" id="delete" class="btn btn-default delete">删除</button>
									<button type="button" id="edit" class="btn btn-default edit" data-toggle="modal" data-target="#editModel">修改</button>
								</div>
							</td>
						</tr>
						<br>
					</c:forEach>
				</table>
			</div>
			<a href="PageServlet?pageIndex=${pageIndex==1?1:1}">首页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}">上一页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}">下一页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:totalPage}">末页 </a>
		</div>

		<div class="container-fluid  col-md-5">
			<select class="form-control" id="way" style="width: 150px;">
				<option value="all">查找所有</option>
				<option value="name">根据姓名查找</option>
				<option value="gender">根据性别查找</option>
				<option value="idcard">根据身份证号查找</option>
				<option value="tel">根据手机号查找</option>
			</select>
			<br/>

			<input type="text" class="form-control" id="selectmsg" style="width: 150px;">
			<br/>
			<button type="button" id="select" class="btn btn-primary">  <span class="glyphicon glyphicon-search" ></span>查找 </button>
		</div>

		<div class="modal fade" id="editModel" tabindex="-1" role="dialog">
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
								<div class="col-md-10" style="width: 200px;"> <input type="text" class="form-control" id="name" value=""></div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">密码:</label>
								<div class="col-md-10" style="width: 200px;"><input type="text" class="form-control" id="pwd" value=""> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">性别:</label>
								<div class="col-md-10"> <label class="radio-inline">
  			<input type="radio" name="gender" id="inlineRadio1" value="男" checked="checked"> 男
				</label>
									<label class="radio-inline">
  				<input type="radio" name="gender" id="inlineRadio2" value="女"> 女
			</label> </div>
							</div>

							<div class="form-group " style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">身份证号:</label>
								<div class="col-md-10" style="width: 300px;"><input type="text" class="form-control" id="idcard"> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">联系电话:</label>
								<div class="col-md-10" style="width: 300px;"><input type="text" class="form-control" id="tel"> </div>
							</div>

						
							<input type="text" class="form-control" id="id" style="visibility: hidden;">
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="closeEdit"  data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="confirmEdit" disabled="disabled">确认修改</button>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>