<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
		<script language="javascript">
		   
		    function closeOpen()
		     {//参考https://blog.csdn.net/seamon_love/article/details/81698870
		    	window.close();//关闭本窗口
			 }
		    
        </script>
	</head>
  <body>
       
<h4 style="color:red">注册成功</h4>
<button type="button"  onclick="closeOpen()">关闭窗口返回登录</button>
  </body>
</html>
