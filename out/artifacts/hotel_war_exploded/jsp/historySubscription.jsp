<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    
  	table{
  	  margin:auto;
  	  margin-top:0;
  	  border-collapse:collapse;
  	  width: 90%;
  	}
  	
  	th,td{
  	  border:solid 1px #000000;
  	}
  	
  	th{
  	  padding:6px 1px;
  	}
  	
  	td{
  	  padding:8px 1px;
  	}
  	
  	td div{
  	  text-align: center;
  	}
  	
  	.date{
  	  width: 50px;
  	  text-align:center;
  	}
  	
  	#content div.button{
  	  text-align:center;
  	  padding-top:15px;
  	}
  	
  	#content p{
  	  margin: 20px 0;
  	  text-indent: 2em;
  	  line-height: 1.5em;
  	  text-align: center;
  	}
  </style>
  <title>会员中心</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
    <li><a href="#">帮助</a></li>
  </ul>
  </div>
<jsp:include page="top.jsp" flush="true"/>
  <div id="content" style="width:98%;position:relative">
    <jsp:include page="left.jsp" flush="true"/>
    <div class="subcontent">
      <table align="center">
        <caption>历史预定信息</caption>
        <colgroup>
          <col class="datetime" />
          <col class="no" />
          <col />
          <col />
          <col />
          <col />
        </colgroup>
        <tr>
          <th>创建时间</th>
          <th>订单号</th>
          <th>联系人</th>
          <th>联系电话</th>
          <th>电子邮件</th>
          <th>状态</th>
        </tr>
        <c:if test="${fn:length(subscriptions1)!=0}">
        	<c:forEach items="${subscriptions1}" var="s">
		        <tr>
		          <td><div><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${s.cretime }"/></div></td>
		          <td><div><a href="${pageContext.request.contextPath }/subscription/memeber_showDetail?id=${s.id}">${s.no }</a></div></td>
		          <td><div>${s.linkman }</div></td>
		          <td>${s.phone }</td>
		          <td>${s.email }</td>
		          <c:if test="${s.status==0}"><td><div>已取消</div></td></c:if>
	        	  <c:if test="${s.status==1}"><td><div>未确认</div></td></c:if>
	        	  <c:if test="${s.status==2}"><td><div>已确认</div></td></c:if>
		        </tr>
	        </c:forEach>
        </c:if>
        <!-- <tr>
          <td><div>2009-09-08 12:30</div></td>
          <td><div><a href="subscriptionView.html">2009100512</a></div></td>
          <td><div>刘新福</div></td>
          <td>13426330776</td>
          <td>javamedia@live.cn</td>
          <td><div>以生效</div></td>
        </tr>
        <tr>
          <td><div>2009-09-08 12:30</div></td>
          <td><div><a href="subscriptionView.html">2009100518</a></div></td>
          <td><div>刘德华</div></td>
          <td>13526330876</td>
          <td>andylau@live.cn</td>
          <td><div>已取消</div></td>          
        </tr> -->
      </table>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</div>
</body>
</html>