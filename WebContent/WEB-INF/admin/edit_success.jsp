<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
		
	</head>
  <body>
       
<h4 style="color:red">管理员密码修改成功</h4>
<button type="button"  onclick="location.href='AdminServlet?action=toWelcome'">返回控制台</button>
  </body>
</html>
