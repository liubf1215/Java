<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="${pageContext.request.contextPath }/img/loge.png" />
	</div>
	<div class="col-md-5">
		
	</div>
	<div class="col-md-3" style="padding-top:40px">
		<ol class="list-inline">
			<c:if test="${empty user}">
				<li><a href="login">登录</a></li>
				<li><a href="register">注册</a></li>
			</c:if>
			<c:if test="${!empty user }">
				<li style="color:red">欢迎您，${user.username}</li>
				<li><a href="${pageContext.request.contextPath }/user/logout">退出</a></li>
			</c:if>
			
			
			<li><a href="${pageContext.request.contextPath }/collect/myCollect">我的收藏</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="categoryUl">

				</ul>
				<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/search"  method="post" role="search">
					<div class="form-group">
						<input type="text" class="form-control" name="name" placeholder="Search" value="${name }">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
			//header.jsp加载完毕后 去服务器端获得所有的category数据
			$(function(){
				var content = "";
				$.post(
					"${pageContext.request.contextPath}/product/categoryList",
					function(data){

						//[{"cid":"xxx","cname":"xxxx"},{},{}]
						//动态创建<li><a href="#">${category.cname }</a></li>
						for(var i=0;i<data.length;i++){
							content+="<li><a href='${pageContext.request.contextPath}/product/list?cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
						}
						
						//将拼接好的li放置到ul中
						$("#categoryUl").html(content);
					},
					"json"
				);
			});
		</script>
		
	</nav>
</div>