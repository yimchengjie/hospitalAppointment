<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="evil.devil.entity.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link href="../fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="../css/sb-admin-2.min.css" rel="stylesheet">



<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>


<!--
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
		-->




<script type="text/javascript">
	//绑定事件
	$(function() {
		$(".edit").click(
				//转发到show的servlet上
				//
				function() {
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
		var flagname = true;
		//判断密码是否符合格式
		var flagpwd = true;
		//判断身份证是否符合格式
		var flagidcard = true;
		//判断手机号是否符合格式
		var flagtel = true;

		//验证姓名格式
		$('#name').blur(function() {
			var name = $(this).val();
			//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
			var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
			//格式错误
			if (reg.test(name) == false) {
				flagname = false;
				$(this).removeClass("is-valid");
				$(this).addClass("invalid-feedback");
				$("#confirmEdit").attr("disabled", "disabled");
			}
			//格式正确

			else {
				flagname = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
				if (flagpwd && flagtel && flagidcard) {
					$("#confirmEdit").removeAttr("disabled");
				}
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
				$("#confirmEdit").attr("disabled", "disabled");
			}
			//格式正确
			else {
				flagtel = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
				if (flagpwd && flagname && flagidcard) {
					$("#confirmEdit").removeAttr("disabled");
				}
			}
		})

		//验证身份证号格式
		$('#idcard')
				.blur(
						function() {
							var idcard = $(this).val();
							//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
							var reg = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
							//格式错误

							if (reg.test(idcard) == false) {
								flagidcard = false;
								$(this).removeClass("is-valid");
								$(this).addClass("is-invalid");
								$("#confirmEdit").attr("disabled", "disabled");
							}
							//格式正确
							else {
								flagidcard = true;
								$(this).removeClass("is-invalid");
								$(this).addClass("is-valid");
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
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
				$("#confirmEdit").attr("disabled", "disabled");
			}
			//格式正确
			else {
				flagpwd = true;
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
				if (flagidcard && flagname && flagtel) {
					$("#confirmEdit").removeAttr("disabled");
				}
			}
		})

		$("#closeEdit").click(function() {
			$("#pwd").attr("class", "form-control");
			$("#name").attr("class", "form-control");
			$("#tel").attr("class", "form-control");
			$("#idcard").attr("class", "form-control");
		})

		$("#confirmEdit")
				.click(
						function() { //直接传递到后台，返回是刷新的
							var json = {};
							json.id = $(".modal-body input").eq(6)
									.attr("value");
							json.username = $(".modal-body input").eq(0).attr(
									"value");
							json.userpwd = $(".modal-body input").eq(1).attr(
									"value");
							json.gender = $(".modal-body [name=gender]:checked")
									.val();
							json.idcard = $(".modal-body input").eq(4).attr(
									"value");
							json.tel = $(".modal-body input").eq(5).attr(
									"value");

							/*		var username = $(".modal-body input").eq(0).attr("value");
									var userpwd = $(".modal-body input").eq(1).attr("value");
									var idcard = $(".modal-body input").eq(4).attr("value");
									var phone = $(".modal-body input").eq(5).attr("value");
									var id = $(".modal-body input").eq(6).attr("value");//得到id*/

							$
									.ajax({
										type : "post",
										url : "register",
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
										},
										error : function() {
											alert("无法连接服务器");
										}
									});

						})

		$(".delete").click(
				function() {
					var id = $(this).parent().parent().parent().children()
							.eq(0).html();
					$(this).parent().parent().parent().remove();
					$.ajax({
						type : "post",
						url : "UserDelete",
						async : false, //异步
						data : 'id=' + id,
						dataType : "text",
						success : function(data) {
							alert("删除" + data);
						}

					});

				})

		$("#select").click(function() { //直接传递到后台，返回是刷新的
			//得到一个新的list，并且遍历这个list
			var selectmsg = $("#selectmsg").val();
			var way = $("#way").val();
			alert(selectmsg + way);
			/* location.href ="UserSelect?way="+way+'&selectmsg='+selectmsg; */
			$.ajax({
				type : "post",
				url : "UserSelect",
				async : false, //异步
				data : 'way=' + way + '&selectmsg=' + selectmsg,
				dataType : "text",
				success : function(data) {
					alert(data);
					window.location = "UserManegeMain.jsp";
				}
			});

		})
	})
</script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					医院后台管理<sup>h</sup>
				</div>
			</a>

			<li class="nav-item"><a class="nav-link" href=""  data-toggle="collapse" data-target="#ccc">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>管理员</span>
			</a>
			
			
				<div id="ccc" class="collapse" 
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">操作</h6>
							<a class="collapse-item" href="">修改密码</a> 
							<a class="collapse-item" href="logout">退出登陆</a>
						</div>
					</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">User&Account</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="#" data-toggle="collapse" data-target=""
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-cog"></i> <span>用户管理</span>
			</a>
			
			</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="AccountSelect"> <i class="fas fa-fw fa-wrench"></i>
					<span>账单管理</span>
			</a></li>

			<hr class="sidebar-divider">

			<div class="sidebar-heading">Doctor</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="DepartSelect"> <i class="fas fa-fw fa-folder"></i> <span>科室管理</span>
			</a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="DoctorSelect"> <i
					class="fas fa-fw fa-chart-area"></i> <span>医生管理</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>其他</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!--  搜索栏 -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</nav>

				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">患者管理</h1>
					<p class="mb-4"></p>
					<a target="_blank"></a>


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">你好，管理员</h6>
						</div>
						<br />
						<form class="form-inline">
							<div class="container-fluid " align="right">
								<select class="form-control" id="way" style="width: 150px;">
									<option value="all">查找所有</option>
									<option value="id">根据id查找</option>
									<option value="name">根据姓名查找</option>
									<option value="gender">根据性别查找</option>
									<option value="idcard">根据身份证号查找</option>
									<option value="tel">根据手机号查找</option>
								</select> <input type="text" class="form-control" id="selectmsg"
									style="width: 150px;">

								<button type="button" id="select" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>查找
								</button>
							</div>
						</form>

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover " id="dataTable" width="100%"
									cellspacing="0">
									<tr>
										<th>序号</th>
										<th>患者姓名</th>
										<th>密码</th>
										<th>性别</th>
										<th>身份证号</th>
										<th>联系电话</th>
										<th>操作</th>
									</tr>
									<c:forEach var="item" items="${users}">
										<tr>
											<td>${item.id}</td>
											<td>${item.name}</td>
											<td>${item.password}</td>
											<td>${item.gender}</td>
											<td>${item.idcard}</td>
											<td>${item.tel}</td>
											<td align="center">

												<div class="btn-group" role="group">
													<button type="button" id="delete"
														class="btn btn-primary  btn-sm delete">删除</button>
													<button type="button" id="edit"
														class="btn btn-primary btn-sm edit" data-toggle="modal"
														data-target="#editModel">修改</button>

												</div>
											</td>
										</tr>
									</c:forEach>
								</table>


								<ul class="pagination justify-content-center">
									<li><a class="page-link"
										href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}">上一页</a>
									</li>
									<li><a class="page-link" href="#">${pageIndex==null?1:pageIndex}</a>
									</li>
									<li><a class="page-link"
										href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}">下一页</a>
									</li>
								</ul>
								<!--  <a href="PageServlet?pageIndex=${pageIndex==1?1:1}">首页 </a> 
		<a href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}">上一页 </a> 
		<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}">下一页</a> 
		<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:totalPage}">末页	</a>-->

							</div>
						</div>
					</div>

					<!--脚注 -->
					<footer class="sticky-footer bg-white">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Hospital Website 2019</span>
						</div>
					</footer>
					<!-- 脚注 -->

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

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
											class="form-control" id="name" value="">
									</div>
								</div>

								<div class="form-group" style="height: 40px;">
									<label class="control-label">密码:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 150px;" type="text"
											class="form-control" id="pwd" value="">
									</div>
								</div>

								<div class="form-group" style="height: 40px;">
									<label class="control-label">性别:</label>
									<div style="display: inline; width: 200px;">
										<label class="radio-inline"> <input type="radio"
											name="gender" id="inlineRadio1" value="男" checked="checked">
											男
										</label> <label class="radio-inline"> <input type="radio"
											name="gender" id="inlineRadio2" value="女"> 女
										</label>
									</div>
								</div>

								<div class="form-group " style="height: 40px;">
									<label for="message-text" class="control-label ">身份证号:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 300px;" type="text"
											class="form-control" id="idcard">
									</div>
								</div>

								<div class="form-group" style="height: 40px;">
									<label for="message-text" class="control-label ">联系电话:</label>
									<div style="display: inline;">
										<input style="display: inline; width: 300px;" type="text"
											class="form-control" id="tel">
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
		</div>
	</div>
	<script src="../js/sb-admin-2.min.js"></script>
</body>

</html>