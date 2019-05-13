//绑定事件
        	$(function() {
        		//密码可见
        		$("#passwordsee").click(function(){
        			if($("#pwd").attr("type")=="text")
        					$("#pwd").attr("type","password");
        			else if($("#pwd").attr("type")=="password")
        					$("#pwd").attr("type","text");
        		})
    		     //再次预约
        		$("[name=reserveAgin]").click(function(){
        			var json={};
             		json.department=$(this).parent().children().eq(0).html();
        			json.doctor=$(this).parent().children().eq(2).html();
        			 $.ajax({
         				type: "post",
         				url: "reserveAgin",
         				data: json,
         				dataType: "text", 
         				contentType: "application/x-www-form-urlencoded; charset=utf-8",
         				success: function(data) {
         					var json=eval(data);
         					window.location = "index.jsp?department="+json[0]+"&doctor="+json[1]+"&price="+json[2];
         					
         				},
         				error: function() {
         					alert("无法连接服务器");
         				}
         			}); 
             	})
             	
        		$(".edit").click(
        				//转发到show的servlet上
        				//
        				function() {
        					alert($("#way").val());
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
        		var flagname = false;
        		//判断密码是否符合格式
        		var flagpwd = false;
        		//判断身份证是否符合格式
        		var flagidcard = false;
        		//判断手机号是否符合格式
        		var flagtel = false;

        		//验证姓名格式
        		$('#Pname').blur(function() {
        			var name = $(this).val();
        			//姓名---2-4位，不能以数字开头，只能是中文或者英文字符
        			var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,4}$/;
        			//格式错误
        			if (reg.test(name) == false) {
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
        				if (flagpwd && flagtel && flagidcard) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})

        		//验证手机号格式
        		$('#Ptel').blur(function() {
        			var tel = $(this).val();
        			//手机号正则
        			var reg = /^1[34578]\d{9}$/;
        			//格式错误
        			if (reg.test(tel) == false) {
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
        				if (flagpwd && flagname && flagidcard) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})

        		//验证身份证号格式
        		$('#idcard').blur(
        						function() {
        							var idcard = $(this).val();
        							//用户名---4-8位，不能以数字开头，只能是中文或者英文字符
        							var reg = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
        							//格式错误
        							if (reg.test(idcard) == false) {
        								flagidcard = false;
        								$(this).parent().parent().removeClass(
        										"has-success");
        								$(this).parent().parent().addClass("has-error");
        								$("#confirmEdit").attr("disabled", "disabled");
        							}
        							//格式正确
        							else {
        								flagidcard = true;
        								$(this).parent().parent().removeClass(
        										"has-error");
        								$(this).parent().parent().addClass(
        										"has-success");
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
        				$(this).parent().parent().removeClass("has-success");
        				$(this).parent().parent().addClass("has-error");
        				$("#confirmEdit").attr("disabled", "disabled");
        			}
        			//格式正确
        			else {
        				flagpwd = true;
        				$(this).parent().parent().removeClass("has-error");
        				$(this).parent().parent().addClass("has-success");
        				if (flagidcard && flagname && flagtel) {
        					$("#confirmEdit").removeAttr("disabled");
        				}
        			}
        		})
				//关闭模态框
        		$("#closeEdit").click(function() {
        			$("#pwd").parent().parent().attr("class", "form-group");
        			$("#name").parent().parent().attr("class", "form-group");
        			$("#tel").parent().parent().attr("class", "form-group");
        			$("#idcard").parent().parent().attr("class", "form-group");
        		})
				
        	})