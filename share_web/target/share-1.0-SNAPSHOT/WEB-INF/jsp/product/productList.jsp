<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
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

	<div class="container-fluid" style="background-color:#6dcff6">
		<c:if test="${empty pageInfo.list}">
		   <font color="#FF0000" >&nbsp;&nbsp;&nbsp;&nbsp;没有商品,请浏览其他商品页</font>
		</c:if>
		
		
		<c:if test="${!empty pageInfo.list}">


		<c:forEach items="${pageInfo.list}" var="pro">


			<div class="col-md-2 col-sm-2 col-xs-6" align="center" style="height:250px">
			     <a href="${pageContext.request.contextPath }/product/info?pid=${pro.pid}&cid=${cid}&pageNum=${pageInfo.pageNum}">
					<img src="${pageContext.request.contextPath }${pro.pimage}"  style="display: inline-block">
				</a>
				<p>
					<a href="${pageContext.request.contextPath }/product/info?pid=${pro.pid}&cid=${cid}&pageNum=${pageInfo.pageNum}" style='color: green'>${pro.pname }</a>
				</p>
				<p>
					<font color="#FF0000"></font>
				</p>
				
			</div>



		</c:forEach>

        </c:if>

	</div>






	<!--分页	-->
	<div class="container-fluid" style="background-color:#6dcff6">
		<div class="row">
	<div class="col-md-offset-4 col-sm-offset-4 col-xsoffset-4" style="width: 380px; margin: 0 auto; margin-top: 50px;align-content: center">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
		
			<!-- 上一页 -->
			<c:if test="${pageInfo.pageNum==1 }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageInfo.pageNum!=1 }">
				<li>
					<a href="${pageContext.request.contextPath}/product/list?cid=${cid}&pn=${pageInfo.pageNum-1 }" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			
		
			<!-- 显示每一页 -->
			<c:forEach begin="1" end="${pageInfo.total }" var="page">
				<!-- 判断是否是当前页 -->
				<c:if test="${page==pageInfo.pageNum }">
					<li class="active"><a href="javascript:void(0);">${page }</a></li>
				</c:if>
				<c:if test="${page!=pageInfo.pageNum }">
					<li><a href="${pageContext.request.contextPath}/product/list?cid=${cid}&pn=${page }">${page }</a></li>
				</c:if>
			</c:forEach>
			
			
			<!-- 下一页 -->
			<c:if test="${pageInfo.pageNum==pageInfo.total }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageInfo.pageNum!=pageInfo.total }">
				<li>
					<a href="${pageContext.request.contextPath}/product/list?cid=${cid}&pn=${pageInfo.pageNum+1 }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			
		</ul>
	</div>
	  </div>
	</div>

	<!-- 分页结束 -->





	<!-- 引入footer.jsp -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>

</body>

</html>