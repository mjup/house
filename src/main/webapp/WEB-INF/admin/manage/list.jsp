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
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <input type="text" class="form-control laydate-icon" id="month"  readonly="readonly" name="month" style="height:34px" placeholder="选择年月份"/>
						</div>
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <select class="form-control" id="optionb" name="optionb">
							 	<option value="">请选择楼号</option>
							</select>
					</div>
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <select class="form-control" id="optiona" name="optiona">
							 	<option value="">请选择状态</option>
							 	<option value="0">未缴费</option>
							 	<option value="1">已经缴费</option>
							</select>
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="show">查询</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered" id="list">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							房号
						</th>
						<th>
							年月份
						</th>
						<th>
							水费
						</th>
						<th>
							电费
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
							处理
						</th>
					</tr>
				</thead>
				<tbody>
			
				</tbody>
				<!-- <tfoot>
					<tr>
						<td>
							<input type="checkbox" id="selectall">全选
						</td>
						<td colspan="6">
							<button id="delete">删除所选项</button>
						</td>
					</tr>
				</tfoot> -->
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
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveupdate" onclick="saveMessage()">发送缴费单</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- 结束 -->
<!-- 查看详情modal -->
<div class="modal fade" id="look" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">详情</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                <!-- <button type="button" class="btn btn-primary" id="saveupdate" onclick="saveMessage()">发送缴费单</button> -->
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
laydate({
	  elem: '#month',
	  format: 'YYYY-MM', // 分隔符可以任意定义，该例子表示只显示年月
	  festival: true, //显示节日
	});
function getFloorids(msg){
	var $optionb = $('#optionb');
	$.each(msg,function(index,value){
		var $option = $('<option value="'+value+'">'+value+'</option>');
		$optionb.append( $option);
	});
}
function prepare(start,length){
	var optionb = $('#optionb').val();
	if(optionb==""){
		alert('请选择哪栋楼')
		return;
	}
	var month = $('#month').val();
	//console.log($('#month').val());
	if(month==""){
		alert('请选择日期');
		return;
	}
	var data = {
			floorid:$('#optionb').val(),
			month:$('#month').val(),
			nowPage:start,
			pageNumber:length
	};
	if($('#optiona').val()!=""){
		data.status=$('#optiona').val();
	}
	loaddata(data,'/house/admin/charge/list.do','post',loadData);
}
function loada(d){
	//console.log(d);
	prepare(d.data.nowPage,d.data.pageNumber);
}
function loadData(msg){
	console.log(msg);
	var $tbody = $('table#list>tbody');
	$tbody.empty();
	//console.log(msg.list);
	$.each(msg.list,function(index,value){
		var $tr=$('<tr><td class="id">'+value.id+'</td><td class="houseid">'+value.houseid+'</td><td class="month">'+value.month+'</td><td class="water">'+value.water+'元</td><td class="electric">'+value.electric+'元</td><td class="gas">'+value.gas+'元</td><td class="wuye">'+value.wuye+'元</td><td class="total">'+(value.gas*1+value.water*1+value.electric*1+value.wuye*1).toFixed(2)+'元</td></tr>');
		var $td;
		if(value.status==0){
			$td = $('<td>未交费</td><td><a href="#" onclick="sendModal(this)">发送缴费单</a></td>');
		}else{
			$td = $('<td>已经交费</td><td><a href="#" onclick="look('+value.id+')">查看详情</a></td>');
		}
		$tr.append($td);
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
//采集发送缴费单所需数据
function sendModal(target){
	var id = $(target).parent().parent().children('.id').text();
	var houseid =$(target).parent().parent().children('.houseid').text();
	var month = $(target).parent().parent().children('.month').text();
	var water = $(target).parent().parent().children('.water').text();
	var electric = $(target).parent().parent().children('.electric').text();
	var gas = $(target).parent().parent().children('.gas').text();
	var wuye = $(target).parent().parent().children('.wuye').text();
	var total = $(target).parent().parent().children('.total').text();
	var $sendModal = $('#myModal .modal-body table');
	$sendModal.empty();
	$sendModal.append('<tr><td>房号</td><td class="houseid">'+houseid+'</td><td>年月份</td><td class="month">'+month+'</td><td>水费</td><td>'+water+'</td></tr>');
	$sendModal.append('<tr><td>电费</td><td>'+electric+'</td><td>燃气费</td><td>'+gas+'</td><td>物业费</td><td>'+wuye+'</td></tr>');
	$sendModal.append('<tr><td>总价</td><td>'+total+'</td></tr>');
	loaddata({id:id},'/house/admin/charge/detail.do','post',sendCallback);
}
//发送缴费单回调函数
function sendCallback(msg){
	//console.log(msg);
	//console.log("water总价是:"+water)
	$sendModal = $('#myModal .modal-body table');
	var $tr=$sendModal.find('tr:last');
	$tr.append('<td>户主姓名</td><td class="owner">'+msg.owner+'</td><td>户主电话</td><td>'+msg.ownerphone+'</td>');
	$sendModal.append('<tr><td>用电量</td><td>'+msg.electric+'度</td><td>用水量</td><td>'+msg.water+'吨</td><td>用燃气量</td><td>'+msg.gas+'</td></tr>');
	$('#myModal').modal('show');
}
//保存缴费通知
function saveMessage(){
	var account = $('#myModal .modal-body table').find('.houseid').text();
	var owner = $('#myModal .modal-body table').find('.owner').text();
	var month = $('#myModal .modal-body table').find('.month').text();
	var data = {
			houseid:account,
			title:'物业缴费通知单',
			content:owner+'您好,您'+month+'的物业费还没有缴,请务必尽快进行缴费'
	};
	loaddata(data,'/house/admin/message/save.do','post',function(msg){
		if(msg){
			alert('通知成功');
			$('#myModal').modal('hide');
			//window.location.reload();
		}else{
			alert('通知失败');
		}
	});
}
//已经完成缴费的查询
function look(id){
	var data = {
			id:id
	};
	loaddata(data,'/house/admin/charge/look.do','post',showLook);
}
//动态添加到modal中
function showLook(msg){
	console.log(msg);
	$tr1=$('<tr><td>房号</td><td>'+msg.houseid+'</td><td>年月份</td><td>'+msg.month+'</td><td>房主电话</td><td>'+msg.ownerphone+'</td></tr>');
	$tr2=$('<tr><td>用水量</td><td>'+msg.waterPrice+'</td><td>水费</td><td>'+msg.water+'</td><td>用电量</td><td>'+msg.electricPrice+'</td></tr>');
	$tr3=$('<tr><td>电费</td><td>'+msg.electirc+'</td><td>用气量</td><td>'+msg.gasPrice+'</td><td>燃气费</td><td>'+msg.gas+'</td></tr>');
	$tr4=$('<tr><td>物业费</td><td>'+msg.wuye+'</td><td>总价</td><td>'+(msg.gas*1+msg.electirc*1+msg.wuye*1+msg.water*1)+'</td><td>收费人</td><td>'+msg.rname+'</td></tr>');
	$tr5=$('<tr><td>收费时间</td><td>'+msg.cdate+'</td><td>房主</td><td>'+msg.owner+'</td></tr>');
	if(msg.means==1){
		$td = $('<td>收费方式</td><td>人工收费</td>');
		$tr5.append($td);
	}else{
		$td = $('<td>收费方式</td><td>网上收费</td>');
		$tr5.append($td);
	}
	var $table =$('#look table');
	$table.append($tr1,$tr2,$tr3,$tr4,$tr5);
	$('#look').modal('show');
}
$(function(){
	loaddata(null,'/house/admin/houses/getFloorids.do','get',getFloorids);
	//$('#show').click(prepare(1,5));
	$('#show').bind('click',{nowPage:1,pageNumber:5},loada);
	});
</script>
</body>
</html>