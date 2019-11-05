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
						<input type="text" class="form-control laydate-icon" id="startdate" name="startdate" readonly="readonly" onclick="laydate()" style="height:34px" placeholder="开始时间"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
						<input type="text" class="form-control laydate-icon" id="enddate" name="enddate" readonly="readonly" onclick="laydate()" style="height:34px" placeholder="结束时间"/>
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
							编号
						</th>
						<th>
							标题
						</th>
						<th>
							时间
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
			
				</tbody>
				<tfoot>
					<tr>
						<td>
							<input type="checkbox" id="selectall">全选
						</td>
						<td colspan="4">
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
<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">详情</h4>
            </div>
            <div class="modal-body">
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               <!--  <button type="button" class="btn btn-primary" id="saveupdate">提交更改</button> -->
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- 结束 -->
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
var announces = [];
function prepare(start,length){
	//alert("执行到这里");
	var data = {
			nowPage:start,
			pageNumber:length,
	};
	if($('input[name="startdate"]').val()!=''){
		data.startdate=$('input[name="startdate"]').val();
	}
	if($('input[name="enddate"]').val()!=''){
		data.enddate=$('input[name="enddate"]').val();
	}
	//console.log(data);
	loaddata(data,'/house/admin/announce/list.do','post',callback);
}
function loada(d){
	//console.log(d);
	prepare(d.data.nowPage,d.data.pageNumber);
}
function callback(msg){
	var $tbody = $('table#list>tbody');
	$tbody.empty();
	$.each(msg.list,function(index,value){
		var $tr=$('<tr><td><input type="checkbox" value="'+value.id+'"></td><td>'+value.id+'</td><td>'+value.title+'</td><td>'+value.sdate+'</td><td><a href="#" onclick="showModal('+value.id+')">查看内容</a></td></tr>');
		var announce = new Announce(value.id,value.title,value.sdate,value.content);
		announces.push(announce);
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
//显示详情modal
function showModal(id){
	var i;
	$.each(announces,function(index,value){
		if(id==value.id){
			i = index;
			return;
		}
	});
	var $modal = $('#myModal .modal-body');
	$modal.html(announces[i].content);
	$('#myModal').modal('show');
}
$(function(){
	prepare(1,5);
	$('table#list tfoot #selectall').click(function(){
		if(this.checked){
			$('table#list tbody :checkbox').prop("checked",true);
		}else{
			$('table#list tbody :checkbox').prop("checked",false);
		}
	});
	$('table#list tfoot #delete').click(function(){
		var ids = [];
		$('table#list tbody :checked').each(function(index,value){
			ids[index] = $(value).val();
		});
		$.ajax({
			url:'/house/admin/announce/delete.do',
			data:{ids:ids},
			method:'post',
			dataType:'json',
			traditional: true,  
			success:function(msg){
				if(msg){
					alert("删除成功");
					//window.location.reload();
					prepare(1,5);
				}
			}
		});
	});
});
</script>
</body>
</html>