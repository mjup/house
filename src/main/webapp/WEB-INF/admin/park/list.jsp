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
							<select class="form-control" id="optiona" name="optiona" onchange="prepare(1,5)">
								<option value="">请选择车位位置</option>
								<!-- <option value="2#-3#">2#-3#</option>
								<option value="1#-2#">1#-2#</option> -->
							</select>
					</div>
					<div class="form-group" style="display:inline;float:left;">
							 <select class="form-control" id="optionb" name="optionb" onchange="prepare(1,5)">
								<option value="">请选择车位状态</option>
								<option value="0">未出租</option>
								<option value="1">已出租</option>
								<option value="2">快要到期</option>
							</select>
					</div>
					<!-- <button type="button" class="btn btn-block btn-primary btn-default" id="find">查询</button> -->
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
							车位号
						</th>
						<th>
							位置
						</th>
						<th>
							车位长度
						</th>
						<th>
							车位宽度
						</th>
						<th>
							最长可出租年限
						</th>
						<th>
							费用(每年)
						</th>
						<th>
							描述
						</th>
						<th>
							状态
						</th>
						<th>
							处理
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
						<td colspan="9">
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
<!-- 出租modal -->
<div class="modal fade" id="hire" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">车位出租</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" class="saveupdate" onclick="saverent()">提交更改</button>
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<!-- 续租modal -->
<div class="modal fade" id="relet" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">车位续租</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" class="saveupdate" onclick="updaterelet()">提交</button>
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<!-- 查看modal -->
<div class="modal fade" id="look" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">车位出租信息查看</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                <!-- <button type="button" class="btn btn-primary" class="saveupdate">提交更改</button> -->
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
	function prepare(start,length){
		var data = {
				nowPage:start,
				pageNumber:length,
		};
		if($('select#optiona').val()!=''){
			data.location=$('select#optiona').val();
		}
		if($('select#optionb').val()!=''){
			data.status=$('select#optionb').val();
		}
		//console.log(data);
		loaddata(data,'/house/admin/park/list.do','post',callback);
	}
	function loada(d){
		//console.log(d);
		prepare(d.data.nowPage,d.data.pageNumber);
	}
	function callback(msg){
		var $tbody = $('table#list>tbody');
		$tbody.empty();
		$.each(msg.list,function(index,value){
			var $tr=$('<tr><td><input type="checkbox" value="'+value.id+'"></td><td class="tdid">'+value.id+'</td><td class="tdlocation">'+value.location+'</td><td class="tdlength">'+value.length+'米</td><td class="tdwidth">'+value.width+'米</td><td class="tdmaxyear">'+value.maxyear+'年</td><td class="tdcharge">'+value.charge+'元</td><td>'+value.note+'</td></tr>');
			if(value.status==0){
				$td = $('<td>未出租</td><td><a href="#" onclick="rent(this)">出租</a></td>');
				$tr.append($td);
			}
			if(value.status==1){
				$td = $('<td>已出租</td><td><a href="#" onclick="getbyid('+value.id+')">查看</a></td>');
				$tr.append($td);
			}
			if(value.status==2){
				$td = $('<td>快要到期</td><td><a href="#" onclick="relet('+value.id+')">续租</a></td>');
				$tr.append($td);
			}
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
	//出租模态框
	function rent(a){
		var data = {};
		var $tr = $(a).parent().parent();
		data.id=$tr.children('.tdid').text();
		data.location = $tr.children('.tdlocation').text();
		data.width = $tr.children('.tdwidth').text();
		data.length = $tr.children('.tdlength').text();
		data.charge = $tr.children('.tdcharge').text();
		data.maxyear = $tr.children('.tdmaxyear').text();
		console.log(data);
		var $hire = $('div#hire').find('.modal-body table');
		$hire.empty();
		var $tr1 = $('<tr><td>车位序号</td><td id="parkid">'+data.id+'</td><td>车位位置</td><td>'+data.location+'</td></tr>');
		var $tr2 = $('<tr><td>车位宽度</td><td>'+data.width+'</td><td>车位长度</td><td>'+data.length+'</td></tr>');
		var $tr3 = $('<tr><td>车位每年费用</td><td id="charge">'+data.charge+'</td><td>车位最大年份</td><td>'+data.maxyear+'</td></tr>');
		
		var $tr4 = $('<tr><td>租借人房号</td><td><input type="text" name="renthouse"></td><td>租借人电话</td><td><input type="text" name="rentphone"></td></tr>');
		var $tr5 = $('<tr><td>租借人姓名</td><td><input type="text" name="rentname"></td><td>租期</td></tr>');
		var $td=$('<td><select name="lease"></select></td>');
		for(var i =0;i<parseInt(data.maxyear);i++){
			var $option = $('<option value="'+(i+1)+'">'+(i+1)+'年</option>');
			if(i==0){
				$option.attr("selected","selected");
			}
			$td.find('select').append($option);
		}
		$td.append('<span>开始日期</span><input type="text" name="time" class="laydate-icon" readonly="readonly" onclick="laydate()"/>');
		$tr5.append($td);
		var $tr6 = $('<tr><td>受理人姓名</td><td><input type="text" name="rname"></td><td>备注</td><td><textarea name="note"></textarea></td></tr>');
		$hire.append($tr1,$tr2,$tr3,$tr4,$tr5,$tr6);
		$('#hire').modal('show');
	}
	//保存出租信息
	function saverent(){
		var $hire = $('div#hire').find('.modal-body table');
		var data = {
			pid:$('#parkid').text(),
			hname:$hire.find('input[name="rentname"]').val(),
			houseid:$hire.find('input[name="renthouse"]').val(),
			hphone:$hire.find('input[name="rentphone"]').val(),
			hcharge:parseFloat($hire.find('#charge').text()),
			startdate:$hire.find('input[name="time"]').val(),
			lease:$hire.find('select[name="lease"]').val(),
			rname:$hire.find('input[name="rname"]').val(),
			descr:$hire.find('textarea[name="note"]').val()
		};
		//console.log($('#parkid'));
		//console.log(data);
		loaddata(data,'/house/admin/hire/save.do','post',function(msg){
			if(true){
				alert('保存成功');
				$('#hire').modal('hide');
				loaddata(data,'/house/admin/park/list.do','post',callback);
			}
		})
	}
	//根据车位id查询相应的出租信息
	function getbyid(id){
		var data = {id:id};
		loaddata(data,'/house/admin/hire/get.do','post',showlook);
	}
	//显示查看模态框回调函数
	function showlook(msg){
		var $table = $('#look table');
		$table.empty();
		$tr1 = $('<tr><td>车位号</td><td>'+msg.id+'</td><td>租借人姓名</td><td>'+msg.hname+'</td></tr>');
		$tr2 = $('<tr><td>租借人房号</td><td>'+msg.houseid+'</td><td>租借人电话</td><td>'+msg.hphone+'</td></tr>');
		$tr3 = $('<tr><td>租期</td><td colspan="3">'+msg.lease+'年      from'+msg.startdate+' to '+msg.enddate+'</td></tr>');
		$tr4 = $('<tr><td>租金</td><td>'+msg.hcharge+'元/每年</td><td>受理人姓名</td><td>'+msg.rname+'</td></tr>');
		$tr5 = $('<tr><td colspan="2">办理日期</td><td colspan="2">'+msg.tdate+'</td></tr>');
		$tr6 = $('<tr><td colspan="2">备注</td><td colspan="2">'+msg.descr+'</td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4,$tr5,$tr6);
		$('#look').modal('show');
	}
	//续租模态框弹出初始化
	function relet(id){
		var data = {id:id};
		loaddata(data,'/house/admin/hire/getrelet.do','post',showRelet);
	}
	//显示续租模态框回调函数
	function showRelet(msg){
		var $table = $('#relet table');
		$table.empty();
		$tr1 = $('<tr><td>位置</td><td>'+msg.location+'</td><td>宽度</td><td>'+msg.width+'</td></tr>');
		$tr2 = $('<tr><td>长度</td><td>'+msg.length+'</td><td>租借人房号</td><td>'+msg.houseid+'</td></tr>');
		$tr3 = $('<tr><td>租借人姓名</td><td>'+msg.hname+'</td><td>租借人电话</td><td>'+msg.hphone+'</td></tr>');
		$tr4 = $('<tr><td>租期</td><td colspan="3">from:'+msg.startdate+' <select name="year"></select></td></tr>');
		for(var i =0;i<(msg.maxyear-msg.lease);i++){
			var $option = $('<option value="'+(msg.lease+i+1)+'">'+(i+1)+'年</option>');
			if(i==0){
				$option.attr("selected","selected");
			}
			$tr4.find('select').append($option);
		}
		$tr5 = $('<tr><td>受理人姓名</td><td><input type="text" name="username"></td><td>备注</td><td><textarea>'+msg.descr+',上次受理人是'+msg.rname+'</textarea></td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4,$tr5);
		$table.append('<input type="hidden" value="'+msg.id+'" name="id">')
		$('#relet').modal('show');
	}
	function updaterelet(){
		var $table = $('#relet table');
		var data = {
				lease:$table.find('select[name="year"]').val(),
				rname:$table.find('input[name="username"]').val(),
				descr:$table.find('textarea').val(),
				id:$table.find('input[name="id"]').val()
		};
		loaddata(data,'/house/admin/hire/update.do','post',function(msg){
			if(msg){
				alert("续租成功");
				prepare(1,5);
				$('#relet').modal('hide');
			}else{
				alert("续租失败");
				$('#relet').modal('hide');
			}
		});
		
	}
	$(function(){
		loaddata(null,'/house/admin/park/getLocations.do','post',function(msg){
			var $select = $('#optiona');
			$.each(msg,function(index,value){
				var $option = $('<option value="'+value+'">'+value+'</option>');
				$select.append($option);
			});
		});
	});
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
				url:'/house/admin/park/delete.do',
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