<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>

		
        <script language="javascript">
           function del(id)
           {
               if(confirm('您确定删除该条记录吗？'))
               {
                   window.location.href="<%=path %>/CourseServlet?action=delete&id="+id;
               }
           }
           
          
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
	
			&emsp;<button onclick="location.href='CourseServlet?action=list'">返回主界面</button>
				       <span style="color:red">${msg}</span>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#FAFAF1">
					<td height="14" colspan="1" >&nbsp;课程列表&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				
					<td width="12%">课程号</td>
					<td width="12%">课程名称</td>
					<td width="12%">授课老师</td>
					<td width="12%">上课地点</td>
					<td width="12%">星期几</td>
					<td width="12%">上/下/晚</td>
					<td width="12%">第几节</td>
					<td width="14%">操作</td>
		        </tr>	
				<c:forEach items="${list}" var="c" >
				<tr align='center' bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="12%" bgcolor="#FFFFFF" align="center">
						${c.cno}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
						${c.cname}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${c.tname}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${c.place}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${c.weekday}
					</td>
					
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${c.sxw}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${c.lesson}
					</td>
					
					<td width="12%" bgcolor="#FFFFFF" align="center">
						<c:if test="${type==1 }">
					<button onclick="location.href='XkjlServlet?action=xuanke&id=${c.id }&stuno=${sessionScope.student.stuno }&sname=${sessionScope.student.sname }'">选课</button>
					
					</c:if>
					<c:if test="${type==2 }">
					<a href="CourseServlet?action=query&id=${c.id }" >修改</a>
						<a href="#" onclick="del(${c.id})" class="pn-loperator">删除</a>
					</c:if>
					</td>
				</tr>
				</c:forEach>
				
			</table>
			<br>
			
			
			
	</body>
</html>
