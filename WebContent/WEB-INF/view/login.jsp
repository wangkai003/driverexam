<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
		<script type="text/javascript">
			window.onload = function(){
				var text = "${loginInfo}";
				if(text != ""){
					alert(text);
				}
			}
		</script>
	</head>
	<body>
		<div id="box1" class="box">
			<img id="top-box-img" src="${pageContext.request.contextPath}/img/Image7.png"> 
			<div id="top-box1">
			  |&nbsp;&nbsp;用户登录<a href="${pageContext.request.contextPath}/index/register.action" id="mya">没有账号，去注册</a>
			</div>
		</div>
		<div id="box2" class="box">	
	    	<form action="${pageContext.request.contextPath}/user/login.action" method="POST" id="" onsubmit="return checkAll()">
	    		<table>
					<tr id="mytr">
						<td colspan="2" background="${pageContext.request.contextPath}/img/Image12.png"></td>
					</tr>
					<tr>
						<td class="td1">账号:</td>
						<td class="td2">
						  <input type="text" name="username" id="phone" onblur="checkphone()" placeholder="请输入用户账号..."/>
						  <span id="phonespan"></span>
						</td>
					</tr>
					<tr>
						<td class="td1">密码:</td>
						<td class="td2">
						  <input type="password" name="password" id="password" placeholder="请输入密码..."/>
						  <span id=""></span>
						</td>
					</tr>
					<tr>
						<td class="td1">验证码:</td>
						<td class="td2">
						  <input type="text" class="input_yzm" id="yzm" onblur="checkyzm()"/>
						  <a href="#" id="changeImg">
							    <canvas class="show-captcha" id="canvas" width="120" height="40"></canvas>
						  </a>
						  <span id="yzmspan"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">登&nbsp;&nbsp;录</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span><a href="${pageContext.request.contextPath}/index/index.action" style="text-decoration: none;">返回首页</a>
						</td>
					</tr>
				</table>
	    	</form>
		</div>	
		<div id="bottom-box">
			Copyright © 2015-2018 优估 All Rights Reserved 版权所有 优估(太原) 中北大学信息科技有限公司联系电话：021-10106088
		</div>
		<script type="text/javascript">
			function checkphone(){
				var phone = document.getElementById("phone").value;
				var spanNode = document.getElementById("phonespan");
				var reg = /^1[34578]\d{9}$/;
				if(phone==""||phone==null){
					spanNode.innerHTML = "";
				}else{
					if(reg.test(phone)){
					spanNode.innerHTML = "正确".fontcolor("green");
					return true;
					}else{
						spanNode.innerHTML = "账号格式错误".fontcolor("red");
						return false;
					}
				}
				
			}
			function checkyzm(){
				var yzm = document.getElementById("yzm").value.toString();
				var spanNode = document.getElementById("yzmspan");
				if(yzm==""||yzm==null){
					spanNode.innerHTML = "";
					return false;
				}
				if(yzm == flag.toString()){
					spanNode.innerHTML = "正确".fontcolor("green");
					return true;
				}else{
					spanNode.innerHTML = "验证码错误".fontcolor("red");
					return false;
				}
			}
			function checkAll(){
		    	var phone = checkphone();
		    	var yzm = checkyzm();
		    	if (phone&&yzm) {
		    		return true;
		    	} else{
		    		return false;
		    	}
		    	return true;
		    }
			$(function(){
				$("#top_btn_box a").click(function(){
					$(".input_yzm2").val($(this).text());
					document.getElementById("top_btn_box").style.display = "none";
					
				});
				
			})
			var flag;
			jQuery(function($){	    
			  
			    function randomNum(min, max) {
			        return Math.floor(Math.random() * (max - min) + min);
			    }

			    function randomColor(min, max) {
			        var r = randomNum(min, max);
			        var g = randomNum(min, max);
			        var b= randomNum(min, max);
			        return "rgb(" + r + "," + g + "," + b + ")";
			    }
			    var code=drawPic();
			    document.getElementById("changeImg").onclick = function(e) {
			        e.preventDefault();
			        code=drawPic();
			    }
		
			    function drawPic() {
			        var canvas = document.getElementById("canvas");
			        var width = canvas.width;
			        var height = canvas.height;
			        
			        var ctx = canvas.getContext('2d'); 
			        ctx.textBaseline ='bottom';
			        
			        ctx.fillStyle = randomColor(180,240);
			        
			        ctx.fillRect(0,0,width,height);
			        
			        var str ='ABCEFGHJKLMNPQRSTWXY123456789';
			
			　　　　 var code="";
			　　　　　
			        for(var i=1;i<=4;i++) {
			            var txt = str[randomNum(0,str.length)];
			            code=code+txt;
			            ctx.fillStyle = randomColor(50,160);
			            
			            ctx.font = randomNum(15,40) +'px SimHei';
			            
			            var x =10 +i *20;
			            var y = randomNum(25,35);
			            var deg = randomNum(-45,45);
			            
			            ctx.translate(x, y); 
			            ctx.rotate(deg * Math.PI /180); 
			            ctx.fillText(txt,0,0);
			            
			            ctx.rotate(-deg * Math.PI /180);
			            ctx.translate(-x, -y);
			        }
			        
			        
			        for(var i=0;i<3;i++) {
			            ctx.strokeStyle = randomColor(40, 180);
			            ctx.beginPath();
			            ctx.moveTo(randomNum(0,width/2), randomNum(0,height/2));
			            ctx.lineTo(randomNum(0,width/2), randomNum(0,height));
			            ctx.stroke();
			        }
			        
			        for(var i=0;i <50;i++) {
			            ctx.fillStyle = randomColor(255);
			            ctx.beginPath();
			            ctx.arc(randomNum(0, width), randomNum(0, height),1,0,2* Math.PI);
			            ctx.fill();
			        }
			        flag = code;
			        return code;
			    }
			});
		</script>
	</body>
</html>
