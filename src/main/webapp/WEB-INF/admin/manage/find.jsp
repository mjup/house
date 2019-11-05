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
							 <input type="text" class="form-control" id="houseid" name="houseid" style="height:34px" placeholder="请输入房号"/>
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="show">查询</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered" id="list">
				<tbody>
			
				</tbody>
			</table>
		</div>
	</div>
</div>
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
function prepare(){
	var houseid = $('#houseid').val();
	if(houseid==""){
		alert('请输入房号')
		return;
	}
	var month = $('#month').val();
	//console.log($('#month').val());
	if(month==""){
		alert('请选择日期');
		return;
	}
	var data = {
			houseid:houseid,
			month:month,
	};
	if($('#optiona').val()!=""){
		data.status=$('#optiona').val();
	}
	loaddata(data,'/house/admin/charge/find.do','post',loadData);
}
function loadData(msg){
	console.log(msg);
	var $tbody = $('table#list>tbody');
	$tbody.empty();
	$tr1=$('<tr><td>房号</td><td>'+msg.account+'</td><td>年月份</td><td>'+msg.month+'</td><td>房主电话</td><td>'+msg.ownerphone+'</td></tr>');
	$tr2=$('<tr><td>用水量</td><td>'+msg.water+'</td><td>水费</td><td>'+msg.waterPrice+'</td><td>用电量</td><td>'+msg.electric+'</td></tr>');
	$tr3=$('<tr><td>电费</td><td>'+msg.electircPrice+'</td><td>用气量</td><td>'+msg.gas+'</td><td>燃气费</td><td>'+msg.gasPrice+'</td></tr>');
	$tr4=$('<tr><td>物业费</td><td>'+msg.wuyePrice+'</td><td>总价</td><td>'+(msg.gasPrice*1+msg.electircPrice*1+msg.wuyePrice*1+msg.waterPrice*1)+'</td><td>收费人</td><td><input type="text" name="fuzeren" id="fuzeren"></td></tr>');
	$tr5 = $('<tr><td colspan="6" style="text-align:center"><button onclick="sendModal()">保存</button></td></tr>');
	$tbody.append($tr1,$tr2,$tr3,$tr4,$tr5);
}
//保存收费人
function sendModal(){
	var rname = $('#fuzeren').val();
	var data = {
			rname:rname,
			houseid:$('#houseid').val(),
			month:$('#month').val(),
			means:1
	};
	loaddata(data,'/house/admin/charge/update.do','post',function(msg){
		alert(msg.msg);
		if(msg.flag){
			if(confirm("是否继续?")){
				window.location.reload();
			}else{
				window.location.href='/house/admin/page/manage/list.do';
			}
		}
	});
}
$(function(){
	loaddata(null,'/house/admin/houses/getFloorids.do','get',getFloorids);
	//$('#show').click(prepare(1,5));
	$('#show').click(prepare);
	});
</script>
</body>
</html>