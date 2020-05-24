<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
	<script>
        function  sumbitdata(){
            var username = document.getElementById("username").value;
            var password= document.getElementById("inputPassword").value;
            if (username==""|password==""){
                alert("用户名或密码不能为空")
                return false;
			}
            $.ajax({
                url: '${pageContext.request.contextPath}/user/login',
                data:{'username':username,'password':password},
                type: "POST",
                dataType:'json',
                success:function(data){
                    console.log(data);
                 if (data.status==200){
                     window.location.href='${pageContext.request.contextPath}/?username='+data.data.username;
				   }else {
                     alert(data.msg);
				 }




                },
                error : function(data) {
                    alert("出错：" +data);
                    console.log(data);
                }

            });

        }
	</script>

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container .row div {
	/* position:relative;
				 float:left; */
	
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
</style>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>


	<div class="container"
		style="width: 100%; height: 460px; background: #FF2C4C url('/img/images/loginbg.jpg') no-repeat;">
		<div class="row">
			<div class="col-md-7">
				<!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
			</div>

			<div class="col-md-5">
				<div
					style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
					<font>用户登录</font>USER LOGIN
					<div>&nbsp;</div>
					<form class="form-horizontal" method="post" action="${path}/user/login">
						
						<input type="hidden" name="method" value="login">
						
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username" name="username"  value="${usererror.username}"
									placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6"> 
								<input type="password" class="form-control" id="inputPassword" name="password"  value="${usererror.password}"
									placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="yanzhengma"
									placeholder="请输入验证码" value="111">
							</div>
							<div class="col-sm-3">
								<img src="./image/captcha.jhtml" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox" name="autoLogin" value="autoLogin"> 自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
										type="checkbox"> 记住用户名
									</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="button" onclick="sumbitdata()" width="100" value="登录" name="submit"
									style="background: url('/img/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>

</body>
</html>