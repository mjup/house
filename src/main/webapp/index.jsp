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
						<li class="active">
							 <a href="/house/index.jsp">首页</a>
						</li>
						<li>
							 <a href="/house/repair.jsp">在线保修</a>
						</li>
						<li>
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
						<%-- <c:if test="${sessionScope.account!=null&&sessionScope.account=='admin'}"> --%>
						<li>
							 <a href="/house/login_admin.html">登录后台</a>
						</li>
						<%-- </c:if> --%>
					</ul>
				</div>
			</nav>
		</div>
		</div>
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-7 column">
					<div id="demo1" class="slideBox">
					  <ul class="items">
					    <li><a href="http://www.jq22.com/" title="图片一"><img src="img/1.jpg"></a></li>
					    <li><a href="http://www.jq22.com/" title="图片二"><img src="img/2.jpg"></a></li>
					    <li><a href="http://www.jq22.com/" title="图片三"><img src="img/3.jpg"></a></li>
					    <li><a href="http://www.jq22.com/" title="图片四"><img src="img/4.jpg"></a></li>
					    <li><a href="http://www.jq22.com/" title="图片五"><img src="img/5.jpg"></a></li>
					  </ul>
					</div>
				</div>
				<div class="col-md-5 column">
					<div style="width:100%;height:30px;background-color:#E7E7E7;text-align:center">
					  	<strong style="line-height:30px">最新公告</strong>
					</div>
					<div id="announce" style="text-align:center"></div>
				</div>
			</div>
		</div>
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-7 column">
					<div style="width:100%;height:30px;background-color:#E7E7E7;text-align:center">
					  	<strong style="line-height:30px">小区简介</strong>
					</div>
					<div id="introduce" style="text-align:center"></div>
				</div>
				<div class="col-md-5 column">
					<div style="width:100%;height:30px;background-color:#E7E7E7;text-align:center">
					  	<strong style="line-height:30px">公告列表</strong>
					</div>
					<div id="announces" style="text-align:center">
							<ol>
							</ol>
								<ul class="pagination">
									<li>
										 <a href="#" id="first">首页</a>
									</li>
									<li>
										 <a href="#" id="pre"><</a>
									</li>
									<li>
										 <a href="#" id="next">></a>
									</li>
									<li>
										<a> 当前第<span id="pagenow"></span>页</a>
									</li>
									<li>
										<a href=#>总共<span id="pagetotal"></span>页</a>
									</li>
								</ul>
					</div>
				</div>
			</div>
		</div>
</div>
<!-- 查看公告 modal-->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">公告内容</h4>
            </div>
            <div class="modal-body">
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
              <!--   <button type="button" class="btn btn-primary" class="saveupdate" onclick="saveupdate()">提交更改</button> -->
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
var arrays = [];
jQuery(function($){
	$('#demo1').slideBox();
});
//添加最新公告
function announce(msg){
	var $announce = $('#announce');
	$announce.append('<p><strong>'+msg.title+'</strong><span style="color:gray"><br>'+msg.sdate+'</span></p>');
	$announce.append('<div>'+msg.content+'</div>');
}
//添加小区介绍
function introduce(msg){
	//alert(msg.flag+"信息室:"+msg.msg);
	//console.log(msg);
	var $introduce = $('#introduce');
	//console.log($introduce);
	$introduce.append('<p>'+msg.msg+'</p>');
}
//添加公告列表
function announces(msg){
	//alert("执行到公告列表");
	//console.log(msg);
	var $ol = $('#announces>ol');
	$ol.empty();
	//console.log(msg.list);
	$.each(msg.list,function(index,value){
		var $li=$('<li><a href="#" onclick="showModal('+value.id+')">'+value.sdate+'---'+value.title+'</a></li>');
		$ol.append($li);
		var announce = new Announce(value.id,value.title,value.sdate,value.content);
		arrays.push(announce);
	});
	var $first = $('a[id="first"]');
	$first.bind('click',{nowPage:1,pageNumber:5},loada);
	var $pre = $('a[id="pre"]');
	//$pre.click(loadData(msg.previous,msg.pageNumber));
	$pre.bind('click',{nowPage:msg.previous,pageNumber:msg.pageNumber},loada);
	var $next = $('a[id="next"]');
	//$next.click(loadData(msg.next,msg.pageNumber));
	$next.bind('click',{nowPage:msg.next,pageNumber:msg.pageNumber},loada);
	$('span[id="pagenow"]').text(msg.nowPage);
	$('span[id="pagetotal"]').text(msg.totalPage);
	//$('span[id="totalquantity"]').text(msg.totalQuqatity);
}
function prepare(start,length){
	var data = {
			nowPage:start,
			pageNumber:length
	};
	loaddata(data,'/house/admin/announce/list.do','post',announces);
}
function loada(d){
	prepare(d.data.nowPage,d.data.pageNumber);
}
//显示详情modal
function showModal(id){
	var i;
	$.each(arrays,function(index,value){
		if(id==value.id){
			i = index;
			return;
		}
	});
	var $modal = $('#update .modal-body');
	$modal.html(arrays[i].content);
	$('#update').modal('show');
}
$(function(){
	prepare(1,5);
});
$(function(){
	loaddata(null,'/house/admin/announce/getResent.do','get',announce);
});
$(function(){
	loaddata(null,'/house/admin/sys/getIntroduce.do','post',introduce);
});
</script>
</body>
</html>