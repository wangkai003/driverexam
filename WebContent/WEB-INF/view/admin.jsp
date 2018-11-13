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
		<script type="text/javascript">
			function searchUser(){
				var searchname = $("#searchname").val();
				location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchname="+searchname;
			}
			function searchItem(){
				var searchItemNum = $("#searchItemNum").val();
				location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchItemNum="+searchItemNum;
			}
			function searchCar(){
				var searchCarBrand = $("#searchCarBrand").val();
				location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchCarBrand="+searchCarBrand;
			}
			
			function showUserModal(username,password){
				$('#updateUser').modal();
				$("#userPassword").val(password);
				$("#username").val(username);
			}
			
			function showItemModal(id,state){
				$('#updateItem').modal();
				$("#itemState").val(state);
				$("#itemId").val(id);
			}
			function showCarModal(id,carBrand,carSeries,carModel,price,mileage,displacement){
				$('#updateCar').modal();
				$("#carid").val(id);
				$("#carBrand").val(carBrand);
				$("#carSeries").val(carSeries);
				$("#carModel").val(carModel);
				$("#price").val(price);
				$("#mileage").val(mileage);
				$("#displacement").val(displacement);
			}
			
			function deleteUser(id){
				var result = confirm("您确认要删除吗?")
				if(result == true){
					$.ajax({
						type:"post",
						dataType:"json",
						url:"${pageContext.request.contextPath}/admin/deleteUser.action",
						data:{
							"id":id
						},
						success:function(data){
							if(data == 1){
								alert("删除成功!");
							}else if(data == 0){
								alert("删除失败!");
							}
						}
					});
				}
			}
			
			function deleteItem(id){
				var result = confirm("您确认要删除吗?")
				if(result == true){
					$.ajax({
						type:"post",
						dataType:"json",
						url:"${pageContext.request.contextPath}/admin/deleteItem.action",
						data:{
							"id":id
						},
						success:function(data){
							if(data == 1){
								alert("删除成功!");
							}else if(data == 0){
								alert("删除失败!");
							}
						}
					});
				}
			}
			
			function deleteCar(id){
				var result = confirm("您确认要删除吗?")
				if(result == true){
					$.ajax({
						type:"post",
						dataType:"json",
						url:"${pageContext.request.contextPath}/admin/deleteCar.action",
						data:{
							"id":id
						},
						success:function(data){
							if(data == 1){
								alert("删除成功!");
							}else if(data == 0){
								alert("删除失败!");
							}
						}
					});
				}
			}
			
		</script>
		<style type="text/css">
			@media only screen and (min-width: 768px) {
				#slider_sub{
					width: 250px;
					margin-top: 55px;
					position: absolute;
					z-index: 1;
					height: 600px;
				}
				.mysearch{
					margin: 12px 0;
				}
				.page_min{
					margin-left: 255px;
					margin-top: 0px;
				}
			}
			.fonts{
				font-size:17px;
				
			}
			.sty-size{
				margin-left:10px;
			}
			#box{
				margin-left: 256px;
				height: 590px;
				display: none;
			}
			#box2{
				margin-left: 256px;
				height: 590px;
				display: none;
			}
			#box3{
				margin-left: 256px;
				height: 590px;
				display: none;
			}
			.colors{
				background-color: #E3E3E3;
			}
			.mytable{
				width:900px;
				text-align: center;
			}
			.mytable tr th{
				height: 30px;
				text-align: center;
			}
			.mybox-1{
				width: 320px;
				margin-top: 20px;
				margin-left: 60px;
			}
			.mybox-2{
				margin-top: 30px;
				margin-left: 250px;
			}
			td{
				height: 30px;
			}
		</style>
		<script type="text/javascript">
		    function runtime(){
                   document.getElementById("myspantime").innerHTML= new Date().toLocaleString();
		    }
			$(function() {
				$("#sub1-a1").click(function() {
					$("#box").show();
					$("#box2").hide();
					$("#box3").hide();
				});
				$("#sub2-a1").click(function() {
					$("#box2").show();
					$("#box").hide();
					$("#box3").hide();
				});
				$("#sub3-a1").click(function() {
					$("#box3").show();
					$("#box2").hide();
					$("#box").hide();
				});
				
			   window.setInterval("runtime()",1);
				
				$("#updatePassword").on("click",function(){			
					$.ajax({
	   					     type:"post",
							 dataType:"json",
							 url:"${pageContext.request.contextPath}/admin/updatePassword.action",
							 data:{
								 	"username":$("#username").val(),
								 	"password":$("#userPassword").val()
								 },
							 success:function(data){
								 if(data==1){
									 alert("重置密码成功!");
									 //隐藏模态框
									 $('#updateUser').modal('hide');
									 location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action";
								 }else if(data == 0){
									 alert("重置密码失败!");	
									 $('#updateUser').modal('hide');
								 }
							}
	   				});
				});
				
				$("#updateState").on("click",function(){			
					$.ajax({
	   					     type:"post",
							 dataType:"json",
							 url:"${pageContext.request.contextPath}/admin/updateState.action",
							 data:{
								 	"id":$("#itemId").val(),
								 	"state":$("#itemState").val()
								 },
							 success:function(data){
								 alert("修改状态成功!");
								 //隐藏模态框
								 $('#updateItem').modal('hide');
								 location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action";
							}
	   				});
				});
				
				$("#updateCarInfo").on("click",function(){	
					$.ajax({
	   					     type:"post",
							 dataType:"json",
							 url:"${pageContext.request.contextPath}/admin/updateCar.action",
							 data:{
								 	"id":$("#carid").val(),
								 	"carBrand":$("#carBrand").val(),
								 	"carSeries":$("#carSeries").val(),
								 	"carModel":$("#carModel").val(),
								 	"price":$("#price").val(),
								 	"mileage":$("#mileage").val(),
								 	"displacement":$("#displacement").val(),
								 },
							 success:function(data){
								 if(data == 1){
									 alert("修改车辆信息成功!");
									 //隐藏模态框
									 $('#updateItem').modal('hide');
									 location.href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action";
								 }else if(data == 0){
									 alert("修改车辆信息失败!");							 
								 }
						    }
	   				});
				});
			})
		</script>
	</head>
	<body>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="navbar-header">
			<button type="button"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">网站后台管理</a>
		</div>
		<ul class="nav navbar-nav navbar-right" style="margin-right: 60px;margin-top: 15px;">
			<a href="${pageContext.request.contextPath}/index/index.action" class="sty-size"><span class="fonts">首页</span></a>
			<a href="#" class="sty-size"><span class="fonts" id="myspantime"></span></a>
			<c:if test="${empty admin}">
				<a href="#" class="sty-size"><span class="badge ">管理员</span></a>
			</c:if>
			<c:if test="${!empty admin}">
				<a href="#" class="sty-size"><span class="badge ">${admin.adminname}</span></a>
			</c:if>
			<a href="${pageContext.request.contextPath}/admin/adminLogout.action" style="margin-left: 25px;"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a>
		</ul>
		
		<!--侧边功能导航栏-->
		<div class="navbar-default navbar-collapse colors" id="slider_sub">
			<ul class="nav">
				<li>
					<a href="#sub1" data-toggle="collapse">用户管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					<ul id="sub1" class="nav collapse">
						<li>
							<a id="sub1-a1" href="#" style="margin-left: 10px;">
								<span class="glyphicon glyphicon-search"></span>&nbsp;用户查询
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#sub2" data-toggle="collapse">订单管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
				    <ul id="sub2" class="nav collapse">
						<li>
							<a id="sub2-a1" href="#" style="margin-left: 10px;">
								<span class="glyphicon glyphicon-search"></span>&nbsp;订单查询
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#sub3" data-toggle="collapse">车辆管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
					 <ul id="sub3" class="nav collapse">
						<li>
							<a id="sub3-a1" href="#" style="margin-left: 10px;">
								<span class="glyphicon glyphicon-search"></span>&nbsp;车辆查询
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>	
        <!--主要显示区-->
        <div id="box" class="" style="border: #000000 solid 1px;">
        	<div id="" class="mybox-1">
        			
					<div class="input-group">
					    <input type="text" class="form-control" placeholder="请输入用户账号搜索..." name="searchname" id="searchname" value="${searchname}"/>
					    <span class="input-group-btn">
					       <button class="btn btn-default" type="button" onclick="searchUser()">
					       		<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					       </button>
					    </span>
					</div>
			</div>
        	<div class="mybox-2">
        		<table class="table table-hover table-striped mytable">
					    <tr>
					      <th><input type="checkbox" value="" name=""/></th>
					      <th>账号</th>
					      <th>密码</th>
					      <th>地址</th>
					      <th>邮箱</th>
					      <th>操作</th>
					    </tr>
					    <c:forEach items="${userList}" var="user">
					    	<tr>
						      <td><input type="checkbox" value="${user.id}" name=""/></td>
						      <td>${user.username}</td>
						      <td>${user.password}</td>
						      <td>${user.address}</td>
						      <td>${user.email}</td>
						      <td>
						      	<button class="btn btn-primary" onclick='showUserModal("${user.username}","${user.password}")'>
						      		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						      		编辑
						      	</button>
						      	<button class="btn btn-danger" onclick='deleteUser("${user.id}")'>
						      		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						      		删除
						      	</button>
						      </td>
					    	</tr>
						</c:forEach>
				
				</table>
				<!--分页 -->
				<div>
					<ul class="pagination" style="text-align: center; margin-top:0px;margin-left:225px;">
						<!--上一页 -->
					<c:if test="${userPageBean.currentPage==1 }">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${userPageBean.currentPage!=1 }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchname=${searchname}&currentPage=${userPageBean.currentPage-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach begin="1" end="${userPageBean.totalPage}" var="page">
						<c:if test="${page==userPageBean.currentPage}">
							<li class="active"><a href="javascript:void(0);">${page }</a></li>
						</c:if>
						<c:if test="${page!=userPageBean.currentPage}">
							<li><a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchname=${searchname}&currentPage=${page}">${page}</a></li>
						</c:if>
					
					</c:forEach>
					
					<!-- 下一页 -->
					<c:if test="${userPageBean.currentPage==userPageBean.totalPage}">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${userPageBean.currentPage!=userPageBean.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchname=${searchname}&currentPage=${userPageBean.currentPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					</ul>
				</div>
				<!-- 分页结束 -->
        	</div>
        </div>
        <div id="box2" class="" style="border: #000000 solid 1px;">
        	<div id="" class="mybox-1">
					<div class="input-group">
					    <input type="text" class="form-control" placeholder="请输入订单号搜索..."name="searchItemNum" id="searchItemNum" value="${searchItemNum}">
					    <span class="input-group-btn">
					       <button class="btn btn-default" type="button" onclick="searchItem()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
					    </span>
					</div>
			</div>
			<!--
            	作者：wk@163.com
            	时间：2018-09-07
            	描述：订单对应的div
            -->
        	<div class="mybox-2">
        		<table class="table table-hover table-striped mytable">
					    <tr>
					      <th><input type="checkbox" value="" name=""/></th>
					      <th>订单号</th>
					      <th>车辆品牌</th>
					      <th>价格</th>
					      <th>创建时间</th>
					      <th>评价</th>
					      <th>状态</th>
					      <th>操作</th>
					    </tr>
					    <c:forEach items="${itemList}" var="item">
					    	<tr>
						      <td><input type="checkbox" value="${item.id }" name="" /></td>
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
						      <td>
						      	<button class="btn btn-primary edit" onclick='showItemModal("${item.id }","${item.state}")'>
						      		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						      		编辑
						      	</button>
						      	<button class="btn btn-danger" onclick='deleteItem("${item.id }")'>
						      		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						      		删除
						      	</button>
						      </td>
					    	</tr>
					    </c:forEach>
				</table>
					<!--分页 -->
				<div>
					<ul class="pagination" style="text-align: center; margin-top:0px;margin-left:225px;">
						<!--上一页 -->
					<c:if test="${itemPageBean.currentPage==1 }">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${itemPageBean.currentPage!=1 }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchItemNum=${searchItemNum}&currentPage=${itemPageBean.currentPage-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach begin="1" end="${itemPageBean.totalPage}" var="page">
						<c:if test="${page==itemPageBean.currentPage}">
							<li class="active"><a href="javascript:void(0);">${page }</a></li>
						</c:if>
						<c:if test="${page!=itemPageBean.currentPage}">
							<li><a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchItemNum=${searchItemNum}&currentPage=${page}">${page}</a></li>
						</c:if>
					
					</c:forEach>
					
					<!-- 下一页 -->
					<c:if test="${itemPageBean.currentPage==itemPageBean.totalPage}">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${itemPageBean.currentPage!=itemPageBean.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchItemNum=${searchItemNum}&currentPage=${itemPageBean.currentPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					</ul>
				</div>
				<!-- 分页结束 -->
        	</div>
        </div>
        <!--
            	作者：wk@163.com
            	时间：2018-09-07
            	描述：车辆对应的div
        -->
        <div id="box3" class="" style="border: #000000 solid 1px;">
        	<div id="" class="mybox-1">
					<div class="input-group">
					    <input type="text" class="form-control" placeholder="请输入车辆品牌搜索..." name="searchCarBrand" id="searchCarBrand" value="${searchCarBrand}">
					    <span class="input-group-btn">
					       <button class="btn btn-default" type="button" onclick="searchCar()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
					    </span>
					</div>
			</div>
        	<div class="mybox-2">
        		<table class="table table-hover table-striped mytable">
					    <tr>
					      <th><input type="checkbox" value="" name=""/></th>
					      <th>品牌</th>
					      <th>车系</th>
					      <th>车型</th>
					      <th>价格</th>
					      <th>里程</th>
					      <th>排量</th>
					      <th>颜色</th>
					      <th>上牌时间</th>
					      <th>操作</th>
					    </tr>
					    <c:forEach items="${carList}" var="car">
					    	<tr>
					      <td><input type="checkbox" value="${car.id}" name=""/></td>
					      <td>${car.carBrand}</td>
					      <td>${car.carSeries}</td>
					      <td>${car.carModel}</td>
					      <td>${car.price}万元</td>
					      <td>${car.mileage}万公里</td>
					      <td>${car.displacement}L</td>
					      <td>${car.carColor}</td>
					      <td>${car.carCardFirstTime}</td>
					      <td>
					      	<button class="btn btn-primary edit" 
	onclick='showCarModal("${car.id}","${car.carBrand}","${car.carSeries}","${car.carModel}","${car.price}","${car.mileage}","${car.displacement}")'>
					      		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					      		编辑
					      	</button>
					      	<button class="btn btn-danger" onclick='deleteCar("${car.id}")'>
					      		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					      		删除
					      	</button>
					      </td>
					    </tr>
					    </c:forEach>
				</table>
					<!--分页 -->
				<div>
					<ul class="pagination" style="text-align: center; margin-top:0px;margin-left:-200px;">
						<!--上一页 -->
					<c:if test="${carPageBean.currentPage==1 }">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${carPageBean.currentPage!=1 }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchCarBrand=${searchCarBrand}&currentPage=${carPageBean.currentPage-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach begin="1" end="${carPageBean.totalPage}" var="page">
						<c:if test="${page==carPageBean.currentPage}">
							<li class="active"><a href="javascript:void(0);">${page }</a></li>
						</c:if>
						<c:if test="${page!=carPageBean.currentPage}">
							<li><a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchCarBrand=${searchCarBrand}&currentPage=${page}">${page}</a></li>
						</c:if>
					
					</c:forEach>
					
					<!-- 下一页 -->
					<c:if test="${carPageBean.currentPage==carPageBean.totalPage}">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${carPageBean.currentPage!=carPageBean.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath}/admin/getAllInfoByAdmin.action?searchCarBrand=${searchCarBrand}&currentPage=${carPageBean.currentPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					</ul>
				</div>
				<!-- 分页结束 -->
        	</div>
        </div>
        
        <!-- 用户的修改弹框 -->
		<div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">密码重置</h4>
		      </div>
		      <div class="modal-body">
		         <label>重置的密码为:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		         <input type="hidden" value="" id="username"/>
		         <input type="text" id="userPassword" name="password" value=""/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="updatePassword">Submit</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        <!-- 订单的修改弹框 -->
		<div class="modal fade" id="updateItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">订单修改</h4>
		      </div>
		      <div class="modal-body">
		         <label>订单状态修改为:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		         <input type="hidden" value="" id="itemId"/>
		         <input type="text" id="itemState" name="state" value=""/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="updateState">Submit</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 车辆的修改弹框 -->
		<div class="modal fade" id="updateCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">车辆修改</h4>
		      </div>
		      <div class="modal-body">
		         	<input type="hidden" id="carid" value="" name="carid">
					<table>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;车辆品牌&nbsp;&nbsp;&nbsp;&nbsp;</td>
				 	   	  <td>
				 	   	  	<input id="carBrand" type="text" name="carBrand" class="form-control" placeholder="请输入车辆品牌" value=""/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;车辆车系</td>
				 	   	  <td>
				 	   	  	<input id="carSeries"type="text" name="carSeries" class="form-control" placeholder="请输入车辆车系" value=""/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;车辆车型</td>
				 	   	  <td>
				 	   	  	<input id="carModel"type="text" name="carModel" class="form-control" placeholder="请输入车辆车型" value=""/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;出售价格</td>
				 	   	  <td>
				 	   	  	<input id="price" type="text" name="price" class="form-control" placeholder="请输入出售价格" value=""/>
				 	   	  </td>
				 	   	   <td><h4>万元</h4></td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;行驶里程</td>
				 	   	  <td>
				 	   	  	<input id="mileage"type="text" name="mileage" class="form-control" placeholder="请输入行驶里程" value=""/>
				 	   	  </td>
				 	   	   <td><h4>万公里</h4></td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">&nbsp;&nbsp;&nbsp;&nbsp;排量</td>
				 	   	  <td>
				 	   	  	<input id="displacement"type="text" name="displacement" class="form-control" placeholder="请输入排量" value=""/>
				 	   	  </td>
				 	   	  <td><h4>L</h4></td>
				 	    </tr>
				</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="updateCarInfo">Submit</button>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>