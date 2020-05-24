<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"> </script>
<script type="text/javascript">
			function addCategory(){
				window.location.href = "${pageContext.request.contextPath}/admin/category/add.jsp";
			}
		</script>
	<script type="text/javascript">
        //加载完毕后 去服务器端获得所有的category数据
        $(function(){

            var content = "";
            $.post(
                "${pageContext.request.contextPath}/product/categoryList",
                function(data){

                    //[{"cid":"xxx","cname":"xxxx"},{},{}]
                    //动态创建<li><a href="#">${category.cname }</a></li>
                    for(var i=0;i<data.length;i++){
                        content+="<tr ><td>"+data[i].cid+"</td>" +"<td>"+data[i].cname+"</td> <td></td><td></td></tr>";
                    }

                    //将拼接好的li放置到ul中
                   // $("#categoryUl").html(content);
					console.log(content);
                    $("#DataGrid1 tbody").append(content);
                },
                "json"
            );
        });
	</script>
</HEAD>
<body>
	<br>
	<table cellSpacing="1" cellPadding="0" width="100%" align="center"
		bgColor="#f5fafe" border="0">
		<TBODY>
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3"><strong>分类列表</strong>
				</TD>
			</tr>
			<tr>
				<td class="ta_01" align="right">
					<button type="button" id="add" name="add" value="添加"
						class="button_add" onclick="addCategory()">
						&#28155;&#21152;</button>

				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					<table cellspacing="0" cellpadding="1" rules="all"
						bordercolor="gray" border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

							<td align="center" width="18%">分类ID</td>
							<td align="center" width="17%">分类名称</td>
							<td width="7%" align="center">编辑</td>
							<td width="7%" align="center">删除</td>
						</tr>
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="18%">1</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="17%">手机数码</td>
								<td align="center" style="HEIGHT: 22px"><a
									href="${ pageContext.request.contextPath }/admin/category/edit.jsp">
										<img
										src="${pageContext.request.contextPath}/images/i_edit.gif"
										border="0" style="CURSOR: hand">
								</a></td>

								<td align="center" style="HEIGHT: 22px"><a
									href="">
										<img src="${pageContext.request.contextPath}/images/i_del.gif"
										width="16" height="16" border="0" style="CURSOR: hand">
								</a></td>
							</tr>
					</table>
				</td>
			</tr>
		</TBODY>
	</table>
</body>
</HTML>

