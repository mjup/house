<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/house/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/house/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">物业管理系统</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="/house/index.jsp">首页</a>
						</li>
						<li>
							 <a href="/house/repair.jsp">在线保修</a>
						</li>
						<li class="active">
							 <a href="/house/charge.jsp">费用查询</a>
						</li>
						<li>
							 <a href="/house/message.jsp">查看消息</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<c:if test="${sessionScope.account!=null}">
								 <a href="#">欢迎，${sessionScope.owner}</a>
							</c:if>
							<c:if test="${sessionScope.account==null}">
								<a href="/house/login.html">登录</a>
							</c:if>
						</li>
						<c:if test="${sessionScope.account!=null}">
						<li>
							<a href="#" id = "logout" onclick="logout()">退出</a>
						</li>
						</c:if>
						<li>
							 <a href="/house/login_admin.html">登录后台</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="btn-group btn-group-lg" style="text-align:center">
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <input type="text" class="form-control laydate-icon" id="month"  readonly="readonly" name="month" style="height:34px" placeholder="选择年月份"/>
						</div>
					<button  class="btn btn-block btn-primary btn-default" id="show" onclick="find()">查询</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>
							年月份
						</th>
						<th>
							用水量
						</th>
						<th>
							水费
						</th>
						<th>
							用电量
						</th>
						<th>
							电费
						</th>
						<th>
							燃气量
						</th>
						<th>
							燃气费
						</th>
						<th>
							物业费
						</th>
						<th>
							总计
						</th>
						<th>
							是否缴费
						</th>
						<th>
							缴费日期
						</th>
					</tr>
				</thead>
				<tbody>
			
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script src="/house/js/jquery.slideBox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.all.min.js"> </script>
<script>
laydate({
	  elem: '#month',
	  format: 'YYYY-MM', // 分隔符可以任意定义，该例子表示只显示年月
	  festival: true, //显示节日
	});
function find(){
	if('${sessionScope.account}'==''||'${sessionScope.account}'==null){
		alert("请先登录");
		return;
	}
	if($('#month').val()==''){
		alert("请选择时间");
		return;
	}
	var data = {
			houseid:'${sessionScope.account}',
			month:$('#month').val()
	};
	loaddata(data,'/house/admin/charge/find.do','post',list);
}
function list(msg){
	//alert(msg);
	//console.log(msg);
	if(msg.msg){
		alert("没有相关记录");
		return;
	}
	var $tbody = $('table#list tbody');
	$tbody.empty();
	var $tr=$('<tr><td>'+msg.month+'</td><td>'+msg.water+'</td><td>'+msg.waterPrice+'</td><td>'+msg.electric+'</td><td>'+msg.electircPrice+'</td><td>'+msg.gas+'</td><td>'+msg.gasPrice+'</td><td>'+msg.wuyePrice+'</td><td>'+(msg.waterPrice*1+msg.electircPrice*1+msg.gasPrice*1+msg.wuyePrice*1).toFixed(2)+'</td></tr>');
	var $td;
	if(msg.status==0){
		$td=$('<td>没有缴费</td><td><a href="#">缴费</a></td>');
	}else{
		$td=$('<td>已经缴费</td><td>'+msg.cdate+'</td>');
	}
	$tr.append($td);
	$tbody.append($tr);
}
</script>
</body>
</html>