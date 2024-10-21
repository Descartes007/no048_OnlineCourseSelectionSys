<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生选课管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" />
	<link rel="stylesheet" href="<%=path %>/css/menu.css" type="text/css" />
	<style type="text/css">
	    div {
			padding:0px;
			margin:0px;
		}
		
		body {
		  scrollbar-base-color:#bae87c; 
		 scrollbar-arrow-color:#FFFFFF;
		  scrollbar-shadow-color:#c1ea8b; 
		 padding:0px;
		 margin:auto;
		 text-align:center;
		   background-color:#9ad075; 
		}
		
		dl.bitem {
			width:148px;
			margin:0px 0px 5px 4px;
		}
		
		dl.bitem dt {
		  background:url(<%=path %>/img/menubg.gif);   
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		
		dl.bitem dd {
		  padding:3px 3px 3px 3px;
		  background-color:#fff;
		}
		
		.fllct
		{
			float:left;
			
			width:90px;
		}
		
		.flrct
		{
			padding-top:3px;
			float:left;
		}
		
		div.items
		{
			line-height:22px;
		background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px; 
		}
		
		span.items
		{
			padding:10px 0px 10px 22px;
		 	 background:url(<%=path %>/img/arr4.gif) no-repeat 10px 12px; 
		}
		
		ul {
		  padding-top:3px;
		}
		
		li {
		  height:22px;
		}
		
		.sitemu li {
			padding:0px 0px 0px 22px;
			line-height:24px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px; 
		}
	</style>
	<script language='javascript'>var curopenItem = '1';</script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/menu.js"></script>
	<base target="main" />
  </head>
  
  <body target="main">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	    <!-- 学生端导航栏 -->
	    <c:if test="${type==1}">
	    
	  <dl class='bitem' style="border:1px solid #000 ;">
	        <dt onClick='showHide("items2_1")'><b>个人信息</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'> 
	            <li><a href='<%=path %>/StudentServlet?action=findMyInfo&stuno=${sessionScope.student.stuno}' target='main'>我的信息</a> </li>
	          </ul>
	        </dd>
	      </dl> 
	      
	       <dl class='bitem'>
	        <dt onClick='showHide("items99_1")'><b>选课管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_2'>
	          <ul class='sitemu'>
	             <li><a href='<%=path %>/CourseServlet?action=list' target='main'>我要选课</a> </li>
	            <li><a href='<%=path %>/XkjlServlet?action=myXuanke&stuno=${sessionScope.student.stuno}'  target='main'>我的选课记录</a></li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items99_1")'><b>系统管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_2'>
	          <ul class='sitemu'>
	             <li><a href='<%=path %>/StudentServlet?action=toEditStudentPwd' target='main'>修改密码</a> </li>
	             <li><a href='#' onclick='javascript:window.parent.location="<%=path %>/index.jsp"'  >安全退出系统</a></li>
	          </ul>
	        </dd>
	      </dl>
	      </c:if>
	      <!-- 管理员端导航栏 -->
	       <c:if test="${type==2}">
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>学生信息管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'> 
	            <li><a href='<%=path %>/StudentServlet?action=list' target='main'>学生列表</a> </li>
	             <li><a href='<%=path %>/StudentServlet?action=toAddStudent' target='main'>添加学生</a> </li>
	        </ul>
	        </dd>
	      </dl> 
	      
	       <dl class='bitem'>
	        <dt onClick='showHide("items99_1")'><b>课程管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_2'>
	          <ul class='sitemu'>
	             <li><a href='<%=path %>/CourseServlet?action=list' target='main'>课程列表</a> </li>
	            <li><a href='<%=path %>/CourseServlet?action=toAddCourse' >添加课程</a></li>
	          </ul>
	        </dd>
	      </dl>
	      
	      <dl class='bitem' style="border:1px solid #000 ;">
	        <dt onClick='showHide("items99_1")'><b>选课管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_2' style="border:1px solid #000 ;">
	          <ul class='sitemu'>
	             <li><a href='<%=path %>/XkjlServlet?action=list' target='main'>选课列表</a> </li>
	           
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem' style="border:1px solid #000 ;">
	        <dt onClick='showHide("items99_1")'><b>系统管理</b></dt>
	        <dd style='display:block' class='sitem' id='items1_2'>
	          <ul class='sitemu'>
	             <li ><a href='<%=path %>/AdminServlet?action=toEditPwd' target='main'>修改密码</a> </li>
	            <li><a href='#' onclick='javascript:window.parent.location="<%=path %>/index.jsp"'  >安全退出系统</a></li>
	          </ul>
	        </dd>
	      </dl>
	      </c:if>
		</td>
	  </tr>
	</table>
  </body>
</html>
