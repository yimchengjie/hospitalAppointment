<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
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

		$("#select>[type=button]").click(function() {
			var way = $(this).attr("name");
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
		
		
		$("#add").click(function() {
			var newname = $("#newname").val();
			$.ajax({
				type : "post",
				url : "DepartAdd",
				data : 'name=' + newname,
				dataType : "text",
				success : function(data) {
					alert(data);
				}

			});
		})
		
		
		
		

	})
</script>

</head>

<body id="page-top">
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

				<li class="nav-item"><a class="nav-link" href=""
				data-toggle="collapse" data-target="#ccc"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>管理员</span>
			</a>
				<div id="ccc" class="collapse" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">操作</h6>
						<a class="collapse-item" href="">修改密码</a> <a class="collapse-item"
							href="">退出登陆</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">User&Account</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item "><a class="nav-link collapsed" href="UserSelect"
				> <i
					class="fas fa-fw fa-cog"></i> <span>用户管理</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed" href="AccountSelect"> <i
					class="fas fa-fw fa-wrench"></i> <span>账单管理</span>
			</a></li>

			<hr class="sidebar-divider">

			<div class="sidebar-heading">Doctor</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item  active"><a class="nav-link collapsed"
				href="DepartSelect" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>科室管理</span>
			</a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="DoctorSelect">
					<i class="fas fa-fw fa-chart-area"></i> <span>医生管理</span>
			</a></li>

	
			<li class="nav-item"><a class="nav-link" href="ecahrts.jsp">
					<i class="fas fa-fw fa-table"></i> <span>统计</span>
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
					<h1 class="h3 mb-2 text-gray-800">科室管理</h1>
					<p class="mb-4"></p>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">你好，管理员${way==null?all:way}</h6>
						</div>
						<br />

						<div class="mb-4 container-fluid" id="select">
							<button type="button" class="btn btn-primary" name="all">查看所有</button>
							<button type="button" class="btn btn-warning" name="ordinary">查看普通医生</button>
							<button type="button" class="btn btn-info" name="specialist">查看专家</button>
						</div>

						<div class="row container-fluid">
				

							<%
								HashMap<Department, List<Doctor>> ddMap = (HashMap<Department, List<Doctor>>) request.getSession().getAttribute("ddMap");
							%>
							
							<%
							
							if(ddMap!=null){
								for (Map.Entry<Department, List<Doctor>> entry : ddMap.entrySet()) {
							%>
							<div class="col-lg-3 mb-4">
								<div class="card shadow mb-4" style="height: 200px;width:280px;">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary"><%=entry.getKey().getName()%></h6>
									</div>
									<div class="card-body">
										<%
											List<Doctor> DepartDoctors = (List<Doctor>) entry.getValue();
										%>
										<table class="table  " border="0" height="100px">
											<tr>
												<%
													int count = DepartDoctors.size() > 6 ? 6 : DepartDoctors.size();
												%>
												<%
													for (int i = 0; i < count; i++) {
												%>
												<td class="todoctor"><a href="doctorDetailManegement.jsp?id=<%=DepartDoctors.get(i).getId()%>"  target="_blank"><%=DepartDoctors.get(i).getName()%></a></td>
												<%
													if (i == 2) {
												%>
											</tr>
												<%
													}}
												%>
										</table>
									</div>
								</div>
							</div>
							<%
								}}
							%>
							<div class="card shadow mb-4" style="height: 200px;width:280px;">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">添加科室</h6>
									</div><br/>
									<div class="card-body">
									<input type="text" class="form-control bg-light border-2 small"  placeholder="请输入科室名"  style="margin-top:-18px;" id="newname"><br/>
										<div align="right"><button type="button" class="btn btn-primary" id="add">确认添加</button></div>
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

				</div>
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>
</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

<script src="../js/sb-admin-2.min.js"></script>

</html>