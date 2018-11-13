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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css" />
		<script type="text/javascript">
			$(function(){
				$(".button_style").click(function(){
					$(this).css("color","#FFFFFF");
				});
			})
		</script>
	    <script type="text/javascript">
	    	$(function(){
	    		var flags=0;
	    		$("#car_talk_btn1").click(function(){
	    			$("#car_talk").hide();
	    		});
	    		$("#button1").click(function(){
	    			if("${user}"==null || "${user}"==""){
	    				alert("您还没有登录,请登录后进行操作.");
	    				location.href="${pageContext.request.contextPath}/index/login.action";
	    				return;
	    			}
	    			var con;
	    			con = confirm("您确认提交订单吗？......");
	    			if (con==true&&flags==0) {
	    				flags=1;
	    				//return true;
	    				$.ajax({
	    					 type:"post",
							 dataType:"json",
							 url:"${pageContext.request.contextPath}/order/toOrder.action",
							 data:{
								 	"userid":"${user.id}",
								 	"carid":$("#carId").val()
								 },
							 success:function(data){
								 alert("您已提交成功,请查看我的订单");
								 location.href="${pageContext.request.contextPath}/user/getUserInfo.action";
							}
	    				});
	    			} else{
	    				if(flags==1){
	    					alert("您已经提交，不能重复提交！");
	    				}
	    				return false;
	    			}
	    		});
	    		$("#button3").click(function(){
	    			if("${user}"==null || "${user}"==""){
	    				alert("您还没有登录,请登录后进行操作.");
	    				location.href="${pageContext.request.contextPath}/index/login.action";
	    				return;
	    			}
	    			//此处检测管理员是否确认订单
	    			$.ajax({
	    					 type:"post",
							 dataType:"json",
							 url:"${pageContext.request.contextPath}/order/toEstimate.action",
							 data:{
								 	"userid":"${user.id}",
								 	"carid":$("#carId").val()
								 },
							 success:function(data){
								 if(data==10){//10表示用户未购买
									 alert("您未购买该车辆,无法评价!");
								 }else if(data==0){
									 alert("您的订单未审核,请联系管理员审核!");							 
								 }else if(data==1){
									//弹出用户评价框$("#car_talk").show();
									 $("#car_talk").show();
								 }
							}
	    				});
	    			
	    		});
	    		$("#sub").click(function(){
	    			$.ajax({
   					 type:"post",
						 dataType:"json",
						 url:"${pageContext.request.contextPath}/order/uploadEstimate.action",
						 data:{
							 	"estimate":$("#estimate").val(),
							 	"carid":$("#carId").val()
							 },
						 success:function(data){
							 
							 if(data==1){
								 alert("评价成功,请到我的订单查看!");
								 location.href="${pageContext.request.contextPath}/user/getUserInfo.action";
							 }else if(data==0){
								 alert("评价失败,请联系管理员!");
							 }else if(data==2){
								 alert("您已评价,请勿再评价!");
							 }
						}
   					});
	    		});
	    	})
	    </script>
</head>
<body>
   <jsp:include page="indextop.jsp"></jsp:include>
       <div id="car-show">
       		<input type="hidden" value="${car.id}" id="carId"/>
			<div id="car-show1">
				<img alt="" src="/image/${car.carimg}" width="600px" height="360px">
			</div>
			<div id="car-show2">
				<div class="car-show2-box" id="car-show2-box1">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="car-show2-box-span1">${car.carBrand}</span>&nbsp;&nbsp;
					<span>${car.carSeries} </span>&nbsp;&nbsp;&nbsp;
					
				</div>
				<div class="car-show2-box" id="car-show2-box2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="car-show2-box-span2">价格:</span>
					<span >${car.price}万元</span>
				</div>
				<div class="car-show2-box" id="car-show2-box3">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="car-show2-box-span3">上牌时间:${car.carCardFirstTime} </span>&nbsp;&nbsp;
					<span>表显里程:${car.mileage}万公里</span>&nbsp;&nbsp;
					<span>排量:${car.displacement}L</span>
				</div>
				<div class="car-show2-box" id="car-show2-box4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<span id="car-show2-box-span4">车主 </span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span>${seller.username}</span>
				</div>
				<div class="car-show2-box">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="button_style btn btn-default" id="button1">购买车辆</button>
			
					<button class="button_style btn btn-default" id="button3">评价车辆</button>
				</div>
			</div>
		</div>
		<div id="car_talk">
			<div id="textarea_box">
				
					<h4>用户评价</h4>
					<textarea class="form-control" rows="14" name="estimate" id="estimate"></textarea>
					<button type="button" name="submit" class="btn btn-primary" id="sub">提交</button>
				
				<button id="car_talk_btn1" name="submit" class="btn btn-warning">关闭</button>
			</div>
		</div>
   <jsp:include page="indexbottom.jsp"></jsp:include>
</body>
</html>