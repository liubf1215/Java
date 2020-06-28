<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>分享网首页，专注网盘资源分享</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
		
	</head>

	<body >
		<div class="container-fluid">

			<!-- 引入header.jsp -->
			<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
             <!--轮播图-->
        <div >
		<div class="container-fluid" >
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox" style="width:100%">
					<div class="item active">
						<img src="${pageContext.request.contextPath }/img/javalunbo.jpg" alt="." style="width:100%;height:400px" >
						<div class="${pageContext.request.contextPath }/carousel-caption">
							.
						</div>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath }/img/pythonlunbo.PNG" alt="." style="width:100%;height:400px">
						<div class="${pageContext.request.contextPath }/carousel-caption">
							.
						</div>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath }/img/bigdata.jpg" alt="." style="width:100%;height:400px">
						<div class="carousel-caption">
							.
						</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!--热门产品-->
		<div class="container-fluid" style="margin-top: 10px;" style="background-color:#6dcff6">
			<!--上面文字内容-->
			<div class="row">
				<span id="" style="font-size: 30px;padding-left: 33px;">
					热门资源&nbsp;&nbsp;&nbsp;<img src="img/title2.jpg" />
				</span>
			</div>
		</div>
			<!--图片内容-->
			<div class="container-fluid" style="background-color:#6dcff6">

				<c:if test="${empty productList}">
					<font color="#FF0000" >&nbsp;&nbsp;&nbsp;&nbsp;没有商品</font>
				</c:if>


				<c:if test="${!empty productList}">

					<c:forEach items="${productList}" var="pro" varStatus="st">

						<c:if test="${st.index<12}">
						<div class="col-md-2 col-sm-2 col-xs-6" align="center">
							<a href="${pageContext.request.contextPath }/product/info?pid=${pro.pid}">
								<img src="${pageContext.request.contextPath }${pro.pimage}" />
							</a>
							<p>
								<a href="${pageContext.request.contextPath }/product/info?pid=${pro.pid}"><font color="#FF0000">${pro.pname }</font></a>
							</p>
						</c:if>


						</div>

					</c:forEach>
				</c:if>


						</div>








			
			
			<!-- 引入footer.jsp -->
			<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
		
	</body>

</html>