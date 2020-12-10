<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <style type="text/css">
    div.heading{
      border-bottom:solid 1px #000000;
      border-top:solid 1px #ffffff;
      margin-bottom:10px;
    }
    
    div.heading p{
      padding:0;
      margin-bottom:10px;
      text-align:center;
    }
    
  	div.submit{
  	  text-align:center;
  	  margin-top: 15px;
  	  border: solid 1px #ffffff;
  	}
  	
  	fieldset{
  	  position:relative;
      width:450px;
      margin:auto;
      margin-top:20px;
  	}
  	
  	fieldset select{
  	  width:120px;
  	}
  	
  	fieldset input{
  	  width:120px;
  	}
  	
  	div.row{
  	  position: relative;
  	  padding:8px 0;
  	  margin-bottom:10px;
  	}
  	
  	div.column1{
  	  width:25%;
  	  position:relative;
  	  float: left;
  	  margin: 0;
  	}
  	
  	div.column2{
  	  width:25%;
  	  margin: 0;
  	  float:left;
  	}

    div.column3{
      width:25%;
  	  margin: 0;
  	  float:left;
  	}
  	
  	div.column4{
  	  margin-left:675px;
  	  width:180px;
  	}
  	  	
  	.column_1{
  	  float:left;
  	}

   	.column_2{
   	  margin-left:50px;
   	  width:150;
  	}
  	
  	.column_2 span{
  	  border-bottom: dashed 1px #000000;
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
  	
  	.category{
  	  text-align:center;
  	}
  	
  	.date{
  	  text-align:center;
  	}
  	
  	.opt{
  	  text-align:center;
  	}
  	
  	td div{
  	  text-align: center;
  	  margin: 0;
  	  padding: 0;
  	}
  	
  	.text{
  	  width:390px;
  	}
  	
  </style>
  <title>查询明细信息</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="${pageContext.request.contextPath }/manager/logout">退出</a></li>
    </ul>
  </div>
 <jsp:include page="top.jsp" flush="true"/>

  <div id="content" style="border:solid 1px #ffffff;width:90%;margin:auto;padding-top:10px">
    <form action="${pageContext.request.contextPath }/subscription/updateDetail" method="post">
        <div class="heading">
          <p>订单基本信息</p>
        </div>      
        <div class="row">
          <div class="column1">
            <div class="column_1">
              <span>订单号:</span>
            </div>
            <div class="column_2">
              <span>${onesubscription.no}</span>
            </div>
          </div>
          
          <div class="column2">
            <div class="column_1">
              <span>创建时间:</span>
            </div>
            <div class="column_2">
              <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${onesubscription.cretime}"/></span>
            </div>
          </div>
          
          <div class="column3">
            <div class="column_1">
              <span>会员名:</span>
            </div>
            <div class="column_2">
              <span>${onesubscription.linkman}</span>
            </div>            
          </div>
          
          <div class="column4">
            <div class="column_1">
              <span>状态:</span>
            </div>
            <div class="column_2">
              <select name="status" id="status">
                <option value="1" <c:if test="${onesubscription.status==1}">selected</c:if>>待确认</option>
                <option value="2" <c:if test="${onesubscription.status==2}">selected</c:if>>已确认</option>
                <option value="0" <c:if test="${onesubscription.status==0}">selected</c:if>>已取消</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="column1">
            <div class="column_1">
              <span>联系人:</span>
            </div>
            <div class="column_2">
              <span>${onesubscription.linkman}</span>
            </div>
          </div>
          
          <div class="column2">
            <div class="column_1">
              <span>联系电话:</span>
            </div>
            <div class="column_2">
              <span>${onesubscription.phone}</span>
            </div>
          </div>
          
          <div class="column3">
            <div class="column_1">
              <span>电子邮件:</span>
            </div>
            <div class="column_2">
              <span>${onesubscription.email}</span>
            </div>            
          </div>
          <div class="column4">
            <span>&nbsp;</span>
          </div>
        </div>
        
        <div class="row">
          <label for="remark">备注</label>
          <input type="text" class="text" name="remark" id="remark" /> 
          <input type="submit" value="保存" />
        </div>
      </form>
      <div class="heading">
        <p>订单明细信息</p>
      </div>
      <table>
      <colgroup>
        <col class="category" />
        <col class="no" />
        <col />
        <col />
        <col span="2" class="date" />
        <col class="opt" />
      </colgroup>
      <tr>
        <th>房间类型</th>
        <th>房间号</th>
        <th>预定方式</th>
        <th>单价</th>
        <th>入住日期</th>
        <th>退房日期</th>
        <th>操作</th>
      </tr>					
		<c:forEach items="${oneSubscriptionDetail}" var="subdetail">
        <c:forEach items="${rooms }" var="room">
	      <tr>
	      
	      <!--<c:if test="${2>1}">code..</c:if>-->
	      
	        <c:if test="${subdetail.rid==room.id && room.cid==1 }"><td><div>单人间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==2 }"><td><div>双人间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==3 }"><td><div>豪华标准间</div></td></c:if>
	        
	        <c:if test="${subdetail.rid==room.id && room.cid==1 }"><td><div>${room.no }</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==2 }"><td><div>${room.no }</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && room.cid==3 }"><td><div>${room.no }</div></td></c:if>
	        
	        
	        <c:if test="${subdetail.rid==room.id && subdetail.residetype==1}"><td><div>单个房间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id && subdetail.residetype==2}"><td><div>整个房间</div></td></c:if>
	        <c:if test="${subdetail.rid==room.id }"><td>${subdetail.price}</td></c:if>
	        <c:if test="${subdetail.rid==room.id }"><td><div><fmt:formatDate pattern="yyyy-MM-dd " value="${subdetail.sdate}"/></div></td></c:if>
            <c:if test="${subdetail.rid==room.id }"><td><div><fmt:formatDate pattern="yyyy-MM-dd " value="${subdetail.edate}"/></div></td></c:if>
           <c:if test="${subdetail.rid==room.id}"> <td>
            <div>
              <a href="${pageContext.request.contextPath}/create/m_deleteSubscriptionDtl?id=${subdetail.id}" onclick="return confirm('真的要删除该预定细信息吗？')">删除</a>
            </div>
          </td></c:if>
	      </tr>

	      </c:forEach>
      </c:forEach>
    </table>
    <div class="submit">
      <input type="button" value="返回" onclick="location='${pageContext.request.contextPath }/manager/Query'"/>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统做为Java Web教学设计使用。未经允许，不得做为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>