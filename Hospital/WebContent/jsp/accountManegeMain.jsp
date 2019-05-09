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
			<script type="text/javascript">
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
						alert(selectmsg+way);
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

<title>账单管理</title>
</head>
<body>

		<div class="container-fluid  col-md-12" style="height: 150px;">
				<div class="navbar  navbar-default ">
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
							<a href="">医生管理</a>
						</li>
						<li>
							<a  href="UserSelect">用户管理</a>
						</li>
						<li class="active">
							<a  href=" "><strong>账单管理</strong></a>
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
						<td width="100">患者id 姓名</td>
						<td width="80">医生id 姓名</td>
						<td width="80">预约日期</td>
						<td width="200">订单日期</td>
						<td width="120">价格</td>
						<td width="120">支付方式</td>
						<td>
							操作
						</td>

					</tr>

					<c:forEach var="item" items="${accounts}">
						<tr >
							<td>${item.id}</td>
							<td>${item.userId}</td>
							<td>${item.doctorId}</td>
							<td>${item.dateTime}</td>
							<td>${item.accountTime}</td>
							<td>${item.price}</td>
							<td>${item.payType}</td>
							<td>
								<div class="btn-group" role="group">
									<button type="button" id="delete" class="btn btn-default delete">删除</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<ul class="pager">
				<li><a href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}&for=account">上一页</a></li>
				<li><a href="#">${pageIndex==null?1:pageIndex}</a></li>
				<li><a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}&for=account">下一页</a></li>
			</ul>
		<!--  	<a href="PageServlet?pageIndex=${pageIndex==1?1:1}&for=account">首页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==1?1:pageIndex-1}&for=account">上一页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:pageIndex+1}&for=account">下一页 </a>
			<a href="PageServlet?pageIndex=${pageIndex==totalPage?totalPage:totalPage}&for=account">末页 </a>-->
		</div>

		<div class="container-fluid  col-md-5">
			<input type="date" value="2015-09-24" style="visibility: hidden;"/>
		
			<select class="form-control" id="way" style="width: 150px;">
				<option value="all">查找所有</option>
				<option value="userid">根据患者id查找</option>
				<option value="doctorid">根据医生id查找</option>
				<option value="accounttime">根据订单时间查找</option>
				<option value="datetime">根据预约时间查找</option>
			</select>
			
		
			
			<br/>

			<input type="text" class="form-control" id="selectmsg" style="width: 150px;">
			<br/>
			<button type="button" id="select" class="btn btn-primary">  <span class="glyphicon glyphicon-search" ></span>查找 </button>
		</div>

	

				


		

	</body>

</html>