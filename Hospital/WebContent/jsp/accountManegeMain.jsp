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
					$(".delete").click(
				function() {
						var id = $(this).parent().parent().parent().children().eq(0).html();
						$(this).parent().parent().parent().remove();
						$.ajax({
						type: "post",
						url: "AccountDelete",
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
						
						/* location.href ="UserSelect?way="+way+'&selectmsg='+selectmsg; */
						$.ajax({
							type: "post",
							url: "AccountSelect",
							async: false, //异步
							data:'way='+way+'&selectmsg='+selectmsg, 
							dataType: "text",
							success: function(data) {
								alert(data);
								window.location = "accountManegeMain.jsp";
								
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
					<div class="sidebar-brand-text mx-3">医院后台管理<sup>h</sup></div>
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
				<div class="sidebar-heading">
					User&Account
				</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item ">
					<a class="nav-link collapsed" href="UserSelect" >
						<i class="fas fa-fw fa-cog"></i>
						<span>用户管理</span>
					</a>
				</li>

				<li class="nav-item active">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> 
						<i class="fas fa-fw fa-wrench"></i>
						<span>账单管理</span>
					</a>
				</li>

				<hr class="sidebar-divider">

				<div class="sidebar-heading">
					Doctor
				</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="DepartSelect" >
						<i class="fas fa-fw fa-folder"></i>
						<span>科室管理</span>
					</a>
				</li>

				<!-- Nav Item - Charts -->
				<li class="nav-item">
					<a class="nav-link" href="DoctorSelect">
						<i class="fas fa-fw fa-chart-area"></i>
						<span>医生管理</span></a>
				</li>

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
						<h1 class="h3 mb-2 text-gray-800" >账单管理</h1>
						<p class="mb-4"></p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">你好，管理员${way==null?all:way}</h6>
							</div>
							<br/>

							<form class="form-inline">
								<div class="container-fluid " align="right">
									<select class="form-control" id="way" style="width: 150px;">
										<option value="all">查找所有</option>
										<option value="userid">根据患者id查找</option>
										<option value="doctorid">根据医生id查找</option>
									</select> <input type="text" class="form-control" id="selectmsg" style="width: 150px;">

									<button type="button" id="select" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>查找</button>
								</div>
							</form>

							<div class="card-body">
								<div class="table-responsive">
									<table class="table   table-hover" id="dataTable" width="100%" cellspacing="0">
											<tr>
												<th>序号</th>
												<th >患者id 姓名</th>
												<th >医生id 姓名</th>
												<th >预约日期</th>
												<th >订单日期</th>
												<th >价格</th>
												<th >支付方式</th>
												<th align="center">
													操作
												</th>

											</tr>

											<c:forEach var="item" items="${accounts}">
												<tr>
													<td>${item.id}</td>
													<td>${item.userId}</td>
													<td>${item.doctorId}</td>
													<td>${item.dateTime}</td>
													<td>${item.accountTime}</td>
													<td>${item.price}</td>
													<td>${item.payType}</td>
													<td>
														<div class="btn-group" role="group">
															<button type="button" id="delete" class="btn btn-primary delete">删除</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</table>


										<ul class="pagination justify-content-center">
									<li><a class="page-link"
										href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}&for=account">上一页</a>
									</li>
									
									
									<c:forEach var="item" varStatus="status" begin="1" end="${totalPage}">
									<c:if test="${status.index==pageIndex}">
										<li><a class="page-link" style="background-color: blue;color:white;" href="#">${status.index}</a></li>
									</c:if>
									
									<c:if test="${status.index!=pageIndex}">
										<li><a class="page-link" href="PageServlet?pageIndex=${status.index}&for=account">${status.index}</a></li>
									</c:if>
									</c:forEach>
									<li><a class="page-link"
										href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}&for=account">下一页</a>
									</li>
								</ul>

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
				<a class="scroll-to-top rounded" href="#page-top">
					<i class="fas fa-angle-up"></i>
				</a>

			 <script src="../js/sb-admin-2.min.js"></script>
	</body>

</html>