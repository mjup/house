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
						<input type="text" class="form-control laydate-icon" id="reportdate" name="reportdate" readonly="readonly" onclick="laydate()" placeholder="申请维修日期" style="height:34px"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
						<input type="text" class="form-control laydate-icon" id="startdate" name="startdate" readonly="readonly" onclick="laydate()" placeholder="开始日期" style="height:34px"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
						<input type="text" class="form-control laydate-icon" id="enddate" name="enddate" readonly="readonly" onclick="laydate()" placeholder="结束日期" style="height:34px"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
					<!-- //0水表,1电表,2燃气表,3水管,4电线,5燃气管,6其他 -->
						<select name="category" id="category" class="form-control">
							<option value="">请选择保修类型</option>
							<option value="水表">水表</option>
							<option value="电表">电表</option>
							<option value="燃气表">燃气表</option>
							<option value="水管">水管</option>
							<option value="电线">电线</option>
							<option value="燃气管">燃气管</option>
							<option value="其他">其他</option>
						</select>
					</div>
					<div class="form-group" style="display:inline;float:left;">
					<!-- //0未处理,1正在处理,2已经处理完成但没有交钱,3处理完成并且交钱了-->
						<select name="status" class="form-control" id="status">
							<option value="">请选择保修类型</option>
							<option value="0">未处理</option>
							<option value="1">正在处理</option>
							<option value="2">已经处理完成但没有交钱</option>
							<option value="3">处理完成并且交钱了</option>
						</select>
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
							报修类型
						</th>
						<th>
							保修房号
						</th>
						<th>
							保修描述
						</th>
						<th>
							保修时间
						</th>
						<th>
							保修方式
						</th>
						<th>
							处理状态
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
						<td colspan="8">
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
<!-- 安排维修modal -->
<div class="modal fade" id="assign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">安排维修</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" class="saveupdate" onclick="updateprincipal()">提交更改</button>
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<!-- 维修费用填写modal -->
<div class="modal fade" id="cmoplete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">维修费用填写</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" class="saveupdate" onclick="updateComplete()">提交</button>
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->
<!-- 催促缴费modal -->
<div class="modal fade" id="press" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">催促缴费单</h4>
            </div>
            <div class="modal-body">
            	<table border="1px" cellpadding="10"></table>
            </div>
            <div class="modal-footer">
               <!--  <button type="button" class="btn btn-default" data-dismiss="modal">确定</button> -->
                <button type="button" class="btn btn-primary" class="send" onclick=" send()">发送催促缴费单</button>
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
                <h4 class="modal-title" id="myModalLabel">已完成缴费信息查看</h4>
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
		if($('#repairdate').val()!='' && $('#reportdate').val().length>0){
			data.reportdate=$('#reportdate').val();
		}
		if($('#startdate').val()!='' && $('#startdate').val().length>0){
			data.startdate=$('#startdate').val();
		}
		if($('#enddate').val()!='' && $('#enddate').val().length>0){
			data.enddate=$('#enddate').val();
		}
		if($('#category').val()!=''){
			data.category = $('#category').val();
		}
		if($('#status').val()!=''){
			data.status = $('#status').val();
		}
		console.log('传递的数据是:'+data);
		loaddata(data,'/house/admin/repair/list.do','post',callback);
	}
	function loada(d){
		//console.log(d);
		prepare(d.data.nowPage,d.data.pageNumber);
	}
	function callback(msg){
		var $tbody = $('table#list>tbody');
		$tbody.empty();
		//console.log(msg.list);
		$.each(msg.list,function(index,value){
			var $tr=$('<tr><td><input type="checkbox" value="'+value.id+'"></td><td>'+value.id+'</td></tr>');
			//<!-- //0水表,1电表,2燃气表,3水管,4电线,5燃气管,6其他 -->
			var $td;
			switch(value.category){
			case '水表':$td = $('<td>水表</td>');
				break;
			case '电表':$td = $('<td>电表</td>');
				break;
			case '燃气表':$td = $('<td>燃气表</td>');
				break;
			case '水管':$td = $('<td>水管</td>');
				break;
			case '电线':$td = $('<td>电线</td>');
				break;
			case '燃气管':$td = $('<td>燃气管</td>');
				break;
			case '其他':$td = $('<td>其他</td>');
				break;
			default:$td = $('<td>水表</td>');
				break;
			}
			$tr.append($td,'<td>'+value.houseid+'</td><td>'+value.descr+'</td><td>'+value.reportdate+'</td>');
			switch(value.means){
			case 1:$td = $('<td>客服中心保修</td>');
			break;
			case 2:$td = $('<td>电话保修</td>');
			break;
			case 3:$td = $('<td>网上保修</td>');
			break;
			default:$td = $('<td>客服中心保修</td>');
			break;
			}
			$tr.append($td);
			//<!-- //0未处理,1正在处理,2已经处理完成但没有交钱,3处理完成并且交钱了-->loaddata(data,url,method,callback)
			switch(value.status){
			case 0:$td = $('<td>未处理</td><td><a href="#" onclick="loaddata({id:'+value.id+',type:1},\'/house/admin/repair/getById.do\',\'post\',repairmodal)">安排维修</a></td>');
				break;
			case 1:$td = $('<td>正在处理</td><td><a href="#" onclick="loaddata({id:'+value.id+',type:1},\'/house/admin/repair/getById.do\',\'post\',completeInfo)">维修完成信息填写</a></td>');
			break;
			case 2:$td = $('<td>处理完成未缴费</td><td><a href="#" onclick="loaddata({id:'+value.id+',type:1},\'/house/admin/repair/getById.do\',\'post\',press)">催促缴费</a></td>');
			break;
			case 3:$td = $('<td>处理完成已缴费</td><td><a href="#" onclick="loaddata({id:'+value.id+',type:1},\'/house/admin/repair/getById.do\',\'post\',look)">查看</a></td>');
			break;
			default:$td = $('<td>未处理</td><td><a href="#" onclick="loaddata({id:'+value.id+',type:1},\'/house/admin/repair/getById.do\',\'post\',repairmodal)">安排维修</a></td>');
			break;
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
	//显示安排维修模态框
	function repairmodal(msg){
		//console.log(msg);
		var $table = $('#assign table');
		//console.log($tbody);
		$table.empty();
		var $tr1 = $('<tr><td>编号</td><td class="repairid">'+msg.id+'</td><td>保修类别</td><td>'+msg.category+'</td><td>保修时间</td><td>'+msg.reportdate+'</td></tr>');
		var $tr2 = $('<tr><td>维修负责人</td><td><input type="text" name="fuzeren"></td><td>保修房号</td><td>'+msg.account+'</td><td>户主姓名</td><td>'+msg.owner+'</td></tr>');
		var $tr3 = $('<tr><td>户主电话</td><td>'+msg.ownerphone+'</td><td>报修方式</td></tr>');
		var $td;
		switch(msg.means){
		case 1:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		case 2:$td = $('<td colspan="3">电话保修</td>');
		break;
		case 3:$td = $('<td colspan="3">网上保修</td>');
		break;
		default:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		}
		$tr3.append($td);
		$tr4 = $('<tr><td>报修描述</td><td colspan="5">'+msg.descr+'</td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4);
		$('#assign').modal('show');
	}
	//维修安排信息提交
	function updateprincipal(){
		var $table = $('#assign table');
		var data = {
				id:$('#assign table .repairid').text(),
				principal:$('#assign table input[name="fuzeren"]').val(),
				type:1
		};
		loaddata(data,'/house/admin/repair/updateById.do','post',function(msg){
			if(msg){
				alert('安排成功');
				$('#assign').modal('hide');
				window.location.reload();
			}else{
				alert('修改失败');
			}
		});
	}
	//显示维修完成之后信息填写模态框
	function completeInfo(msg){
		var $table = $('#cmoplete table');
		$table.empty();
		var $tr1 = $('<tr><td>编号</td><td class="repairid">'+msg.id+'</td><td>保修类别</td><td>'+msg.category+'</td><td>保修时间</td><td>'+msg.reportdate+'</td></tr>');
		var $tr2 = $('<tr><td>维修负责人</td><td>'+msg.principal+'</td><td>保修房号</td><td>'+msg.account+'</td><td>户主姓名</td><td>'+msg.owner+'</td></tr>');
		var $tr3 = $('<tr><td>户主电话</td><td>'+msg.ownerphone+'</td><td>报修方式</td></tr>');
		var $td;
		switch(msg.means){
		case 1:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		case 2:$td = $('<td colspan="3">电话保修</td>');
		break;
		case 3:$td = $('<td colspan="3">网上保修</td>');
		break;
		default:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		}
		$tr3.append($td);
		$tr4 = $('<tr><td>材料费</td><td><input type="text" name="material"></td><td>维修费</td><td><input type="text" name="upkeep"></td><td>维修时间</td><td>从<input type="text" name="repairdate" class="laydate-icon" readonly="readonly" onclick="laydate()">到<input type="text" name="completedate" class="laydate-icon" readonly="readonly" onclick="laydate()"></td></tr>');
		$tr5 = $('<tr><td>是否已经缴费</td><td>是<input type="radio" name="ispay" value="3">            否<input type="radio" name="ispay" value="2" checked></td><td colspan="2">缴费日期</td><td colspan="2"><input type="text" name="paydate" class="laydate-icon" readonly="readonly" onclick="laydate()"></td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4,$tr5);
		$table.find('tr td:even').css("width","60px");
		$table.find('tr td:odd').css("width","200px");
		$('#cmoplete').modal('show');
	}
	//保存消费信息
	function updateComplete(){
		var data = {
				id:$('#cmoplete table .repairid').text(),
				material:$('#cmoplete table input[name="material"]').val(),
				upkeep:$('#cmoplete table input[name="upkeep"]').val(),
				repairdate:$('#cmoplete table input[name="repairdate"]').val(),
				completedate:$('#cmoplete table input[name="completedate"]').val(),
				status:$('#cmoplete table input[name="ispay"]:checked').val(),
				type:2
		};
		//console.log(data);
		if($('#cmoplete table input[name="paydate"]').val()!=''&&$('#cmoplete table input[name="paydate"]').val().length>0){
			data.paydate=$('#cmoplete table input[name="paydate"]').val();
		}
		loaddata(data,'/house/admin/repair/updateById.do','post',function(msg){
			if(msg){
				alert('保存成功');
				$('#cmoplete').modal('hide');
				window.location.reload();
			}else{
				alert('修改失败');
			}
		});
	}
	//显示催单模态框
	function press(msg){
		var $table = $('#press table');
		$table.empty();
		var $tr1 = $('<tr><td>编号</td><td class="repairid">'+msg.id+'</td><td>保修类别</td><td class="category">'+msg.category+'</td><td>保修时间</td><td>'+msg.reportdate+'</td></tr>');
		var $tr2 = $('<tr><td class="principal">维修负责人</td><td>'+msg.principal+'</td><td>保修房号</td><td class="account">'+msg.account+'</td><td>户主姓名</td><td class="owner">'+msg.owner+'</td></tr>');
		var $tr3 = $('<tr><td>户主电话</td><td>'+msg.ownerphone+'</td><td>报修方式</td></tr>');
		var $td;
		switch(msg.means){
		case 1:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		case 2:$td = $('<td colspan="3">电话保修</td>');
		break;
		case 3:$td = $('<td colspan="3">网上保修</td>');
		break;
		default:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		}
		$tr3.append($td);
		$tr4 = $('<tr><td>材料费</td><td class="material">'+msg.material+'元</td><td>维修费</td><td class="upkeep">'+msg.upkeep+'元</td><td>维修时间</td><td class="date">从'+msg.repairdate+'到'+msg.completedate+'</td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4);
		$('#press').modal('show');
	}
	//发送缴费通知
	function send(){
		var category = $('#press table').find('td.category').text();
		var owner = $('#press table').find('td.owner').text();
		var principal =  $('#press table').find('td.principal').text();
		var material = $('#press table').find('td.material').text();
		var upkeep = $('#press table').find('td.upkeep').text();
		var date = $('#press table').find('td.date').text();
		var account = $('#press table').find('td.account').text();
		var data = {
				houseid:account,
				title:category+'缴费通知单',
				content:owner+'您好,您'+date+'进行的物业修理的费用('+principal+'),材料费:'+material+'维修费:'+upkeep+'还没有缴费,请务必尽快进行缴费',
		};
		loaddata(data,'/house/admin/message/save.do','post',function(msg){
			if(msg){
				alert('通知成功');
				$('#cmoplete').modal('hide');
				window.location.reload();
			}else{
				alert('通知失败');
			}
		});
	}
	//查看模态框显示
	function look(msg){
		var $table = $('#look table');
		$table.empty();
		var $tr1 = $('<tr><td>编号</td><td class="repairid">'+msg.id+'</td><td>保修类别</td><td class="category">'+msg.category+'</td><td>保修时间</td><td>'+msg.reportdate+'</td></tr>');
		var $tr2 = $('<tr><td class="principal">维修负责人</td><td>'+msg.principal+'</td><td>保修房号</td><td class="account">'+msg.account+'</td><td>户主姓名</td><td class="owner">'+msg.owner+'</td></tr>');
		var $tr3 = $('<tr><td>户主电话</td><td>'+msg.ownerphone+'</td><td>报修方式</td></tr>');
		var $td;
		switch(msg.means){
		case 1:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		case 2:$td = $('<td colspan="3">电话保修</td>');
		break;
		case 3:$td = $('<td colspan="3">网上保修</td>');
		break;
		default:$td = $('<td colspan="3">客服中心保修</td>');
		break;
		}
		$tr3.append($td);
		$tr4 = $('<tr><td>材料费</td><td class="material">'+msg.material+'元</td><td>维修费</td><td class="upkeep">'+msg.upkeep+'元</td><td>维修时间</td><td class="date">从'+msg.repairdate+'到'+msg.completedate+'</td></tr>');
		$table.append($tr1,$tr2,$tr3,$tr4);
		$('#look').modal('show');
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
				url:'/house/admin/repair/delete.do',
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