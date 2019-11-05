<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/house/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<!-- <div class="row clearfix">
			<div class="col-md-12 column">
				<div class="btn-group btn-group-lg">
					 <button class="btn btn-default" type="button"><em class="glyphicon glyphicon-align-left"></em> 删除</button> <button class="btn btn-default" type="button"><em class="glyphicon glyphicon-align-center"></em> 修改</button>
				</div>
			</div>
		</div> -->
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="btn-group btn-group-lg" style="text-align:center">
					<div class="form-group" style="display:inline;float:left;">
						<input type="text" class="form-control" id="parkid" name="parkid" placeholder="车位号"/>
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="find" onclick="prepare(1,5)">查询</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>
							选择
						</th>
						<th>
							租借人房号
						</th>
						<th>
							租借人姓名
						</th>
						<th>
							租借人电话
						</th>
						<th>
							租金
						</th>
						<th>
							租期
						</th>
						<th>
							受理人
						</th>
						<th>
							受理日期
						</th>
					</tr>
				</thead>
				<tbody>
			
				</tbody>
				<tfoot>
					<tr>
						<td>
							<input type="checkbox" id="selectall" onclick="selectAll(this,'table#list tbody :checkbox')">全选
						</td>
						<td colspan="7">
							<button id="delete">删除所选项</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-8 column" style="float:right">
			<ul class="pagination">
				<li>
					 <a href="#" id="first">首页</a>
				</li>
				<li>
					 <a href="#" id="pre">上一页</a>
				</li>
				<li>
					 <a href="#" id="next">下一页</a>
				</li>
				<li>
					 <a href="#" id="last">尾页</a>
				</li>
				<li>
					<a> 当前第<span id="pagenow"></span>页</a>
				</li>
				<li>
					<a href=#>总共<span id="pagetotal"></span>页</a>
				</li>
				<li>
					<a> 总共<span id="totalquantity"></span>条记录</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript">
function prepare(start,length){
	var data = {
			nowPage:start,
			pageNumber:length,
	};
	if($('#parkid').val()!=''&&$('#parkid').val().length>0){
		data.pid=$('#parkid').val();
	}
	console.log(data);
	loaddata(data,'/house/admin/hire/list.do','post',callback);
}
function loada(d){
	//console.log(d);
	prepare(d.data.nowPage,d.data.pageNumber);
}
function callback(msg){
	var $tbody = $('table#list>tbody');
	$tbody.empty();
	$.each(msg.list,function(index,value){
		var $tr=$('<tr><td><input type="checkbox" value="'+value.id+'"></td><td>'+value.houseid+'</td><td>'+value.hname+'</td><td>'+value.hphone+'</td><td>'+value.hcharge+'元</td><td>'+value.lease+'    年，从  '+value.startdate+'开始</td><td>'+value.rname+'</td><td>'+value.tdate+'</td></tr>');
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
$(function(){
	var $delbutton = $('button#delete');
	$delbutton.click(function(){
		var ids = [];
		$('table#list tbody :checked').each(function(index,value){
			ids[index] = $(value).val();
		});
		ajaxArray({ids:ids},'/house/admin/hire/delete.do','post',function(msg){
			if(msg){
				alert('删除成功');
				prepare(1,5);
			}else{
				alert('删除失败');
			}
		});
	});
});
</script>
</body>
</html>