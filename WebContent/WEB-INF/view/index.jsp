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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<script type="text/javascript">
			function searchName(){
				var searchname = $("#searchname").val();
				location.href="${pageContext.request.contextPath}/car/getAllCar.action?searchname="+searchname;
			}
			function toOrder(obj){
				var idStr = $(obj).attr("alt");
				location.href="${pageContext.request.contextPath}/car/getCarItem.action?id="+idStr;
			}
			
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
				$(".center-boxful a").click(function(){
					$.ajax({
						 type:"post",
						 dataType:"json",
						 url:"${pageContext.request.contextPath}/index/showBrand.action",
						 data:{"category":$(this).html()},
						 success:function(data){
							 $("#td_2_box2").empty();
							 $.each(data,function(i,val){
								 $("#td_2_box2").append('<a href="#">'+val+'</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;');
							 });
						}
					 });
				});
				$("#td_2_box2").on("click" ,"a",function(){
					$("#td_2_box2 a").css("background-color","#FFFFFF"); 
					$("#td_2_box2 a").removeAttr("name");
					$(this).css("background","#F85D00");
					$(this).attr("name","carlist");
					$.ajax({
						 type:"post",
						 dataType:"json",
						 url:"${pageContext.request.contextPath}/index/showCarSeriesByCarBrand.action",
						 data:{"carbrand":$(this).html()},
						 success:function(data){
							 $("#td_2_box3").empty();
							 $.each(data,function(i,val){
								 $("#td_2_box3").append('<a href="#">'+val+'</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;');
							 });
						}
					 });
				});
				$("#td_2_box3").on("click","a",function(){
					$("#td_2_box3 a").css("background-color","#FFFFFF"); 
					$("#td_2_box3 a").removeAttr("name");
					$(this).css("background","#F85D00");
					$(this).attr("name","carSeries");
					var carBrand = null;
					carBrand = $("[name = 'carlist']").html();
					var carSeries = null;
					carSeries = $("[name = 'carSeries']").html();
					location.href="${pageContext.request.contextPath}/index/showCarByCarSeries.action?carBrand="+carBrand+"&carSeries="+carSeries;
				});
				$("#choosePrice").on("click","a",function(){
					$("#choosePrice a").css("background-color","#FFFFFF"); 
					$("#choosePrice a").removeAttr("name");
					$(this).css("background","#F85D00");
					$(this).attr("name","price");
					var carBrand = null;
					carBrand = $("[name = 'carlist']").html();
					var carSeries = null;
					carSeries = $("[name = 'carSeries']").html();
					var price = null;
					price = $("[name = 'price']").html();
					location.href="${pageContext.request.contextPath}/index/showCarByCarPrice.action?carBrand="+carBrand + "&carSeries=" + carSeries + "&price=" + price;
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

	</head>
	<body>
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
		<div id="center-box1">
			<div id="center-box11">
				<ol id="my-ol" class="breadcrumb">
				  <li>您的位置:</li>
				  <li><a href="#">首页</a></li>
				  <li class="active">Data</li>
				</ol>
			</div>
			<div id="center-box12">
				<div>
				    <div class="input-group">
				      <input type="text" class="form-control" placeholder="请输入车辆品牌搜索..." name="searchname" id="searchname" value="${searchname}">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button" onclick="searchName()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
				      </span>
				    </div>
				  </div>

			</div>
		</div>
		<div id="center-box2">
			<table id="center-box2-tb">
				<tr class="tr_1">
					<td class="td_1"><span class="fonts">品牌:</span></td>
					<td class="td_2">
					   <div id="td_2_box1">
					   	   <ul id="td_2_box1_ul" class="center-boxful">
								<li><a href="#">A</a></li>
								<li><a href="#">B</a></li>
								<li><a href="#">C</a></li>
								<li><a href="#">D</a></li>
								<li><a href="#">E</a></li>
								<li><a href="#">F</a></li>
								<li><a href="#">G</a></li>
								<li><a href="#">H</a></li>
								<li><a href="#">I</a></li>
								<li><a href="#">J</a></li>
								<li><a href="#">K</a></li>
								<li><a href="#">M</a></li>
								<li><a href="#">N</a></li>
								<li><a href="#">O</a></li>
								<li><a href="#">P</a></li>
								<li><a href="#">Q</a></li>
								<li><a href="#">R</a></li>
								<li><a href="#">S</a></li>
								<li><a href="#">T</a></li>
								<li><a href="#">U</a></li>
								<li><a href="#">V</a></li>
								<li><a href="#">W</a></li>
								<li><a href="#">X</a></li>
								<li><a href="#">Y</a></li>
								<li><a href="#">Z</a></li>
							</ul>
					   </div>
					   <div id="td_2_box2" class="td_2_box2">
					   	
					   </div>
					</td>
				</tr>
				<tr class="tr_2">
					<td class="td_1"><span class="fonts">车系:</span></td>
					<td class="td_2">
						<ul class="center-boxrightul" id="ul-1">
							<li><a href="#" id="aspan2">不限</a></li>
					    </ul>
					    <div id="td_2_box3">
					    	
					    </div>
					</td>
				</tr>
				<tr class="tr_2">
					<td class="td_1"><span class="fonts">价格:</span></td>
					<td class="td_2">
						<ul class="center-boxrightul" id="choosePrice">
							<li><a href="#" id="aspan2">不限</a></li>							
							<li>
								<form id="car_prize" action="${pageContext.request.contextPath}/index/showCarRange.action" method="post">
									<input type="text" class="input_carprize" name="start" value="${start}"/>&nbsp;&nbsp;-
									<input type="text" class="input_carprize" name="end" value="${end}"/>&nbsp万&nbsp;&nbsp;
									<input type="submit" name="submit" value="确定" style="background: #FF6A4B;color: #FFFFFF;"/>
								</form>
							</li>
					    </ul>
					</td>
				</tr>
				
			</table>
		</div>
		<div id="center-box3">
           <div>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">全部</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active puju" id="home">
			    	<div class="row car-box">
				    	<c:forEach items="${pageBean.list}" var="car">
				    		<div class="car-img" title="${car.carimg}">
							    <div class="thumbnail">
							      <img src="/image/${car.carimg}" alt="${car.id}" onclick="toOrder(this)">
							      <div class="caption">
							        <span class="caption_span1">${car.carBrand}</span>&nbsp;&nbsp;
							        <span class="caption_span1">${car.carSeries}</span><br />
							        <span>${car.carCardFirstTime}</span>&nbsp;
							        |&nbsp;&nbsp;<span>${car.mileage}万公里</span><br />
							        <span class="caption_span2">${car.price}万元</span>
							      </div>
						    </div>
						    </div>
				    	</c:forEach>
				
					</div>
			    </div>
			  </div>
			  
			</div>
				<div id="fenye">
			 <!--分页 -->
				<div>
					<ul class="pagination" style="text-align: center; margin-top:20px;margin-left:200px;">
						<!--上一页 -->
					<c:if test="${pageBean.currentPage==1 }">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageBean.currentPage!=1 }">
						<li>
							<a href="${pageContext.request.contextPath}/car/getAllCar.action?searchname=${searchname}&currentPage=${pageBean.currentPage-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${page==pageBean.currentPage}">
							<li class="active"><a href="javascript:void(0);">${page }</a></li>
						</c:if>
						<c:if test="${page!=pageBean.currentPage}">
							<li><a href="${pageContext.request.contextPath}/car/getAllCar.action?searchname=${searchname}&currentPage=${page}">${page}</a></li>
						</c:if>
					
					</c:forEach>
					
					<!-- 下一页 -->
					<c:if test="${pageBean.currentPage==pageBean.totalPage }">
						<li class="disabled">
							<a href="javascript:void(0);" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
						<li>
							<a href="${pageContext.request.contextPath}/car/getAllCar.action?searchname=${searchname}&currentPage=${pageBean.currentPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					</ul>
				</div>
				<!-- 分页结束 -->
		</div>
		</div>
		<div id="bottom-box">
			<div id="bottom-box1" class="bottom-box">
				<ul id="bottom-box1ul">
					<li>关于我们 </li>
					<li class="bottom-box1ul-li">加入我们 </li>
					<li class="bottom-box1ul-li">帮助中心 </li>
					<li class="bottom-box1ul-li">用户反馈 </li>
					<li class="bottom-box1ul-li">网站地图 </li>
					<li class="bottom-box1ul-li"><a href="${pageContext.request.contextPath}/index/adminLogin.action">后台管理</a></li>
				</ul>
				<img src="${pageContext.request.contextPath}/img/Image2.png" id="img-li"/>
			</div>
			<div id="bottom-box2" class="bottom-box">
				<ul>
					<li>周边城市品牌：</li>
				</ul>
				<ul>
					<li>热门品牌：</li>
				</ul>
				<ul>
					<li>二手车推荐：</li>
				</ul>
			</div>
			<div id="bottom-box3" class="bottom-box">
				<ul id="bottom-box3ul">
					<li>业务合作单位：优信拍（北京）二手车鉴定评估有限公司</li>
					<li>Copyright © 2015-2018 优估 All Rights Reserved 版权所有 优估(上海) 信息科技有限公司联系电话：021-10106088</li>
					<li>沪ICP备15036207号-2  京公网安备 11010502034103号 沪通信管自贸【2018】2号  广播电视节目制作经营许可证：（京）字第07856号   网络文化经营许可证：京网文【2017】 4097-460号 </li>
				    <li id="li-a-img">
				    	<a href=""><img src="${pageContext.request.contextPath}/img/Image3.png"/></a>
				    	<a href=""><img src="${pageContext.request.contextPath}/img/Image4.png" class="imgs"/></a>
				    	<a href=""><img src="${pageContext.request.contextPath}/img/Image5.png" class="imgs"/></a>
				    	<a href=""><img src="${pageContext.request.contextPath}/img/Image6.png" class="imgs"/></a>
				    </li>
				</ul>
			</div>
		</div>
	</body>
</html>
