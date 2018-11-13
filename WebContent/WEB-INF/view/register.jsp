<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
		<script type="text/javascript">
			window.onload = function(){
				var text = "${registerInfo}";
				if(text !=""){
					alert(text);
				}
			}
		</script>
	</head>
	<body>
		<div id="box1" class="box">
			<img id="top-box-img" src="${pageContext.request.contextPath}/img/Image7.png"> 
			<div id="top-box1">
			  |&nbsp;&nbsp;用户登录
			   <a href="${pageContext.request.contextPath}/index/login.action" id="mya">已有账号，去登录</a>
			</div>
			</div>
		</div>
	    <div id="box2" class="box">	
	    	<form action="${pageContext.request.contextPath}/user/register.action" method="POST" onsubmit="return checkAll()">
				<table>
					<tr id="mytr">
						<td colspan="2" background="${pageContext.request.contextPath}/img/Image11.png"></td>
						<c:if test="${!empty usernameExit}">
							<span>${usernameExit}</span>
						</c:if>
						<c:if test="${!empty emailExit}">
							<span>${usernameExit}</span>
						</c:if>
						
					</tr>
					<tr>
						<td class="td1">账号:</td>
						<td class="td2">
						  <input type="text" name="username" id="phone" onblur="checkphone()"/>
						  <span id="phonespan"></span>
						</td>
					</tr>
					<tr>
						<td class="td1">密码:</td>
						<td class="td2">
						  <input type="password" name="password" id="password"/>
						  <span id=""></span>
						</td>
					</tr>
					<tr>
						<td class="td1">确认密码:</td>
						<td class="td2">
						  <input type="password" name="reqpassword" id="repassword" onblur="checkpassword()"/>
						  <span id="repasswordspan"></span>
						</td>
					</tr>
					<tr>
						<td class="td1">所在城市:</td>
						<td class="td2">
						  <input type="text" name="address" class="input_yzm2"/>
						  <button id="top_btn" class="btn btn-default" type="button" onclick="show()"><span class="caret"></span></button>
						  <span id=""></span>
						</td>
					</tr>
					<tr>
						<td class="td1">邮箱:</td>
						<td class="td2">
						  <input type="text" name="email" id="email" onblur="checkemail()"/>
						  <span id="emailspan"></span>
						</td>
					</tr> 
					<tr>
						<td class="td1">验证码:</td>
						<td class="td2">
						  <input type="text" class="input_yzm" id="yzm" onblur="checkyzm()"/>
						  <a href="#" id="changeImg">
							    <canvas class="show-captcha" id="canvas" width="120" height="30"></canvas>
						  </a>
						  <span id="yzmspan"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">提交账号申请</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="bottom-box">
			Copyright © 2015-2018 优估 All Rights Reserved 版权所有 优估(太原) 中北大学信息科技有限公司联系电话：021-10106088
		</div>
		<div id="top_btn_box">
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">北京</a></li>
						<li><a href="#">上海</a></li>
						<li><a href="#">广州</a></li>
						<li><a href="#">杭州</a></li>
						<li><a href="#">深圳</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					热门
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">安庆</a></li>
						<li><a href="#">鞍山</a></li>
						<li><a href="#">安阳</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					A	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">保定</a></li>
						<li><a href="#">宝鸡</a></li>
						<li><a href="#">包头</a></li>
						<li><a href="#">北京</a></li>
						<li><a href="#">蚌埠 </a></li>
						<li><a href="#">毕节</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					B	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">沧州</a></li>
						<li><a href="#">长春</a></li>
						<li><a href="#">常德</a></li>
						<li><a href="#">重庆</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					C	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">大连</a></li>
						<li><a href="#">大同</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					D	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">鄂尔多斯</a></li>
						<li><a href="#">鄂州</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					E	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">佛山</a></li>
						<li><a href="#">福州</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					F	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">广州</a></li>
						<li><a href="#">贵阳</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					G	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">哈尔滨</a></li>
						<li><a href="#">杭州</a></li>
						<li><a href="#">合肥</a></li>
						<li><a href="#">呼和浩特</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					H	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">佳木斯</a></li>
						<li><a href="#">晋中</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					J	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">昆明</a></li>
						<li><a href="#">开封</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					K	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">兰州</a></li>
						<li><a href="#">临汾</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					L	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">马鞍山</a></li>
						<li><a href="#">绵阳</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					M	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">南京</a></li>
						<li><a href="#">南昌</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					N	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">平顶山</a></li>
						<li><a href="#">莆田</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					P	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">青岛</a></li>
						<li><a href="#">秦皇岛 </a></li>
					</ul>	
				</div>
				<div class="citybox2">
					Q	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">日照</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					R	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">上海</a></li>
						<li><a href="#">深圳</a></li>
						<li><a href="#">沈阳</a></li>
						<li><a href="#">石家庄 </a></li>
					</ul>	
				</div>
				<div class="citybox2">
					S	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">天津</a></li>
						<li><a href="#">太原</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					T	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">潍坊</a></li>
						<li><a href="#">乌鲁木齐</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					W	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">厦门</a></li>
						<li><a href="#">西安</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					X	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">义乌</a></li>
						<li><a href="#">银川 </a></li>
					</ul>	
				</div>
				<div class="citybox2">
					Y	
				</div>
			</div>
			<div class="citybox">
				<div class="citybox1">
					<ul>
						<li><a href="#">珠海</a></li>
						<li><a href="#">张家港</a></li>
						<li><a href="#">镇江</a></li>
						<li><a href="#">中山</a></li>
						<li><a href="#">湛江</a></li>
						<li><a href="#">资阳</a></li>
					</ul>	
				</div>
				<div class="citybox2">
					Z	
				</div>
			</div>
		</div>
		<script type="text/javascript">
			
			function show(){
				if(document.getElementById("top_btn_box").style.display=="none")
				    {   
				    	document.getElementById("top_btn_box").style.display = "block";
				    }
				    else{
				        document.getElementById("top_btn_box").style.display = "none";
				    }
			}
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
						spanNode.innerHTML = "错误".fontcolor("red");
						return false;
					}
				}
				
			}
			function checkemail(){
				var email = document.getElementById("email").value;
				var spanNode = document.getElementById("emailspan");
				var reg = /^[a-z0-9]\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/;
				if(email==""||email==null){
					spanNode.innerHTML = "";
				}else{
					if(reg.test(email)){
					spanNode.innerHTML = "正确".fontcolor("green");
					return true;
					}else{
						spanNode.innerHTML = "错误".fontcolor("red");
						return false;
					}	
				}
				
			}
			function checkpassword(){
				var password = document.getElementById("password").value;
				var spanNode = document.getElementById("repasswordspan");
				var repassword = document.getElementById("repassword").value;
				if(password==""||password==null){
					spanNode.innerHTML = "";
					return false;
				}else{
					if(password == repassword){
					spanNode.innerHTML = "正确".fontcolor("green");
					return true;
					}else{
						spanNode.innerHTML = "两次密码输入不一致".fontcolor("red");
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
		    	var password = checkpassword();
		    	var email = checkemail();
		    	var phone = checkphone();
		    	var yzm = checkyzm();
		    	if (password&&email&&phone&&yzm) {
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
			    /**生成一个随机数**/
			    function randomNum(min, max) {
			        return Math.floor(Math.random() * (max - min) + min);
			    }
			    /**生成一个随机色**/
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
			    /**绘制验证码图片**/
			    function drawPic() {
			        var canvas = document.getElementById("canvas");
			        var width = canvas.width;
			        var height = canvas.height;
			        //获取该canvas的2D绘图环境 
			        var ctx = canvas.getContext('2d'); 
			        ctx.textBaseline ='bottom';
			        /**绘制背景色**/
			        ctx.fillStyle = randomColor(180,240);
			        //颜色若太深可能导致看不清
			        ctx.fillRect(0,0,width,height);
			        /**绘制文字**/
			        var str ='ABCEFGHJKLMNPQRSTWXY123456789';
			
			　　　　 var code="";
			　　　　　//生成四个验证码
			        for(var i=1;i<=4;i++) {
			            var txt = str[randomNum(0,str.length)];
			            code=code+txt;
			            ctx.fillStyle = randomColor(50,160);
			            //随机生成字体颜色
			            ctx.font = randomNum(15,40) +'px SimHei';
			            //随机生成字体大小
			            var x =10 +i *20;
			            var y = randomNum(25,35);
			            var deg = randomNum(-45,45);
			            //修改坐标原点和旋转角度
			            ctx.translate(x, y); 
			            ctx.rotate(deg * Math.PI /180); 
			            ctx.fillText(txt,0,0);
			            //恢复坐标原点和旋转角度
			            ctx.rotate(-deg * Math.PI /180);
			            ctx.translate(-x, -y);
			        }
			        
			        /**绘制干扰线**/
			        for(var i=0;i<3;i++) {
			            ctx.strokeStyle = randomColor(40, 180);
			            ctx.beginPath();
			            ctx.moveTo(randomNum(0,width/2), randomNum(0,height/2));
			            ctx.lineTo(randomNum(0,width/2), randomNum(0,height));
			            ctx.stroke();
			        }
			        /**绘制干扰点**/
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