<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
        function upload(){

            if($("#pimage-file").val() == '')return;
            var formData = new FormData();
            formData.append('pimage',document.getElementById('pimage-file').files[0]);

            $.ajax({
                url:'${pageContext.request.contextPath}/product/upload_pimage',
                type:'post',
                data:formData,
                contentType:false,
                processData:false,
                success:function(data){
                    console.log(data);

                    if(data.type == 'success'){
                        $("#preview-pimage").attr('src',data.filepath);
                        $("#edit-pimage").val(data.filepath);
                    }else{

                    }
                },
                error:function(data){


                }
            });
        }

        function uploadpimage(){
            $("#pimage-file").click();

        }
	</script>
	<script>

	</script>

</HEAD>

<body>
<!--  -->
<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/product/updateData" method="post" enctype="multipart/form-data">




	<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
				height="26">
				<strong><STRONG>添加商品</STRONG>
				</strong>
			</td>
		</tr>

		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				商品名称：
			</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="pname" value="${product.pname}" id="pname" class="bg"/>
			</td>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				是否热门：
			</td>
			<td class="ta_01" bgColor="#ffffff">
				<select name="isHot">
					<c:if test="${product.isHot=1}">
					<option value="1">是</option>
					</c:if>
					<c:if test="${product.isHot!=1}">
					<option value="0">否</option>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				Url地址：
			</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="purl" value="${product.purl}" id="logonName" class="bg"/>
			</td>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				获取码：
			</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="pcode" value="${product.pcode}" id="userAction_save_do_logonName" class="bg"/>
			</td>
		</tr>
		<input type="file" id="pimage-file" style="display:none;" onchange="upload()">
		<tr>
			<td width="60" align="right">图片预览:</td>
			<td >
				<img id="preview-pimage" style="float:left;" src="${product.pimage}" width="100px">
				<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadpimage()" plain="true">上传图片</a>
			</td>

			<td width="60" align="right">图片:</td>
			<td><input type="text" id="edit-pimage" name="pimage" value="" readonly="readonly" class="wu-text " /></td>
		</tr>

		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				所属分类：
			</td>
			<td class="ta_01" bgColor="#ffffff" colspan="3">
				<select id="cid" name="cid">
                   <c:if test="1">

				   </c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
				备注：
			</td>
			<td class="ta_01" bgColor="#ffffff" colspan="3">
				<textarea name="pdesc" rows="5" cols="30" ></textarea>
			</td>
		</tr>
		tr>
		<td class="ta_01" style="WIDTH: 100%" align="center"
			bgColor="#f5fafe" colSpan="4">
			<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
				&#30830;&#23450;
			</button>

			<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
			<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

			<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
			<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
			<span id="Label1"></span>
		</td>
		</tr>

	</table>
</form>
</body>
</HTML>