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
                   window.location.href="<%=path %>/XkjlServlet?action=delete&id="+id;
               }
           }
           
          
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
	
			<form action="<%=path %>/XkjlServlet?action=findByMap" name="formAdd" method="post">
				     <br> &emsp;学号：<input type="text" name="stuno" size="20"/>  &emsp;学生姓名：<input type="text" name="sname" size="20"/> 
					 <input type="submit" value="查询"/>		   
			</form>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#FAFAF1">
					<td height="14" colspan="1" >&nbsp;选课列表&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				
					<td width="8%">学号</td>
					<td width="8%">学生姓名</td>
					<td width="12%">选课时间</td>
					<td width="8%">课程号</td>
					<td width="12%">课程名称</td>
					<td width="7%">授课老师</td>
					<td width="12%">上课地点</td>
					<td width="8%">星期几</td>
					<td width="8%">上/下/晚</td>
					<td width="8%">第几节</td>
					<td width="9%">操作</td>
		        </tr>	
				<c:forEach items="${xkjlList}" var="x" >
				<tr align='center' bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="8%" bgcolor="#FFFFFF" align="center">
						${x.stuno}
					</td>
					<td width="8%" bgcolor="#FFFFFF" align="center">
						${x.sname}
					</td>
					
					<td width="12%" bgcolor="#FFFFFF" align="center">
					     ${x.createTime} 
					</td>
					<td width="8%" bgcolor="#FFFFFF" align="center">
						${x.cno}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
						${x.cname}
					</td>
					<td width="7%" bgcolor="#FFFFFF" align="center">
					    ${x.tname}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${x.place}
					</td>
					<td width="8%" bgcolor="#FFFFFF" align="center">
					    ${x.weekday}
					</td>
					
					<td width="8%" bgcolor="#FFFFFF" align="center">
					    ${x.sxw}
					</td>
					<td width="8%" bgcolor="#FFFFFF" align="center">
					    ${x.lesson}
					</td>
					
					<td width="8%" bgcolor="#FFFFFF" align="center">
					<c:if test="${type==1 }">
					<button onclick="location.href='XkjlServlet?action=xuanke&id=${c.id }&stuno=${sessionScope.student.stuno }'">选课</button>
					
					</c:if>
					<c:if test="${type==2 }">
					<a href="XkjlServlet?action=query&x_id=${x.x_id }" >修改</a>
						<a href="#" onclick="del(${x.x_id})" >删除</a>
					</c:if>
						
					</td>
				</tr>
				</c:forEach>
				
			</table>
			<br>
			<div style="text-align: center">
                    

                        <a href="XkjlServlet?action=list&p=1">首页</a>
                        <%--        判断是否有上一页--%>
                        <c:if test="${cp>1}">
                            <a  href="XkjlServlet?action=list&p=${cp-1}">上一页</a>
                        </c:if>
                        <%--        循环显示页码--%>
                        <c:forEach begin="${cp-2>1 ? (cp-2) :1}" end="${cp+2>tp?tp:(cp+2)}" var="e">
                            <%--            判断是否是当前页--%>
                            <c:if test="${cp==e}">
                                <a  href="XkjlServlet?action=list&p=${e}">${e}</a>
                            </c:if>
                            <c:if test="${cp!=e}">
                                <a  href="XkjlServlet?action=list&p=${e}">${e}</a>
                            </c:if>

                        </c:forEach>

                        <%--        判断是否有下一页--%>
                        <c:if test="${cp<tp}">
                            <a  href="XkjlServlet?action=list&p=${cp+1}">下一页</a>
                        </c:if>
                        <a  href="XkjlServlet?action=list&p=${tp}">尾页</a>

                    
                </div>
			
			
	</body>
</html>
