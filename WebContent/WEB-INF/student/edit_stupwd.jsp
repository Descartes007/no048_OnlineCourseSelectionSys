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
		        if(document.form1.pwd.value=="")
		        {		           
		            document.getElementById("span").innerHTML="请输入密码!";
		            return false;
		        }
		        if(document.form1.repwd.value=="")
		        {
		           
		            document.getElementById("span").innerHTML="请输入确认密码!";
		            return false;
		        }
		        if(document.form1.pwd.value!=document.form1.repwd.value)
		        {
		          
		            document.getElementById("span").innerHTML="两次密码不一致!";
		            return false;
		        }
		       
		        document.form1.submit();
		    }
		   
        </script>
        
        
       
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/StudentServlet" name="form1" method="post">
			    <input type="hidden" value="updatePwd" name="action"/>
			     
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>修改学生密码</span></td>
					        <span style="color:red">${msg}</span>
					         
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         学号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="stuno" id="stuno" value="${sessionScope.student.stuno }" size="20"/>
						        <span id="span" style="color:red"></span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="password" name="pwd"  value=""  id="pwd" size="22"/>
						        <span id="span2" style="color:red"></span>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        确认密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="password" name="repwd"  value=""  id="repwd" size="22"/>
						    </td>
						</tr>
						
						
						
						
						
						
						
						
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     <button type="button" onclick="check1();" >确认修改</button>
					
						       <button type="reset">重置</button>
						      
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
