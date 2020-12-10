<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    
    #content div{
  	  margin: 10px 0px;
  	}
  	
  	table{
  	  margin:auto;
  	  margin-top:20px;
  	  width:700px;
  	  border-collapse:collapse;
  	}
  	
  	th,td{
  	  border:solid 1px #000000;
  	  padding:6px 1px;
  	}
  	
  	.index{
  	  width: 50px;
  	  text-align:center;
  	}
  	
  	.no{
  	  text-align:center;
  	}
  	
  	.shortname{
  	  text-align:center;
  	}
  	
  	.phone{
  	}
  	
  	.email{
  	}
  	
  	.status{
  	}
  	
  	.opt{
  	  text-align:center;
  	}
  	
  	#content div{
  	  text-align:center;
  	  margin:0;
  	  padding:0;
  	}
  	
  	#content div.button{
  	  text-align:center;
  	  padding-top:15px;
  	}
  	
  </style>
  <title>订单列表</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
            <li><a href="${pageContext.request.contextPath }/manager/logout">退出</a></li>
    </ul>
  </div>
 <jsp:include page="top.jsp" flush="true"/>
  <div id="content">
    <table>
      <colgroup>
        <col class="index" />
        <col class="no" />
        <col class="shortname" />
        <col class="phone" />
        <col class="email" />
        <col class="status" />
        <col class="opt" />
      </colgroup>
      <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>电子邮件</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
		<c:forEach items="${subscriptionsAll}" var="all">
	      <tr>
	        <td><div>${all.id}</div></td>
	        <td><div><a href="${pageContext.request.contextPath }/subscription/m_showDetail?id=${all.id}">${all.no}</a></div></td>
	        <td><div>${all.linkman}</div></td>
	        <td>${all.phone}</td>
	        <td>${all.email}</td>
	        <c:if test="${all.status==0}"><td><div>已取消</div></td></c:if>
	        <c:if test="${all.status==1}"><td><div>未确认</div></td></c:if>
	        <c:if test="${all.status==2}"><td><div>已确认</div></td></c:if>
	        <td>
          <div>
            <a href="${pageContext.request.contextPath }/subscription/mdeleteSubscription?id=${all.id }" onclick="return confirm('真的要删除该订单及其明细信息吗？')">删除</a>
          </div>
        </td>
	      </tr>
      </c:forEach>
       		<c:if test="${fn:length(subscriptionsAll)==0}">
        	<tr>
        		<td colspan="7">未查询到订单</td>
        	</tr>
        </c:if>
    </table>
    <div class="button">
      <input type="button" value="重新查询" onclick="location='${pageContext.request.contextPath }/manager/Query'"/>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>