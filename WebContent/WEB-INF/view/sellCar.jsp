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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sellCar.css" />
		<script type="text/javascript">
			function show(){
				if(document.getElementById("top_btn_box1").style.display=="none")
				    {   
				    	document.getElementById("top_btn_box1").style.display = "block";
				    }
				    else{
				        document.getElementById("top_btn_box1").style.display = "none";
				    }
			}
			$(function(){
				$("#top_btn_box1 a").click(function(){
					$(".input_yzm2").val($(this).text());
					document.getElementById("top_btn_box1").style.display = "none";
					
				});
				$("#top_btn_box2 a").click(function(){
					$(".input_yzm3").val($(this).text());
				});
			})
			function checkAll(){
		    	var s1 = $("#input1").val();
		    	var s2 = $("#input2").val();
		    	var s3 = $("#input3").val();
		    	var s4 = $("#input4").val();
		    	var s5 = $("#input5").val();
		    	var s6 = $("#input6").val();
		    	var s7 = $("#input7").val();
		    	var s8 = $("#input8").val();
		    	var s9 = $("#input9").val();
		    	if(s1==""||s2==""||s3==""||s4==""||s5==""||s6==""||s7==""||s8==""||s9==""){
		    		alert("请重新输入");
		    		return false;
		    	}else{
		    		var pailiang = checkpailiang();
			    	var mile = checkmile();
			    	var price =checkprice();
			    	if (pailiang&&mile&&price) {
			    		return true;
			    	} else{
			    		return false;
			    	}
		    	}
		    }
			function checkpailiang() {
				var reg = /^(-?\d+)(\.\d+)?$/;
				if (!reg.test($("#input7").val())) {
				  alert("请输入数字")
				  return false;
				}else{
					return true;
				}
			 }
			function checkmile() {
				var reg = /^(-?\d+)(\.\d+)?$/;
				if (!reg.test($("#input8").val())) {
				  alert("请输入数字")
				  return false;
				}else{
					return true;
				}
			 }
			function checkprice() {
				var reg = /^(-?\d+)(\.\d+)?$/;
				if (!reg.test($("#input9").val())) {
				  alert("请输入数字")
				  return false;
				}else{
					return true;
				}
			 }
		</script>
	 
	</head>
	<body>
		<jsp:include page="indextop.jsp"></jsp:include>
		<div id="table-box">
			<form action="${pageContext.request.contextPath}/car/uploadCarInfo.action" method="post" onsubmit="return checkAll()" enctype="multipart/form-data">
				<table>
				 	    <tr>
				 	   	  <td class="table-box-td1">车辆品牌</td>
				 	   	  <td>
				 	   	  	<input id="input1" type="text" name="carBrand" class="form-control" placeholder="请输入车辆品牌"/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">车辆车系</td>
				 	   	  <td>
				 	   	  	<input id="input2"type="text" name="carSeries" class="form-control" placeholder="请输入车辆车系"/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">车辆车型</td>
				 	   	  <td>
				 	   	  	<input id="input3"type="text" name="carModel" class="form-control" placeholder="请输入车辆车型"/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	      <td class="table-box-td1">城市</td>
				 	   	  <td>
				 	   	  	<input id="input4" type="text" name="iocationCity" class="form-control input_yzm2" placeholder="请输入城市"/>
				 	   	  </td>
				 	   	  <td>
				 	   	  	 <button id="top_btns" class="btn btn-default" type="button" onclick="show()"><span class="caret"></span></button>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">上牌时间</td>
				 	   	  <td>
				 	   	  	<input id="input5" type="date" name="carCardFirstTime" class="form-control"placeholder="请输入上牌时间"/>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">车辆颜色</td>
				 	   	  <td>
				 	   	  	<input id="input6" type="text" name="carColor" class="form-control input_yzm3"placeholder="请输入车辆颜色"/>
				 	   	  </td>
				 	   	  <td>
				 	   	  	<div class="btn-group"  id="top_btn_box2">
							  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							   <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu">
							    <li><a href="#">红</a></li>
							    <li><a href="#">黑</a></li>
							    <li><a href="#">白</a></li>
							    <li><a href="#">棕</a></li>
							    <li><a href="#">黄</a></li>
							    <li><a href="#">银</a></li>
							    <li><a href="#">蓝</a></li>
							    <li><a href="#">绿</a></li>
							  </ul>
							</div>
				 	   	  </td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">排量</td>
				 	   	  <td>
				 	   	  	<input id="input7"type="text" name="displacement" class="form-control" placeholder="请输入排量"/>
				 	   	  </td>
				 	   	  <td><h4>L</h4></td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">行驶里程</td>
				 	   	  <td>
				 	   	  	<input id="input8"type="text" name="mileage" checkmile class="form-control" placeholder="请输入行驶里程"/>
				 	   	  </td>
				 	   	   <td><h4>万公里</h4></td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">出售价格</td>
				 	   	  <td>
				 	   	  	<input id="input9" type="text" name="price" class="form-control" placeholder="请输入出售价格"/>
				 	   	  </td>
				 	   	   <td><h4>万元</h4></td>
				 	    </tr>
				 	    <tr>
				 	   	  <td class="table-box-td1">车辆图片</td>
				 	   	  <td>
				 	   	  	<input type="file" name="file" class="form-control" placeholder="请输入"/>
				 	   	  </td>
				 	    </tr>
				 	     <tr>
				 	   	  <td colspan="3">
				 	   	  	<button id="submit"type="submit" class="btn btn-lg">提交</button>
				 	   	  	<button id="reset"type="reset" class="btn btn-lg">重置</button>
				 	   	  </td>
				 	    </tr>
				</table>
			</form>
		</div>
    <div id="top_btn_box1">
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
		<jsp:include page="indexbottom.jsp"></jsp:include>
	</body>
</html>
