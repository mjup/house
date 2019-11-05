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
							时间
						</th>
						<th>
							水费(吨)
						</th>
						<th>
							电费(度)
						</th>
						<th>
							物业费
						</th>
						<th>
							燃气费(立方米)
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
<!-- 修改价格modal -->
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-primary" class="saveupdate" onclick="saveupdate()">提交更改</button>
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
var array = [];
	function prepare(start,length){
		var data = {
				nowPage:start,
				pageNumber:length,
		};
		//console.log('传递的数据是:'+data);
		loaddata(data,'/house/admin/price/list.do','post',callback);
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
			var price = new Price(value.id,value.month,value.waterprice,value.electricPrice,value.gasPrice,value.wuyePrice);
			array.push(price);
			var $tr=$('<tr><td><input type="checkbox" value="'+value.id+'"></td><td>'+value.id+'</td><td>'+value.month+'</td><td class="waterprice">'+value.waterprice+'</td><td class="electricPrice">'+value.electricPrice+'</td><td class="wuyePrice">'+value.wuyePrice+'</td><td class="gasPrice">'+value.gasPrice+'</td><td><a href="#" onclick = "showModal('+value.id+')">更改</a></td></tr>');
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
	function showModal(id){
		var i;
		for(var index in array){
			if(id==array[index].id){
				i = index;
			}
		}
		var $table = $('#update table');
		//console.log($tbody);
		$table.empty();
		var $tr1 = $('<tr><td>编号</td><td class="id">'+array[i].id+'</td><td>时间</td><td>'+array[i].month+'</td></tr>');
		var $tr2 = $('<tr><td>水费</td><td><input type="text" name = "waterprice" value="'+array[i].waterprice+'"></td><td>电费</td><td><input type="text" name="electricPrice" value="'+array[i].electricPrice+'"></td></tr>');
		var $tr3 = $('<tr><td>燃气费</td><td><input type="text" name = "gasPrice" value="'+array[i].gasPrice+'"></td><td>物业费</td><td><input type="text" name="wuyePrice" value="'+array[i].wuyePrice+'"></td></tr>');
		$table.append($tr1,$tr2,$tr3);
		$('#update').modal('show');
	}
	function saveupdate(){
		var data={
			id:$('#update table').find('td.id').text(),
			waterprice:$('#update table').find('input[name="waterprice"]').val(),
			electricPrice:$('#update table').find('input[name="electricPrice"]').val(),
			gasPrice:$('#update table').find('input[name="gasPrice"]').val(),
			wuyePrice:$('#update table').find('input[name="wuyePrice"]').val()
		};
		loaddata(data,'/house/admin/price/update.do','post',function(msg){
			alert(msg.msg);
			//prepare(1,5);
			var i;
			for(var index in array){
				if(data.id==array[index].id){
					i = index;
					array[index].waterprice=data.waterprice;
					array[index].electricPrice=data.electricPrice;
					array[index].gasPrice=data.gasPrice;
					array[index].wuyePrice=data.wuyePrice;
				}
			}
			//console.log($('table#list>tbody>tr:eq('+i+')'));
			$('table#list>tbody>tr:eq('+i+')>.waterprice').text(data.waterprice);
			$('table#list>tbody>tr:eq('+i+')>.electricPrice').text(data.electricPrice);
			$('table#list>tbody>tr:eq('+i+')>.gasPrice').text(data.gasPrice);
			$('table#list>tbody>tr:eq('+i+')>.wuyePrice').text(data.wuyePrice);
			$('#update').modal('hide');
		});
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
				url:'/house/admin/price/delete.do',
				data:{ids:ids},
				method:'post',
				dataType:'json',
				traditional: true,  
				success:function(msg){
					alert(msg.msg);
					if(msg.flag){
						//alert("删除成功");
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