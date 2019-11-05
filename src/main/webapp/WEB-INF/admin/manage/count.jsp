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
							 <input type="text" class="form-control laydate-icon" id="month"  readonly="readonly" name="month" style="height:34px" placeholder="选择年分"/>
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
						<th>月份</th>
						<th>用水量(吨)</th>
						<th>用电量(度)</th>
						<th>用燃气量(平方米)</th>
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
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
laydate({
	  elem: '#month',
	  format: 'YYYY', // 分隔符可以任意定义，该例子表示只显示年月
	  festival: true, //显示节日
	});
function prepare(){
	var month = $('#month').val();
	if(month==""){
		alert('请选择日期');
		return;
	}
	var data = {
			year:month
	};
	loaddata(data,'/house/admin/charge/count.do','post',callback);
}
function callback(msg){
	var $thead = $('#list tbody');
	 $thead.empty();
	$.each(msg,function(index,value){
		$thead.append('<tr><td>'+value.month+'</td><td>'+value.water+'</td><td>'+value.electric+'</td><td>'+value.gas+'</td></tr>');
	});
}
$(function(){
	//loaddata(null,'/house/admin/houses/getFloorids.do','get',getFloorids);
	//$('#show').click(prepare(1,5));
	$('#show').click(prepare);
	});
</script>
</body>
</html>