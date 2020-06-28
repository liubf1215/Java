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
        function addProduct(){
            window.location.href = "${pageContext.request.contextPath}/admin/product/add.jsp";
        }
        function sumbitData(){
            var content = "";

            $.post(
                "${pageContext.request.contextPath}/product/search",
                { pname : $("#pname").val() },          
                function(data){                
					   $('#DataGrid1 tbody').html('');
			    
			
			
			


                    for(var i=0;i<data.length;i++){
                        content+="<tr onmouseover=\"this.style.backgroundColor = 'white'\" onmouseout=\"this.style.backgroundColor = '#F5FAFE';\"><td align=\"center\">"+data[i].pid+"</td><td align=\"center\"><img src="+data[i].pimage+" width=\"90\" height=\"60\" >"+"</td>"
                            +"<td>"+data[i].pname+"</td> " +
                            "<td>"+data[i].purl+"</td>" +
                            "<td>"+data[i].pcode+"</td>" +
                            "<td align=\"center\" style=\"HEIGHT: 22px\" ><a\n" +
                            "href=${pageContext.request.contextPath}/product/update?pid="+data[i].pid+"><img "+
                            "src=\"${pageContext.request.contextPath}/images/i_edit.gif\"\n" +
                            "border=\"0\" style=\"CURSOR: hand\">\n" +
                            "</a></td>" +
                            "<td align=\"center\" style=\"HEIGHT: 22px\"><a href=${pageContext.request.contextPath}/product/delete?pid="+data[i].pid+"> <img src=\"${pageContext.request.contextPath}/images/i_del.gif\"\n" +
                            "width=\"16\" height=\"16\" border=\"0\" style=\"CURSOR: hand\">" +
                            "</a></td></tr>";
                    }

                    //将拼接好的li放置到ul中
                    // $("#categoryUl").html(content);

                    $("#DataGrid1").append(content);
                },
                "json"
            );
        }
	</script>

	<script type="text/javascript">
        //加载完毕后 去服务器端获得所有的category数据
        $(function(){

            var content = "";
            $.post(
                "${pageContext.request.contextPath}/product/all",
                function(data){


                    for(var i=0;i<data.length;i++){
                        content+="<tr onmouseover=\"this.style.backgroundColor = 'white'\" onmouseout=\"this.style.backgroundColor = '#F5FAFE';\"><td align=\"center\">"+data[i].pid+"</td><td align=\"center\"><img src="+data[i].pimage+" width=\"90\" height=\"60\" >"+"</td>"
                            +"<td>"+data[i].pname+"</td> " +
                            "<td>"+data[i].purl+"</td>" +
                            "<td>"+data[i].pcode+"</td>" +
                            "<td align=\"center\" style=\"HEIGHT: 22px\" ><a\n" +
                            "href=${pageContext.request.contextPath}/product/update?pid="+data[i].pid+"><img "+
                            "src=\"${pageContext.request.contextPath}/images/i_edit.gif\"\n" +
                            "border=\"0\" style=\"CURSOR: hand\">\n" +
                            "</a></td>" +
                            "<td align=\"center\" style=\"HEIGHT: 22px\"><a href=${pageContext.request.contextPath}/product/delete?pid="+data[i].pid+"> <img src=\"${pageContext.request.contextPath}/images/i_del.gif\"\n" +
                            "width=\"16\" height=\"16\" border=\"0\" style=\"CURSOR: hand\">" +
                            "</a></td></tr>";
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
			<td class="ta_01" align="center">


						<input type="text" class="form-control" id="pname" name="pname" placeholder="Search" width="30%">
						<button onclick="sumbitData()" class="btn btn-default">搜索</button>
		



			</td>
		</tr>
		<tr>
			<td class="ta_01" align="center" bgColor="#f5fafe">
				<table cellspacing="0" cellpadding="1" rules="all"
					   bordercolor="gray" border="1" id="DataGrid1"
					   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
					<thead>
					<tr  style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

						<td align="center" width="18%">ID</td>
						<td align="center" width="17%">产品图片</td>
						<td align="center" width="17%">产品名称</td>
						<td align="center" width="17%">Url</td>
						<td align="center" width="17%">获取码</td>
						<td width="7%" align="center">编辑</td>
						<td width="7%" align="center">删除</td>
					</tr>
					</thead>
				<TBODY>
				</TBODY>
				</table>
			</td>
		</tr>


	</table>

</body>
</HTML>

