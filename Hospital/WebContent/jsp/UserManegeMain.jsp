<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="evil.devil.entity.*"%>
<%@page import="java.util.*"%>
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
				
				
				
				$('[name=username]').blur(
					function() {
						var username = $('[name=username]').val();
						var reg = /^[\u4e00-\u9fa5]{2,4}$/;
						if(reg.test(username) == false) {
							$('#inputName~span').css("visibility", 'visible');
							flagname = false;
							$('[type=submit]').attr("disabled", "disabled");
						} else {
							$('#inputName~span').css("visibility", 'none');
							flagname = true;
							$('[type=submit]').removeAttr("disabled");
						}
					}
				)

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

					}
				)

				$("#confirmEdit").click(
					function() { //直接传递到后台，返回是刷新的
						var username = $(".modal-body input").eq(0).attr("value");
						var userpwd = $(".modal-body input").eq(1).attr("value");
						var idcard = $(".modal-body input").eq(4).attr("value");
						var phone = $(".modal-body input").eq(5).attr("value");
						//var age =$(".modal-body input").eq(6).attr("value");//要得到id
						var id = $(".modal-body input").eq(7).attr("value");
						$.ajax({
							type: "get",
							url: "useredit",
							async: true
						});

					}
				)
				
				

				$(".delete").click(
					function() {
							var id = $(this).parent().parent().parent().children().eq(0).html();
							$.ajax({
							type: "post",
							url: "UserDelete",
							async: false, //异步
							data:'id='+id, 
							dataType: "json",
							success: function(data) {
								var html = '';
								alert("删除成功");
								/*$.each(data, function(commentIndex, comment) {
									html += '<div class="comment"><h6>' + comment['username'] +
										':</h6><p class="para"' + comment['content'] +
										'</p></div>';
								});
								$('#resText').html(html);*/
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
									window.location("jsp/UserManegeMain.jsp");
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

		<div class="container-fluid  col-md-7">

			<div class="panel panel-default">
				<div class="panel-heading">患者管理</div>
				<table class="table">
					<tr>
						<td width="80">序号</td>
						<td width="100">患者姓名</td>
						<td width="80">密码</td>
						<td width="80">性别</td>
						<td width="200">身份证号</td>
						<td width="120">联系电话</td>
						<td width="80">年龄</td>
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
							<td>${item.gender}</td>
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
<%String way=(String)request.getAttribute("way");%>
<%String selectmsg=(String)request.getAttribute("selectmsg");%>
			<a href="UserSelect?pageIndex=${pageIndex==1?1:1}&way=<%=way%>&selectmsg=<%=selectmsg%>">首页 </a>
			<a href="UserSelect?pageIndex=${pageIndex==1?1:pageIndex-1}&way=<%=way%>&selectmsg=<%=selectmsg%>">上一页 </a>
			<a href="UserSelect?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}&way=<%=way%>&selectmsg=<%=selectmsg%>">下一页 </a>
			<a href="UserSelect?pageIndex=${pageIndex==totalPage?totalPage:totalPage}&way=<%=way%>&selectmsg=<%=selectmsg%>">末页 </a>
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
								<div class="col-md-10" style="width: 200px;"> <input type="text" class="form-control" id="name" value="谢爱晨"></div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">密码:</label>
								<div class="col-md-10" style="width: 200px;"><input type="text" class="form-control" id="pwd" value="88"> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">性别:</label>
								<div class="col-md-10"> <label class="radio-inline">
  			<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 男
				</label>
									<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
			</label> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">身份证号:</label>
								<div class="col-md-10" style="width: 300px;"><input type="text" class="form-control" id="telphone"> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">联系电话:</label>
								<div class="col-md-10" style="width: 300px;"><input type="text" class="form-control" id="idcard"> </div>
							</div>

							<div class="form-group" style="height: 40px;">
								<label for="message-text" class="control-label col-md-2">年龄:</label>
								<div class="col-md-10" style="width: 200px;"><input type="text" class="form-control" id="age"> </div>
							</div>
							<input type="text" class="form-control" id="id" style="visibility: hidden;">
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="confirmEdit">确认修改</button>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>