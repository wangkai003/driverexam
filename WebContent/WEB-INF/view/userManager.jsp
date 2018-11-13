<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userManager.css" />
	<script type="text/javascript">
		$(function() {
			$("#user-listbox1-ul a").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#999999");
			    }).click(function() {
			    	$(this).css("color","#FFFFFF");
			    });
		})
		function checkpassword(){
				var password = document.getElementById("newpassword").value;
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
		function checkAll(){
		    	var password = checkpassword();
		    	if (password) {
		    		return true;
		    	} else{
		    		return false;
		    	}
		    	return true;
		}
	</script>
	<script type="text/javascript">
		window.onload = function(){
			var text = "${repasswordMessage}";
			if(text != ""){
				alert(text);
			}
		}
	</script>
	</head>
	<body>
	<jsp:include page="indextop.jsp"></jsp:include>
		<div id="user-box">
			<div id="user-listbox">
					<table id="user-listbox1">
						<tr>
							<td id="td-1">
							   	    <ul id="user-listbox1-ul" class="nav nav-pills nav-stacked" role="tablist">
										    <li role="presentation"><a href="#shopa" aria-controls="shopa" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-triangle-right user-listbox1-span" aria-hidden="true"></span>個人信息</a></li>
										    <li role="presentation"><a href="#shopb" aria-controls="shopb" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-triangle-right user-listbox1-span" aria-hidden="true"></span>我买的車</a></li>
										    <li role="presentation"><a href="#shopc" aria-controls="shopc" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-triangle-right user-listbox1-span" aria-hidden="true"></span>我卖的車</a></li>
										    <li role="presentation"><a href="#shopd" aria-controls="shopd" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-triangle-right user-listbox1-span" aria-hidden="true"></span>修改密碼</a></li>
										
									</ul>
							</td>
							<td id="td-2" class="td-2-box">
								<div class="tab-content tab-color">  
										<div role="tabpanel" class="tab-pane" id="shopa">
	                                        <span><h2 >用户信息</h2></span>
											<hr/>
											<table id="tab-2">
												<tr>
													<td class="td-style2"><h4>编号：</h4></td>
													<td><h4>HS—${user.id}</h4></td>
												</tr>
												<tr>
													<td class="td-style2"><h4>账号：</h4></td>
													<td><h4>${user.username}</h4></td>
												</tr>
												<tr>
													<td class="td-style2"><h4>地址：</h4></td>
													<td><h4>${user.address}</h4></td>
												</tr>
												<tr>
													<td class="td-style2"><h4>邮箱：</h4></td>
													<td><h4>${user.email}</h4></td>
												</tr>
											</table>
										</div> 
										<div role="tabpanel" class="tab-pane tab-color" id="shopb">
										    	<h2>买车信息</h2>
										    <p style="text-align: right;">
										    	请联系管理员审核:8888&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										    </p>
											<hr/>
											<table id="tab-3">
												<tr>
													<td>订单号</td>
									                <td>车辆品牌</td>
													<td>订单价格</td>
													<td>订单创建时间</td>
													<td>订单评价</td>
													<td>订单状态</td>
												</tr>
												<c:forEach items="${itemList}" var="item">
													<tr>
														<td>${item.itemnum}</td>
										                <td>${item.car.carBrand}</td>
														<td>${item.itemprice}</td>
														<td>${item.itemtime}</td>
														<td>${item.estimate}</td>
														<c:if test="${item.state eq '0'}">
															<td>未审核</td>
														</c:if>
														<c:if test="${item.state eq '1'}">
															<td>已审核</td>
														</c:if>
													</tr>
												</c:forEach>	
											</table>	
										</div>
										<div role="tabpanel" class="tab-pane tab-color" id="shopc">
										    <span><h2>卖车信息</h2></span>
											<hr/>
											<table id="tab-4">
												<tr>
													<td>车辆品牌</td>
									                <td>车系</td>
													<td>车型</td>
													<td>价格</td>
													<td>里程</td>
													<td>排量</td>
													<td>上牌时间</td>
												</tr>
												<c:forEach items="${carList}" var="car">
													<tr>
														<td>${car.carBrand}</td>
										                <td>${car.carSeries}</td>
														<td>${car.carModel}</td>
										                <td>${car.price}万元</td>
														<td>${car.mileage}万公里</td>
														<td>${car.displacement}L</td>
														<td>${car.carCardFirstTime}</td>
													</tr>
												</c:forEach>
											</table>
										</div>
										<div role="tabpanel" class="tab-pane tab-color" id="shopd">
											<span><h2>修改密码</h2></span>
											<hr/>
											<form action="${pageContext.request.contextPath}/user/repassword.action" method="post" id="" onsubmit="return checkAll()">
												<table id="tab-1">
													<tr>
														<td class="td-style1">原密码：</td>
														<td><input type="password" name="oldpassword" class="form-control"></td>
													</tr>
													<tr>
														<td class="td-style1">新密码：</td>
														<td><input type="password" name="newpassword" id="newpassword" class="form-control"><span></span></td>
													</tr>
													<tr>
														<td class="td-style1">确认密码：</td>
														<td><input type="password" name="" id="repassword" class="form-control" onblur="checkpassword()">  <span id="repasswordspan"></span></td>
													</tr>
													<tr>
														<td colspan="2"><button type="submit" class="btn-primary">提交</button></td>
													</tr>
												</table>
											</form>
										</div>
										<div role="tabpanel" class="tab-pane tab-color" id="shope">
										    <span><h2>我的收藏</h2></span>
											<hr/>
											
										</div>
								</div>
							</td>
						</tr>
					</table>
			</div>
		</div>
		<jsp:include page="indexbottom.jsp"></jsp:include>
	</body>
</html>