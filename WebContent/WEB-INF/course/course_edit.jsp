<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<script language="javascript">
		    function check1()
		    {
		        if(document.form1.cno.value=="")
		        {
		            
		            document.getElementById("span").innerHTML="请输入课程号!";
		            return false;
		        }
		        if(document.form1.cname.value=="")
		        {
		           
		            document.getElementById("span").innerHTML="请输入课程名称!";
		            return false;
		        }
		        if(document.form1.tname.value=="")
		        {
		          
		            document.getElementById("span").innerHTML="请输入授课老师名称!";
		            return false;
		        }
		        if(document.form1.place.value=="")
		        {
		            
		            document.getElementById("span").innerHTML="请输入上课地点!";
		            return false;
		        }
		       
		        document.form1.submit();
		    }
		   
        </script>
        
        
       
	</head>

	<body <%-- leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif' --%>>
			<form action="<%=path %>/CourseServlet" name="form1" method="post">
			    <input type="hidden" value="${empty param.id ?"add":"update"}" name="action"/>
			        <input type="hidden" value="${sessionScope.type}" name="type"/>
			      <input type="hidden" value="${course.id}" name="id">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>${empty param.id ?"添加":"修改"}课程信息</span></td>
					        <span style="color:red">${msg}</span>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         课程号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="cno" value="${course.cno }" size="20"/>
						        <span id="span" style="color:red"></span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       课程名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="cname"  value="${course.cname }"  id="cname" size="22"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        授课老师：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="tname" id="tname"  value="${course.tname }"  size="22"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        上课地点：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="place" id="place"  value="${course.place }"  size="22"/>
						    </td>
						</tr>
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         请选择 星期几：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <select class="INPUT_text" name="weekday">
						         
						         <c:if test="${not empty param.id}">
						         <option value="星期一" selected="selected">${course.weekday}</option>
						         </c:if>
							    
								<option value="星期一">星期一</option>
								<option value="星期二">星期二</option>
								<option value="星期三">星期三</option>
								<option value="星期四">星期四</option>
								<option value="星期五">星期五</option>
								<option value="星期六">星期六</option>						
								<option value="星期日">星期日</option>、
								
								
							 </select>
                        
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       请选择 上午/下午/晚上：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select class="INPUT_text" name="sxw">
						         <c:if test="${not empty param.id}">
							    <option value="上午" >${course.sxw }</option>
							    </c:if>
							    <option value="上午">上午</option>
								<option value="下午">下午</option>
								<option value="晚上">晚上</option>
							 </select>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        请选择具体节数：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select class="INPUT_text" name="lesson">
						         <c:if test="${not empty param.id}">
							    <option value="一二节" selected="selected">${course.lesson }</option>
							    </c:if>
							    <option value="一二节">一二节</option>
								<option value="三四节">三四节</option>
								
							 </select>
						    </td>
						</tr>
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     <button type="button" onclick="check1();" >${empty param.id ?"确认添加":"确认修改"}</button>
					
						       <button onclick="'CourseServlet?action=list'">返回</button>
						      
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
