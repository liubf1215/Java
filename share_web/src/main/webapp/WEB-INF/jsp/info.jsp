<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>产品信息展示</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
	</head>

	<body>
		<div class="container-fluid">

			<!-- 引入header.jsp -->
			<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>

			<div class="container-fluid">
				<div class="main_con">
					<h2>网站简介</h2>
					<hr/>
					<div>
						<p>
							<font color="red">“分享网”</font>是互联网资源分享
						</p>

						<p>
							
						</p>

						<p>
							更注重培养项目实施管理能力，并密切关注技术革新，不断引入先进的技术，更能给企业带来新的技术体系和理念。
						</p>

						<p>
							一直以来，以深度分享推进产业技术成长，致力于弘扬技术创新，倡导分享、 开放和协作，努力打造高质量的分享网站。
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 引入footer.jsp -->
		<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>

	</body>

</html>