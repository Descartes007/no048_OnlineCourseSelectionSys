<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<script language="javascript">
		    function check1()
		    {
		        if(document.form1.stuno.value=="")
		        {
		            
		            document.getElementById("span").innerHTML="请输入学号!";
		            return false;
		        }
		        if(document.form1.sname.value=="")
		        {
		           
		            document.getElementById("span").innerHTML="请输入学生名称!";
		            return false;
		        }
		       
		       
		        document.form1.submit();
		    }
		   
        </script>
        
        
       
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/XkjlServlet" name="form1" method="post">
			    <input type="hidden" value="update" name="action"/>
			        <input type="hidden" value="${sessionScope.type}" name="type"/>
			      <input type="hidden" value="${xkjl.x_id}" name="x_id">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>修改选课信息</span></td>
					        <span style="color:red">${msg}</span>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         学号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="stuno" value="${xkjl.stuno}" size="20"/>
						        <span id="span" style="color:red"></span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       学生名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="sname"  value="${xkjl.sname}"  id="sname" size="22"/>
						    </td>
						</tr>
						
						
						
						
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       请选择课程：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select class="INPUT_text" name="c_id">
						      	<c:forEach items="${xkjl2}" var="x2" >
							    <option value="${x2.id }">${x2.cname}</option>
							   
							    </c:forEach>
							 </select>
						    </td>
						</tr>
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     <button type="button" onclick="check1();" >确认修改</button>
					
						       <button onclick="'XkjlServlet?action=list'">返回</button>
						      
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
