<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax-xml.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indextop.css" />
		<script type="text/javascript">
			$(function(){
				$("#top-ul a").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#000000");
				});
				$("#td_2_box2 a").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#000000");
				}); 
				$("#center-box2 a").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#000000");
				});
				$("#aspan1 ,#aspan2 , #aspan3").mouseover(function(){
					$(this).css("color","#FFFFFF");
				}).mouseout(function(){
					$(this).css("color","#FFFFFF");
				});
				$("a[role]").css("color","#000000");
				$("a[role]").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#000000");
				}).mouseup(function(){
					$(this).css("color","#F85D00");
				}).mouseleave(function(){
					$(this).css("color","#000000");
				});
				$("button.wkbtn").mouseenter(function(){
					$(this).siblings("ul").show();
				});
				$("button.wkbtn").siblings("ul").mouseenter(function(){
					$(this).show();
				}).mouseleave(function(){
					$(this).hide();
				});
				$("#td_2_box1_ul").on("click" ,"a",function(){
					alert($(this).html());
				});
				$("#td_2_box3").on("click","a",function(){
					alert($(this).html());
				});
				$("#td_2_box2").on("click" ,"a",function(){
					alert($(this).html());
				});
				$("#top_btn").click(function(){
				   if(document.getElementById("top_btn_box").style.display=="none")
				    {
				    	$("#top_btn_box").show();
				    }
				    else{
				     	$("#top_btn_box").hide();
				    }
			    });
			})
		</script>
		<div id="top-box">
			<div id="top-box1">
				<div id="top-box11">
					<img src="${pageContext.request.contextPath}/img/login.png"/>
				</div>
				<div id="top-box12">
					<button id="top_btn" class="btn btn-default dropdown-toggle top-btn">首页 <span class="caret"></span></button>
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
				</div>
			</div>
			<div id="top-box2">
				<ul id="top-ul">
					<c:if test="${empty user}">
						<li>
						<a href="${pageContext.request.contextPath}/index/login.action">登录</a>/
						<a href="${pageContext.request.contextPath}/index/register.action">注册</a>
						</li>
					</c:if>
					<c:if test="${!empty user}">
						<li>
						<a href="${pageContext.request.contextPath}/user/getUserInfo.action">欢迎您,${user.username}</a>
						&nbsp;/&nbsp;<a href="${pageContext.request.contextPath}/user/logout.action">退出</a>
						</li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/index/showSellCar.action">我要卖车</a></li>
					<li><a href="${pageContext.request.contextPath}/index/index.action">我要买车</a></li>
					<li><a href="${pageContext.request.contextPath}/index/index.action">首页</a></li>
				</ul>
			</div>
		</div>
</head>
<body>

</body>
</html>