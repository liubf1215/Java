<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/Style1.css"
		  rel="stylesheet" type="text/css" />
	<script language="javascript"
			src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"> </script>


	<script type="text/javascript">
        //加载完毕后 去服务器端获得所有的category数据
        $(function(){

            var content = "";
            $.post(
                "${pageContext.request.contextPath}/collect/all",
                function(data){


                    for(var i=0;i<data.length;i++){
                        var oldTime=data[i].collecttime;
                        var newTime =new Date(oldTime)
                       var commonTime = newTime.toLocaleString();
                        Date.prototype.toLocaleString = function() {
                            return this.getFullYear() + "/" + (this.getMonth() + 1) + "/" + this.getDate() + "/ " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
                        };
                        content+="<tr onmouseover=\"this.style.backgroundColor = 'white'\" onmouseout=\"this.style.backgroundColor = '#F5FAFE';\"><td align=\"center\">"+data[i].coid+"</td><td align=\"center\"> "
                            +commonTime+"</td>"
                            +"<td>"+data[i].name+"</td> " +
                            "<td>"+data[i].uid+"</td>" +
                            "<td>"+data[i].pid+"</td>"
                            </tr>";
                    }

                    //将拼接好的li放置到ul中
                    // $("#categoryUl").html(content);
                    // console.log(content);
                    $("#DataGrid1").append(content);
                },
                "json"
            );
        });
	</script>
</HEAD>
<body>
<br>

<table cellSpacing="1" cellPadding="0" width="100%" align="center"
	   bgColor="#f5fafe" border="0" >

	<tr>
		<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
		</td>
	</tr>
	<tr>
		<td class="ta_01" align="right">
			<button type="button" id="add" name="add" value="添加"
					class="button_add" onclick="addProduct()">
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

					<td align="center" width="18%">收藏ID</td>
					<td align="center" width="17%">收藏时间</td>
					<td align="center" width="17%">收藏人</td>
					<td align="center" width="17%">收藏人ID</td>
					<td align="center" width="17%">收藏商品ID</td>

                    <!--
                    编辑和删除
					<td width="7%" align="center">编辑</td>
					<td width="7%" align="center">删除</td>

					"<td align=\"center\" style=\"HEIGHT: 22px\" ><a\n" +
                            "href=#"+data[i].coid+"><img "+
                            "src=\"#/images/i_edit.gif\"\n" +
                            "border=\"0\" style=\"CURSOR: hand\">\n" +
                            "</a></td>" +
                            "<td align=\"center\" style=\"HEIGHT: 22px\"><a href=/product/delete?coid="+data[i].coid+"> <img src=\"${pageContext.request.contextPath}/images/i_del.gif\"\n" +
                            "width=\"16\" height=\"16\" border=\"0\" style=\"CURSOR: hand\">" +
                            "</a></td>
					!-->

				</tr>
				<TBODY>	</TBODY>
			</table>
		</td>
	</tr>


</table>

</body>
</HTML>

