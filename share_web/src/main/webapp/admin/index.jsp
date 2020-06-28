<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${pageContext.request.contextPath }/css/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
  <script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>

<style type="text/css">

</style>
</head>
<body style="background: #278296">
<div class="container">
  <div class="row">
    <div class="col-md-12 ">

  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
    <td style="padding-left: 50px">
      <table>
      <tr>
        <td>管理员姓名：</td>
        <td><input type="text" name="username" id="username"/></td>
      </tr>
      <tr>
        <td>管理员密码：</td>
        <td><input type="text" name="password" id="password" /></td>
      </tr>
      <tr><td>&nbsp;</td><td><input type="button" onclick="sumbitdata()" value="进入管理中心"   class="button" /></td></tr>
      </table>
    </td>
  </tr>
  </table>
    </div>
  </div>
</div>

<script language="JavaScript">
    function  sumbitdata(){
        var username = document.getElementById("username").value;
        var password= document.getElementById("password").value;
        if (username==""|password==""){
            alert("用户名或密码不能为空")
            return false;
        }
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/login',
            data:{'username':username,'password':password},
            type: "POST",
            dataType:'json',
            success:function(data){
                console.log(data);
                if (data.status==200){
                    window.location.href='${pageContext.request.contextPath }/admin/home?username='+data.data.username;
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
</body>