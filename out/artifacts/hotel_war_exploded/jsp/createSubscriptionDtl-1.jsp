<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/calendar.js" charset="GBK"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/style.css"></link>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js" charset="GBK"></script>
    <script type="text/javascript">
		$(function(){
			$("#fm").submit(function(){
				var myDate = new Date;
			    var year = myDate.getFullYear(); //获取当前年
			    var mon = myDate.getMonth() + 1; //获取当前月
			    var date = myDate.getDate(); //获取当前日
			    // var h = myDate.getHours();//获取当前小时数(0-23)
			    // var m = myDate.getMinutes();//获取当前分钟数(0-59)
			    // var s = myDate.getSeconds();//获取当前秒
			    var week = myDate.getDay();
			    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
			    console.log(year, mon, date, weeks[week])
			    if(date<10){
			    	date = "0"+date;
			    }
			    var nowDate = year+"-"+mon+"-"+date

			    var sdate =$("#sdate").val().trim();
			    var edate =$("#edate").val().trim();
			    //$("#time").html(year + "年" + mon + "月" + date + "日" + weeks[week]+ sdate+nowDate);
			    //时间字符串分割


			    var sdatearr = 'sdate'.split('-');
			    var edatearr = 'edate'.split('-');
			    
				if(sdate==""){
					$("#sdateMsg").text("开始住房时间不能为空");
					return false;
				}
				if($.trim(sdate)<$.trim(nowDate)){
					$("#edateMsg").text("开始住房时间不能为以往时间");
					return false;
				}
				if(edate==""){
					$("#edateMsg").text("退房时间不能为空");
					return false;
				}
				if($.trim(sdate)==$.trim(edate)){
					$("#edateMsg").text("开始时间与退房时间不能一样");
					return false;
				}
				if($.trim(sdate)>$.trim(edate)){
					$("#edateMsg").text("退房时间不能小于开始时间");
					return false;
				}

				return true;
			});
			
			$("#sdate,#edate").on("focus",function(e){
				$("#"+e.target.id+"Msg").text("");
			});
		});
	</script>
  <style type="text/css">
    div.submit{
  	  text-align:center;
  	  margin-top: 15px;
  	  border: solid 1px #ffffff;
  	}
  	
  	label{
  	  float: left;
  	  width: 80px;
  	  text-align: left;
  	}
  	
  	fieldset{
  	  position:relative;
      width:300px;
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
  	  border: solid 1px #ffffff;
  	}
  	
  	div.column{
  	}
  	
	  #content p{
	    text-align: center;
	    margin-top: 20px;
	  }
	  
  </style>
  <title>预定客房</title>
</head>
<body>
<div id="container">
  <div id="header">
    <ul>
      <li><a href="#">帮助</a></li>
    </ul>
  </div>
  <!--<div id="menu">
    <ul>
      <li><a href="index.html">首页</a></li>
      <li><a href="roomPrice.html">设施与价格</a></li>
      <li><a href="memberCenter.html">会员中心</a></li>
    </ul>
  </div>-->
  <jsp:include page="top.jsp" flush="true"/>
  <div id="content" style="width:98%;position:relative">
    <jsp:include page="left.jsp" flush="true"/>
  <!--  <div id="content">
    <div class="submenu">
      <ul>
        <li><a href="memberCenter.html">客房预订</a></li>
        <li><a href="historySubscription.html">历史订单</a></li>
        <li><a href="editMember.html">修改信息</a></li>
        <li><a href="editPassword.html">修改密码</a></li>
        <li><a href="index.html">退出系统</a></li>
      </ul>
    </div>-->
    
    <div class="subcontent">
      <p>请输入您要预定的房间类型以及预订的起始日期，系统会显示可用的房间并供您选择。</p>
      <form id="fm" action="${pageContext.request.contextPath}/create/createSubscriptionSession" >
        <fieldset>
          <div class="row">
            <div class="column">
              <label for="rCid">客房类型</label>
              <select name="rCid" id="rCid">
                <option value="1">单人间</option>
                <option value="2">标准间</option>
                <option value="3">豪华标准间</option>
              </select>
            </div>
          </div>
          
          <div class="row">
            <div class="column">
              <label for="residetype">预定方式</label>
              <select name="residetype" id="residetype">
                <option value="2">单个床位</option>
                <option value="2">整个房间</option>
              </select>
            </div>
          </div>
         
          <div class="row">
            <div class="column">
              <label for="sdate">开始日期</label>
              <input type="text" name="sdate" id="sdate" readonly="readonly"
                  onclick="new Calendar().show(this)"/>
            </div>
             <div style="color: red;" id="sdateMsg"></div>
          </div>
          <div class="row">
            <div class="column">
              <label for="edate">结束日期</label>
              <input type="text" name="edate" id="edate" readonly="readonly"
                  onclick="new Calendar().show(this)"/>
              <div style="color: red;" id="edateMsg"></div>
            </div>
            
          </div>
          <div id="time"></div>
        </fieldset>

        <div class="submit">
          <input type="button" value="返回" onclick="location='${pageContext.request.contextPath}/create/showSubscriptionDtl?id=${sid}'"/>
          <input type="submit" value="下一步" />
        </div>
      </form>
    </div>
  </div>
  <hr />
  <div id="footer">
    <p>本系统为Java Web教学而设计，不得作为它用，版权所有Allan<br />联系方式：javamedia@live.cn</p>
  </div>
</div>
</body>
</html>