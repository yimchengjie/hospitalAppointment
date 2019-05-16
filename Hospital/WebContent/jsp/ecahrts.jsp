<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/echarts-all.js"></script>
</head>
<body>
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
			<li class="nav-item "><a class="nav-link collapsed"
				href="UserSelect"> <i class="fas fa-fw fa-cog"></i> <span>用户管理</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="AccountSelect"> <i class="fas fa-fw fa-wrench"></i> <span>账单管理</span>
			</a></li>

			<hr class="sidebar-divider">

			<div class="sidebar-heading">Doctor</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item  "><a class="nav-link collapsed"
				href="DepartSelect" > <i class="fas fa-fw fa-folder"></i>
					<span>科室管理</span>
			</a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item "><a class="nav-link" href="DoctorSelect" >
					<i class="fas fa-fw fa-chart-area"></i> <span>医生管理</span>
			</a></li>


			<li class="nav-item active"><a class="nav-link" href="tables.html" data-toggle="collapse"
				data-target="#collapsePages" aria-expanded="true"
				aria-controls="collapsePages">
					<i class="fas fa-fw fa-table"></i> <span>统计</span>
			</a></li>

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

					<p class="mb-4"></p>
					<!-- DataTales Example -->
					<div class="row">
					<div id="main" style="width: 600px; height: 400px"></div>
					<div id="main2" style="width: 600px; height: 400px"></div>
</div>





				</div>
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>
</body>

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

<script src="../js/sb-admin-2.min.js"></script>

<script type="text/javascript">     
        	 // 基于准备好的dom，初始化echarts图表
             var myChart = echarts.init(document.getElementById('main')); 
             var myChart2 = echarts.init(document.getElementById('main2')); 
            var hello=[];
            $.ajax({
            	type:"post",
            	data: "key=charset",
   			    url:"DoctorSelect",
   			    dataType:"json",
   			    success:function(result){
   			    	
   			    	if(result){
   			    		var obj = eval(result);
   		                console.info(obj);
   		               
   			    		for(var i=0;i<result.length;i++){      
   			    			depart=new Object();
   			    			depart.value=result[i].doctorNum;
   			    			depart.name=result[i].name;
   			    			hello.push(depart);
   	                    }
   			    		var names=[];
   			    		hello.forEach(function(v){ names.push(v.name);});
   	                    myChart.setOption({   
   		                    title: {
   			                    text: '科室医生分布图',
   								x: 'center',
   			                },    
   	                        tooltip: {
						        show: true,
						        formatter: "{a} <br/>{b}: {c} ({d}%)"
						    },
						    legend: {
						        orient: 'vertical',
						        x: 'right',
						        data:names
						    },
						    series : [
						    	{
						            name:'科室',
						            type:'pie',
						            radius: ['0%', '70%'],
						            avoidLabelOverlap: false,
						            label: {
						                emphasis: {
						                    show: true,
						                    textStyle: {
						                        fontSize: '30',
						                        fontWeight: 'bold'
						                    }
						                }
						            },
						            roseType: 'radius',
						            data: hello,
						        }
						    ]
   	                    });
   			    	}  			    	
   			    }
            });
            
            
            
            
            
            
            $.ajax({
            	type:"post",
            	data: "",
   			    url:"Ecahrts",
   			    dataType:"json",
   			    success:function(result){
   			    	if(result){
   			    		var names=[];
   			    		var earning=[];
   			    		var yMax = 500;
   			    		var dataShadow = [];

   			    		var obj = eval(result);
   			    		$.each(obj, function (key, value) {
   			    		 names.push(key);
   			    		earning.push(value);
   			    		});

   			    		for (var i = 0; i < names.length; i++) {
   			    		    dataShadow.push(yMax);
   			    		}
   			    		
   			    		myChart2.setOption({   
    	   		                    title: {
    	   			                    text: '科室收入分部',
    	   								x: 'center',
    	   			                },  
				   	   		    xAxis: {
				   	   		        data: names,
				   	   		       
				   	   		        axisTick: {
				   	   		            show: false
				   	   		        },
				   	   		        axisLine: {
				   	   		            show: false
				   	   		        },
				   	   		        z: 10
				   	   		    },
				   	   		    yAxis: {
				   	   		        axisLine: {
				   	   		            show: false
				   	   		        },
				   	   		        axisTick: {
				   	   		            show: false
				   	   		        },
				   	   		        axisLabel: {
				   	   		            textStyle: {
				   	   		                color: '#999'
				   	   		            }
				   	   		        }
				   	   		    },
				    	   		    series: [
				    	   		        { // For shadow
				    	   		            type: 'bar',
				    	   		            itemStyle: {
				    	   		                normal: {color: 'rgba(0,0,0,0.05)'},
				    	   		            	emphasis: {color:'rgba(0,0,0,0.07)'},
				    	   		            },
				    	   		            barGap:'-100%',
				    	   		            barCategoryGap:'40%',
				    	   		            data: dataShadow,
				    	   		            animation: false
				    	   		        },
				    	   		        {
				    	   		            type: 'bar',
				    	   		            itemStyle: {
				    	   		                normal: {
				    	   		                 color:'#2378f7', 
				    	   		                },
				    	   		            },
				    	   		            data: earning
				    	   		        }
				    	   		    ]
    	   	                    });
   			    	}  			    	
   			    }
            });
    </script>

</html>




