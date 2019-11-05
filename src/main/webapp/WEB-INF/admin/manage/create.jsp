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
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="btn-group btn-group-lg" style="text-align:center">
					<div class="form-group" style="display:inline;float:left;">
							 <input type="text" class="form-control laydate-icon" id="month"  readonly="readonly" name="month" style="height:34px" placeholder="选择年月份"/>
						</div>
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <select class="form-control" id="optionb" name="optionb">
							 	<option value="">请选择楼号</option>
							</select>
					</div>
					<div class="form-group" style="display:inline;float:left;margin-left:30px">
							 <input type="radio" value="1" name="type"><span>水</span>
							 <input type="radio" value="3" name="type"><span>电</span>
							 <input type="radio" value="2" name="type"><span>燃气</span>
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="show">显示</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered" id="list">
				<thead>
					
				</thead>
				<tbody>
				
				</tbody>
				<tfoot>
					
				</tfoot>
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
//动态生成需要添加的房价
function showTable(msg){
	//console.log(msg.length);
	var type;
	var flag = $('input[name="type"]:checked').val();
	if(flag==null){
		alert('请选择类型');
		return;
	}
	switch(flag){
		case '1':type='吨';
			break;
		case '2':type='立方米';
			break;
		case '3':type='度';
			break;
		default:type='吨';
			break;
	}
	var $thead = $('table#list>thead');
	$thead.empty();
	var $thead_tr;
	var $tbody = $('table#list>tbody');
	$tbody.empty();
	if(msg.length>4){
		$thead_tr=$('<tr><td>房号</td><td>用量('+type+')</td><td>房号</td><td>用量('+type+')</td><td>房号</td><td>用量('+type+')</td><td>房号</td><td>用量('+type+')</td></tr>');
		$thead.append($thead_tr);
		///var $tr=$('<tr></tr>');
		var rows = Math.ceil(msg.length/6);
		for(var i = 0;i<rows;i++){
			var $tr=$('<tr></tr>');
			var length = (msg.length-(i*4)>4)?4:(msg.length-(i*4));
			for(var j=0;j<length;j++){
				$tr.append('<td class="account">'+msg[i*4+j]+'</td><td><input type="text" class="value"></td>');
			}
			$tbody.append($tr);
		}
		
	}else{
		var str='<tr>';
		for(var i = 0;i<msg.length;i++){
			str=str+'<td>房号</td><td>用量('+type+')</td>';
		}
		str=str+'</tr>';
		$thead_tr=$(str);
		$thead.append($thead_tr);
		str = '<tr>';
		for(var i=0;i<msg.length;i++){
			str=str+'<td class="account">'+msg[i]+'</td><td><input type="text" class="value"></td>'
		}
		str=str+'</tr>';
		$tbody.append($(str));
	}
	var $tfoot = $('table#list>tfoot');
	$tfoot.empty();
	var num = msg.length>6?12:msg.length*2;
	$tfoot.append('<tr><td colspan="'+num+'" style="text-align:center"><button id="save" onclick="save()">保存</button></td></tr>');
}
//保存用量
function save(){
	var $accounts = $('table#list>tbody .account');
	//var $values = $('table#list>tbody .value');
	var data = {};
	data.type=parseInt($('input[name="type"]:checked').val());
	var name;
	data.month=$('#month').val();
	data.floorid=$('#optionb').val();
	var array = [];
	data.array=array;
	$accounts.each(function(index,value){
		var dosage = new Dosage($(value).text(),parseFloat($(value).next().find('input').val()),data.type);
		array.push(dosage);
	});
	//console.log(JSON.stringify(data));
	loaddata({json:JSON.stringify(data)},'/house/admin/charge/save.do','post',function(msg){
		alert(msg.msg);
		if(msg.flag){
			if(confirm("是否继续添加?")){
				window.location.reload();
			}else{
				//alert('跳转到列表页面');
				window.location.href='/house/admin/page/manage/list.do';
			}
		}
	});
}
	$(function(){
		loaddata(null,'/house/admin/houses/getFloorids.do','get',getFloorids);
		$('#show').click(function(){
			var flag = $('input[name="type"]:checked').val();
			if(flag==null){
				alert('请选择类型');
				return;
			}
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
			loaddata({floorid:$('#optionb').val()},'/house/admin/houses/getAccounts.do','get',showTable);
		});
		});
</script>
</body>
</html>