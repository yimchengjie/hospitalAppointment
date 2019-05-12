<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="evil.devil.entity.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<link href="../fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
		<link href="../css/sb-admin-2.min.css" rel="stylesheet">

		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">

		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

		<!--
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
		-->

		<script type="text/javascript">
			//绑定事件
			$(function() {
				$(".departchange").click(function() { //直接传递到后台，返回是刷新的
					alert($(this).attr("name"));
					var json = {};
					json.departid = $(this).attr("name");
					$.ajax({
						type : "post",
						url : "DoctorSelect",
						data :json,
						dataType : "text",
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						success : function(data) {
							alert(data);
							window.location = "doctorManegement.jsp";
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
			<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

				<!-- Sidebar - Brand -->
				<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-laugh-wink"></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						医院后台管理<sup>h</sup>
					</div>
				</a>

				<li class="nav-item">
					<a class="nav-link" href="" data-toggle="collapse" data-target="#ccc">
						<i class="fas fa-fw fa-tachometer-alt"></i> <span>管理员</span>
					</a>

					<div id="ccc" class="collapse" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">操作</h6>
							<a class="collapse-item" href="">修改密码</a>
							<a class="collapse-item" href="">退出登陆</a>
						</div>
					</div>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">User&Account</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="UserSelect"> <i class="fas fa-fw fa-cog"></i> <span>用户管理</span>
					</a>

				</li>

				<li class="nav-item">
					<a class="nav-link collapsed" href="AccountSelect"> <i class="fas fa-fw fa-wrench"></i>
						<span>账单管理</span>
					</a>
				</li>

				<hr class="sidebar-divider">

				<div class="sidebar-heading">Doctor</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="DepartSelect"> <i class="fas fa-fw fa-folder"></i> <span>科室管理</span>
					</a>
				</li>

				<!-- Nav Item - Charts -->
				<li class="nav-item active">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="" > <i class="fas fa-fw fa-chart-area"></i> <span>医生管理</span>
					</a>
				</li>

				<!-- Nav Item - Tables -->
				<li class="nav-item">
					<a class="nav-link" href="tables.html">
						<i class="fas fa-fw fa-table"></i> <span>其他</span>
					</a>
				</li>

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
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

						<!-- Sidebar Toggle (Topbar) -->
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

						<!--  搜索栏 -->
						<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
						<h1 class="h3 mb-2 text-gray-800">医生管理</h1>
						<p class="mb-4"></p>
						<a target="_blank"></a>

						<!-- DataTales Example -->
						<div class="shadow mb-4">
							<br />
								<!--	<div class="container-fluid " align="right">
								<select class="form-control" id="way" style="width: 150px;">
									<option value="all">查找所有</option>
									<option value="name">根据姓名查找</option>
									<option value="gender">根据性别查找</option>
									<option value="idcard">根据身份证号查找</option>
									<option value="tel">根据手机号查找</option>
								</select> <input type="text" class="form-control" id="selectmsg"
									style="width: 150px;">

								<button type="button" id="select" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>查找
								</button>
							</div>-->
							<div class="row container">
							<div class="col-md-2" >
								<ul class="nav flex-column">
									<li class="nav-item">
										<a class="nav-link active departchange"  href="#" name="0">所有医生</a>
									</li>
										<c:forEach items="${departments}" var="department" varStatus="loop">
									<li class="nav-item">
										<a class="nav-link departchange" name='${department.id}' href="#">${department.name}</a>
									</li>
									</c:forEach>
								</ul>
								</div>



							<div class="col-md-10" >
							<div class="row">
							<c:forEach items="${doctorList}" var="doctor" varStatus="loop" >
								<div class="card " style="width: 16rem;border: none;margin-left: 25px;margin-rght: 25px;">
									<div class="card-header" style="padding: 0;"><img src="../doctor/${doctor.photo}" style="width: 15.9rem; height: 320px;"/></div>
							  <div class="card-body" style="margin-top: -20px;">
							  		<div >
							    		${doctor.name} <br/>
											学历：${doctor.colleage}<br/>
											<c:forEach items="${departments}" var="department" varStatus="loop">
														<c:if test="${doctor.departmentId==department.id}" >
															  科室：</span> <span>${department.name}
														</c:if>
														
											</c:forEach>
											</div>
							 	 </div>
									</div>
									</c:forEach>
										</div>						
								
								
								<div style="height: 500px;">
								
								</div>
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
				<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
				</a>

				
			</div>
		</div>
		<script src="../js/sb-admin-2.min.js"></script>
	</body>

</html>