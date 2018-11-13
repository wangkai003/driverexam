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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexbottom.css" />
		<script type="text/javascript">
		   $(function(){
			   $("#admin_a").mouseover(function(){
					$(this).css("color","#F85D00");
				}).mouseout(function(){
					$(this).css("color","#FFFFFF");
				});
		   })
		</script>
	</head>
	<body>
		<div id="bottom-box">
			<div id="bottom-box1" class="bottom-box">
				<ul id="bottom-box1ul">
					<li>关于我们 </li>
					<li class="bottom-box1ul-li">加入我们 </li>
					<li class="bottom-box1ul-li">帮助中心 </li>
					<li class="bottom-box1ul-li">用户反馈 </li>
					<li class="bottom-box1ul-li">网站地图 </li>
					<li class="bottom-box1ul-li"><a id="admin_a" href="${pageContext.request.contextPath}/index/adminLogin.action">后台管理</a></li>
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
