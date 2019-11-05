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
						<li>
							 <a href="/house/charge.jsp">费用查询</a>
						</li>
						<li class="active">
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
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-3 column">
					<div>
					  <ul class="items">
					    <li><a href="#" onclick="change(1)">已读</a></li>
					    <li><a href="#" onclick="change(0)">未读</a></li>
					  </ul>
					</div>
				</div>
				<div class="col-md-9 column">
					<div style="width:100%;height:30px;background-color:#E7E7E7;text-align:center">
					  	<strong style="line-height:30px">消息界面</strong>
					</div>
					<div id="message"></div>
				</div>
			</div>
		</div>
</div>
<!-- 消息详情 modal-->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">消息详情</h4>
            </div>
            <div class="modal-body" id="modal_body">
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
              	<!-- <button type="button" class="btn btn-primary" class="saveupdate" onclick="closeModal()">缴费</button> -->
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script src="/house/js/jquery.slideBox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.all.min.js"> </script>
<script>
var leixing;
function change(type){
	leixing = type;
	ajaxlist(1,5);
}
function ajaxlist(start,length){
	if('${sessionScope.account}'==''||'${sessionScope.account}'==null){
		alert("请先登录");
		return;
	}
	var data = {
			houseid:'${sessionScope.account}',
			nowPage:start,
			pageNumber:length,
			isread:leixing
	};
	loaddata(data,'/house/admin/message/list.do','post',list);
}
function loada(d){
	ajaxlist(d.data.nowPage,d.data.pageNumber);
}
function list(msg){
	$('#message').empty();
	if(msg.list.length==0){
		alert("没有记录");
		return;
	}
	var $table = $('<table class="table table-hover table-bordered"><thead><tr><th>编号</th><th>标题</th><th>时间</th><th>操作</th>'+
	'</tr>'+
'</thead>'+
'<tbody>'+

'</tbody>'+
'</table>');
//$tbody = $table.children('tbody');
	var $fenye = $('<div class="row clearfix">'+
		'<div class="col-md-8 column" style="float:right">'+
	'<ul class="pagination">'+
		'<li>'+
			 '<a href="#" id="first">首页</a>'+
		'</li>'+
		'<li>'+
			 '<a href="#" id="pre">上一页</a>'+
		'</li>'+
		'<li>'+
			 '<a href="#" id="next">下一页</a>'+
		'</li>'+
		'<li>'+
			' <a href="#" id="last">尾页</a>'+
		'</li>'+
		'<li>'+
			'<a> 当前第<span id="pagenow"></span>页</a>'+
		'</li>'+
		'<li>'+
			'<a href=#>总共<span id="pagetotal"></span>页</a>'+
		'</li>'+
		'<li>'+
			'<a> 总共<span id="totalquantity"></span>条记录</a>'+
		'</li>'+
	'</ul>'+
'</div>'+
'</div>');

$('#message').append($table,$fenye);
	var $tbody = $('table>tbody');
	//$tbody.empty();
	//console.log(msg.list);
	$.each(msg.list,function(index,value){
		var $tr=$('<tr><td>'+((index+1)+((msg.nowPage-1)*1*msg.pageNumber*1))+'</td><td>'+value.title+'</td><td>'+value.sdate+'</td><td><a href="#" onclick="showModal(\''+value.content+'\','+value.id+')">查看内容</a></td></tr>');
		$tbody.append($tr);
	});
	var $first = $('a[id="first"]');
	$first.bind('click',{nowPage:1,pageNumber:5},loada);
	var $pre = $('a[id="pre"]');
	//$pre.click(loadData(msg.previous,msg.pageNumber));
	$pre.bind('click',{nowPage:msg.previous,pageNumber:msg.pageNumber},loada);
	var $next = $('a[id="next"]');
	//$next.click(loadData(msg.next,msg.pageNumber));
	$next.bind('click',{nowPage:msg.next,pageNumber:msg.pageNumber},loada);
	var $last = $('a[id="last"]');
	//$last.click(loadData(msg.totalPage,msg.pageNumber));
	$last.bind('click',{nowPage:msg.totalPage,pageNumber:msg.pageNumber},loada);
	$('span[id="pagenow"]').text(msg.nowPage);
	$('span[id="pagetotal"]').text(msg.totalPage);
	$('span[id="totalquantity"]').text(msg.totalQuqatity);
}
function showModal(content,id){
	//alert(content);
	var data = {
			id:id,
	};
	loaddata(data,'/house/admin/message/update.do','post',function(msg){
		alert(msg.msg);
	});
	var $body = $('#modal_body');
	$body.text(content);
	$('#update').modal('show');
}
</script>
</body>
</html>