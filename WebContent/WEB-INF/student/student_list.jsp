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
                   window.location.href="<%=path %>/StudentServlet?action=delete&id="+id;
               }
           }
           
          
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
	
			<form action="<%=path %>/StudentServlet?action=findByMap" name="formAdd" method="post">
				     <br>  &emsp; 学号：<input type="text" name="stuno" size="20"/>
					 <input type="submit" value="查询"/>		   
			</form>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#FAFAF1">
					<td height="14" colspan="1" >&nbsp;学生列表&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				
					<td width="12%">学号</td>
					<td width="12%">学生姓名</td>
					<td width="12%">性别</td>
					<td width="12%">专业</td>
					<td width="12%">年级</td>
					<td width="12%">班级</td>
					<td width="12%">密码</td>
					<td width="14%">操作</td>
		        </tr>	
				<c:forEach items="${studentList}" var="s" >
				<tr align='center' bgcolor="#FAFAF1" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="12%" bgcolor="#FFFFFF" align="center">
						${s.stuno}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
						${s.sname}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${s.sex}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${s.major}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${s.grade}
					</td>
					
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${s.bj}
					</td>
					<td width="12%" bgcolor="#FFFFFF" align="center">
					    ${s.pwd}
					</td>
					
					<td width="12%" bgcolor="#FFFFFF" align="center">
						<a href="StudentServlet?action=query&id=${s.id }" class="pn-loperator">修改</a>
						<a href="#" onclick="del(${s.id})" class="pn-loperator">删除</a>
					</td>
				</tr>
				</c:forEach>
				
			</table>
			<br>
			<div style="text-align: center">
                    

                        <a href="StudentServlet?action=list&p=1">首页</a>
                        <%--        判断是否有上一页--%>
                        <c:if test="${cp>1}">
                            <a  href="StudentServlet?action=list&p=${cp-1}">上一页</a>
                        </c:if>
                        <%--        循环显示页码--%>
                        <c:forEach begin="${cp-2>1 ? (cp-2) :1}" end="${cp+2>tp?tp:(cp+2)}" var="e">
                            <%--            判断是否是当前页--%>
                            <c:if test="${cp==e}">
                                <a  href="StudentServlet?action=list&p=${e}">${e}</a>
                            </c:if>
                            <c:if test="${cp!=e}">
                                <a  href="StudentServlet?action=list&p=${e}">${e}</a>
                            </c:if>

                        </c:forEach>

                        <%--        判断是否有下一页--%>
                        <c:if test="${cp<tp}">
                            <a  href="StudentServlet?action=list&p=${cp+1}">下一页</a>
                        </c:if>
                        <a  href="StudentServlet?action=list&p=${tp}">尾页</a>

                    
                </div>
			
			
	</body>
</html>
