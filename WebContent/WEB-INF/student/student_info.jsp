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
		        if(document.form1.sname.value=="")
		        {
		          
		            document.getElementById("span").innerHTML="学生姓名不允许为空!";
		            return false;
		        }
		        if(document.form1.major.value=="")
		        {
		            
		            document.getElementById("span").innerHTML="请输入所学专业!";
		            return false;
		        }
		        if(document.form1.bj.value=="")
		        {
		            
		            document.getElementById("span").innerHTML="请输入班级!";
		            return false;
		        }
		        document.form1.submit();
		    }
		   
        </script>
        
        
       
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/StudentServlet" name="form1" method="post">
			    <input type="hidden" value="update" name="action"/>
			        <input type="hidden" value="${sessionScope.type}" name="type"/>
			      <input type="hidden" value="${student.id}" name="id">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>我的个人信息</span></td>
					        <span style="color:red">${msg}</span>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         学 号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="stuno" value="${student.stuno }" readonly size="20"/><span  style="color:red">不可编辑</span>
						        
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="password" name="pwd"  value="${student.pwd }"  id="pwd" size="22"/>
						        <span id="span" style="color:red"></span>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        学生姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="sname" id="sname"  value="${student.sname }"  size="22"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        性别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select class="INPUT_text" name="sex">
							    <option value="男" selected="selected">${student.sex }</option>
								<option value="男">男</option>
								<option value="女">女</option>
							 </select>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        年级：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <select class="INPUT_text" name="grade">
							    <option value="大一" selected="selected">${student.grade }</option>
								<option value="大一">大一</option>
								<option value="大二">大二</option>
								<option value="大三">大三</option>
								<option value="大四">大四</option>
							 </select>
                        
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        专业：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="major" id="major"  value="${student.major }"  size="22"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        班级：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bj" id="bj"  value="${student.bj }"  size="22"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     <button type="button" onclick="check1();" >确认修改</button>
					
						       <a href ="StudentServlet?action=welcome">返回</button>
						      
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
