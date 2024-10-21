<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		        if(document.form1.repwd.value!=document.form1.pwd.value)
		        {
		          
		            document.getElementById("span").innerHTML="两次密码不一致!";
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
		    function closeOpen()
		     {//参考https://blog.csdn.net/seamon_love/article/details/81698870
		    	window.close();//关闭本窗口
			 }
		    
        </script>
	</head>
	<body>
			<form action="<%=path %>/StudentServlet?action=registe" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<th height="40" colspan="2" bgcolor="#FFFFFF" class="f12b-red" style="font-size: 11px;">
							学生注 册
						</th>
						<span style="color:red">${msg}</span>
						
					</tr>
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							学号：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="stuno" id="stuno"/>
							<span id="span" style="color:red"></span>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密 码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="pwd"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密码确认：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="repwd"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							学生姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="sname"/>
						</td>
					</tr>
					
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="radio" name="sex" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="女"/>女
						</td>
					</tr>
					
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							专业：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="major"/>
						</td>
					</tr>
					<tr>
						 <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							年级：
						</td>
						<td bgcolor="#FFFFFF">
							
					        
					         <select class="INPUT_text" name="grade">
							    <option value="大一" selected="selected">请选择所在年级</option>
								<option value="大一">大一</option>
								<option value="大二">大二</option>
								<option value="大三">大三</option>
								<option value="大四">大四</option>
							 </select>
                        
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							班级：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="bj"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="button" value="注册" onclick="check1();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
