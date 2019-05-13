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
	 <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
</head>
<body>
   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:800px;height: 400px"></div>
   

</body>

 <script type="text/javascript">        
        	 // 基于准备好的dom，初始化echarts图表
             var myChart = echarts.init(document.getElementById('main')); 
            var names=[];
            var scores=[];
            $.ajax({
            	type:"post",
            	data: "key=charset",
   			    url:"DoctorSelect",
   			    dataType:"json",
   			    success:function(result){
   			    	if(result){
   			    		for(var i=0;i<result.length;i++){       
   	                        names.push(result[i].sname);
   	                    }
   	   			    	for(var i=0;i<result.length;i++){       
   	                        scores.push(result[i].score);
   	                    }
   	                    myChart.setOption({   
   		                    title: {
   			                    text: '科室医生分布图'
   			                },    
   	                        tooltip: {
						        show: true
						    },
						    legend: {
						        data:['学生成绩']
						    },
						    xAxis : [
						        {
						            type : 'category',
						            data : names
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    series : [
						        {
						            "name":"成绩",
						            "type":"line",
						            "data":scores
						        }
						    ]
   	                    });
   			    	}  			    	
   			    }
            });
    </script>

</html>