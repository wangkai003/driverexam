<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<link rel="stylesheet" src="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<style type="text/css">
			body{
				margin: 0px;
				padding: 0px;
			}
			#top-box{
				width: 1365px;
				height: 60px;
				margin: 0 auto;
				padding-top: 18px;
				border-bottom: 2px solid #EBEBEB;
				margin-bottom: 40px;
			}
			#center-box{
				width: 1365px;
				height: 350px;
                background-image: url(${pageContext.request.contextPath}/img/Image10.png);
                background-repeat: no-repeat;
                background-size: 100% 370px;
				padding-top: 116px;
				margin-bottom: 0px;
			}
            #center-box1{
            	width: 248px;
            	height: 36px;
            	margin-left: 590px;
            	margin-bottom: 32px;
            }
            #center-box2{
            	width: 248px;
            	height: 36px;
            	margin-left: 590px;
            	margin-bottom: 30px;
            }
            #center-box3{
            	width: 300px;
            	height: 36px;
            	margin-left: 540px;
            }
            #center-box4{
            	width: 136px;
            	height: 39px;
            	margin-left: 770px;
            	background-color: #FFFFFF;
            	margin-top: 15px;
            }
            input{
            	width: 246px;
            	height: 32px;
            	border: 0px;
            }
            button{
            	width: 120px;
            	height: 35px;
            	background-color:transparent;
            	border: 0px;
            }
            #but1{
            	margin-right: 42px;
            	margin-left: 0px;
            }
            a{
            	margin-left: 20px;
            	font-size: 13px;
            	text-decoration: none;
            }
            #bottom-box{
            	margin-top: 0px;
				text-align: center;	
				color: #ADADAD;
			}
			#zhuce-box{
				width: 903px;
				height: 570px;
				margin: 20px auto;
				padding: 0px;
				border: 1px solid #E0E0E0;
			}
			#top-box-img{
				float: left;
			}
			#top-box1{
				font-size: 22px;
				color: #9D9D9D;
				font-family: "微软雅黑";
				text-align: center;
				margin-top: 8px;
				float: left;
			}
			#mya{
				margin-left: 860px;
				font-size: 16px;
				color: #ADADAD;
			}
		</style>
		<script type="text/javascript">
			window.onload = function(){
				var text = "${loginError}";
				if(text != ""){
					alert(text);
				}
			}
		</script>
	</head>
	<body>
		<div id="top-box">
			<img id="top-box-img" src="${pageContext.request.contextPath}/img/Image7.png"> 
			<div id="top-box1">
			  |&nbsp;&nbsp;后台管理
			   
			</div>
			</div>
		</div>
		<div id="center-box">
			<form action="${pageContext.request.contextPath}/admin/adminLogin.action" method="post" >
				<div id="center-box1">
				   <input type="text" name="adminname"/>
				</div>
				<div id="center-box2">
					<input type="password" name="password"/>
				</div>
				<div id="center-box3">
					<button type="submit" id="but1"></button>
					<button type="reset"></button>
				</div>
				<div id="center-box4">
					<a href="${pageContext.request.contextPath}/index/index.action">返回网站主页</a>
				</div>
			</form>
		</div>
		<div id="bottom-box">
			Copyright © 2015-2018 优估 All Rights Reserved 版权所有 优估(太原) 中北大学信息科技有限公司联系电话：021-10106088
		</div>

	</body>
</html>
