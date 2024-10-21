<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
 <script language="javascript">
	 function check1()
	 {                                                                                         
	     if(document.ThisForm.account.value=="")
		 {
		 	alert("请输入用户名");
			document.ThisForm.account.focus();
			return false;
		 }
		 if(document.ThisForm.password.value=="")
		 {
		 	alert("请输入密码");
			document.ThisForm.password.focus();
			return false;
		 }
		 if(document.ThisForm.type.value=="-1")
		 {
		 	alert("请选择登录身份");
			document.ThisForm.type.focus();
			return false;
		 }
		 //document.getElementById("indicator").style.display="block";
		 document.form1.submit();
		 //loginService.login(document.ThisForm.account.value,document.ThisForm.password.value,document.ThisForm.type.value,callback);
	 }

	
 
     function reg()
     {//参考https://blog.csdn.net/seamon_love/article/details/81698870
		  var strUrl = "<%=path %>/StudentServlet?action=toRegiste";//
          var ret = window.open(strUrl,"","height=300, width=600, top=200, left=400, toolbar=no, menubar=yes, scrollbars=no, resizable=no, location=no, status=no");
	 }
 </script>
</head>
<body>

 
<body >
	<br>
	<br>
	<br>
	<br>
	<table width="909" height="693" border="0" align="center" cellpadding="0" cellspacing="0"  background="<%=path %>/img/bjt.png">
	 <tr>
	    <td><div align="center" style="FONT-WEIGHT: bold; FONT-SIZE: 25pt;">(学生选课)网上选课系统</div></td>
	 </tr>
	 <tr>
		<td width="559">
			<form name="ThisForm" method="post" action="StudentServlet?action=login">
				<table width="410" height="198" border="0" align="right" cellpadding="0" cellspacing="0">
					<tr>
						<td height="5" colspan="2"></td>
					</tr>
			        <tr>
					  
						<td width="356" valign="bottom">
					        学号/用户名：<input name="account"  type="text" class="input2" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
						</td>
						<span style="color:red">${msg}</span>
					</tr>
					<tr>
						<td height="10" colspan="2" valign="bottom"></td>
					</tr>
					<tr>
						<td height="31" colspan="2" valign="top" class="STYLE15">
						     密&nbsp;&nbsp;码：
							<input name="password" type="password" size="21" class="input2" align="bottom" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
						</td>
					</tr>
					<tr>
						<td height="10" colspan="2" valign="bottom"></td>
					</tr>
					<tr style="display: block">
					    <td height="31" colspan="2" valign="top" class="STYLE15">
					         身&nbsp;&nbsp;&nbsp;&nbsp;份：
					         <select class="INPUT_text" name="type">
							    <option value="-1" selected="selected">请选择登录身份</option>
								<option value="1">学生</option>
								<option value="2">教师/管理员</option>
							 </select>
                        </td>
				    </tr>
					<tr>
						<td colspan="2" valign="top">&nbsp; &nbsp; &nbsp; &nbsp;
							<input name="button" type="submit" class="submit1" value="登录" > &nbsp;
							<input name="button" type="button" class="submit1" value="注册" onclick="reg()">
							<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
						</td>
				    </tr>
                </table>
	        </form>
        </td>
     </tr>
    </table>
</body>
