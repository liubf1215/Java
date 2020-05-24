<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${product.pname}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>



</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath }/">首页&nbsp;&nbsp;&gt;</a> <a href="${pageContext.request.contextPath }/product?method=productList&cid=1">手机数码&nbsp;&nbsp;&gt;</a>
				
			</div>

			<div style="margin: 0 auto; width: 950px;">
				<div class="col-md-6">
					<img style="opacity: 1; width: 400px; height: 350px;" title="${product.pname}"
						class="medium"
						src="${pageContext.request.contextPath }/${product.pimage}" />
						<!--  -->
				</div>

				<div class="col-md-6">
					<div>
						<strong>${product.pname}</strong>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						<div style="display:none">编号：${product.pid}</div>
					</div>

					<div style="margin: 10px 0 10px 0;">
						提取码: <strong style="color: #ef0101;"></strong>
					</div>

					<div style="margin: 10px 0 10px 0;">
						链接地址: <a href=${product.purl}>${product.purl}</a>
					</div>

					<div>


					

						<div style="margin: 20px 0 10px 0;; text-align: center;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=${product.purl} >
							 <input style="background: url('./images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;"
								value="去提取" type="button">
							</a> 
						</div>
							<div style="margin: 20px 0 10px 0;; text-align: center;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/collect/cancel?cid=${product.coid}" >
							 <input style="background: url('./images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;"
								value="取消收藏" type="button">
							</a> 
							
						</div>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/product/list?cid=${cid }&currentPage=${currentPage}">返回列表页面</a>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div style="width: 950px; margin: 0 auto;">
				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>介绍</strong>
				</div>

				<div>
					<img
						src="${pageContext.request.contextPath }/${product.pimage}">
				</div>
		</div>
	</div>


	<!-- 引入footer.jsp -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>

</body>

</html>