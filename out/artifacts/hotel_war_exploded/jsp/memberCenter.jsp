<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
      <p>
        下面是尚未确认的预定信息，您可以增加、修改或删除订单信息。
      </p>
      <table align="center">
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
          <th>订  单  号</th>
          <th>联  系  人</th>
          <th>联系电话</th>
          <th>电子邮件</th>
          <th> 操  作</th>
        </tr>
        <c:if test="${fn:length(subscriptions)!=0}">
        	<c:forEach items="${subscriptions}" var="s">
		        <tr>
		          <td><div><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${s.cretime }"/></div></td>
		          <td><div><a href="${pageContext.request.contextPath }/subscription/memeber_showDetail?id=${s.id}">${s.no }</a></div></td>
		          <td><div>${s.linkman }</div></td>
		          <td>${s.phone }</td>
		          <td>${s.email }</td>
		          <td>
		            <div>
		              <a href="${pageContext.request.contextPath }/subscription/deleteSubscription?id=${s.id }" onclick="return confirm('真的要删除该订单及其明细信息吗？')">删除</a>
		              <a href="${pageContext.request.contextPath }/subscription/showEdit?id=${s.id }">联系人信息</a>
		              <a href="${pageContext.request.contextPath }/create/showSubscriptionDtl?id=${s.id }">客房信息</a>
		            </div>
		          </td>
		        </tr>
	        </c:forEach>
        </c:if>
        <c:if test="${fn:length(subscriptions)==0}">
        	<tr>
        		<td colspan="6">暂时没有订单</td>
        	</tr>
        </c:if>
        
      </table>
      <div class="button">
        <input type="button" value="新建订单" onclick="location='${pageContext.request.contextPath }/subscription/newSubscription'"/>
      </div>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>