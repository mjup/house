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
							<input type="text" class="form-control" id="account" name="account" placeholder="房屋号"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
							 <input type="text" class="form-control" id="owner" name="owner" placeholder="户主姓名"/>							
					</div>
					<div class="form-group" style="display:inline;float:left;">
							 <input type="text" class="form-control" id="floorid" name="floorid" placeholder="楼层"/>							
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="find">查询</button>
				</div>
			</div>
		</div>
	<div class="row clearfix" style="margin-top:50px">
		<div class="col-md-12 column">
				<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							选择
						</th>
						<th>
							房屋编号
						</th>
						<th>
							楼层
						</th>
						<th>
							单元楼
						</th>
						<th>
							户主姓名
						</th>
						<th>
							联系电话
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
						<td colspan="6">
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
                <h4 class="modal-title" id="myModalLabel">房屋修改</h4>
            </div>
            <div class="modal-body">
            	<p><span>房屋号:</span><span id="account_u"></span>&nbsp;&nbsp;<span>面积:</span><input type="text" name="area_u">m²</p>
            	<p><span>楼号:</span><span id="floorid_u"></span>&nbsp;&nbsp;<span>户主:</span><input type="text" name="owner_u"></p>
            	<p><span>单元号:</span><span id="cellid_u"></span>&nbsp;&nbsp;<span>家庭人口:</span><input type="text" name="population_u"></p>
            	<p><span>建筑年代:</span><input type="text" class="laydate-icon" onclick="laydate()" name="bdate_u">&nbsp;&nbsp;<span>户主电话:</span><input type="text" name="phone_u"></p>
            	<p><span>迁入时期:</span><input type="text" class="laydate-icon" onclick="laydate()" name="mdate_u">&nbsp;&nbsp;<span>户型:</span><input type="text" name="shape_u"></p>
            	<p><span>描述:</span><textarea id="desc_u"></textarea>></p>
            	<input type="hidden" name="id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveupdate">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- 结束 -->
<!-- 全屏 -->
 <input type="button" value="全屏" id="bt" name="bt" onclick="goResize();" />  
    <script type="text/javascript">  
    function goResize() {  
        var txt = document.getElementById("bt").value;  
        fs = top.document.getElementById("shangxia");  
        zuoyou = top.document.getElementById("zuoyou");
        if (txt == "全屏") {  
            fs.rows = "0,*"; 
            zuoyou.cols = "0,*"; 
            document.getElementById("bt").value="取消";  
        } else {  
            fs.rows = "20%,*";
            zuoyou.cols = "20%,*";
            document.getElementById("bt").value="全屏";  
        }  
    }  
</script>  
<!-- 结束 -->
<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript">
var beans = new Array();
	$(function(){
		function loadData(nowPage,pageNumber){
			var data = {
					nowPage:nowPage,
					pageNumber:pageNumber,
			};
			if($('input[name="account"]').val()!=""){
				data.account = $('input[name="account"]').val();
			}
			if($('input[name="owner"]').val()!=""){
				data.owner = $('input[name="owner"]').val();
			}
			if($('input[name="floorid"]').val()!=""){
				data.floorid = $('input[name="floorid"]').val();
			}
			//console.log(data);
			$.ajax({
				url:'/house/admin/houses/get/list.do',
				dataType:'json',
				data:data,
				method:'get',
				success:function(msg){
					//console.log(msg);
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
					var $tbody = $('tbody');
					$tbody.empty();
					//console.log(msg.list);
					
					$.each(msg.list,function(index,value){
						var $tr = $('<tr><td><input type="checkbox" value="'+value.id+'"></td><td>'+value.account+'</td><td>'+value.floorid+'</td><td>'+value.cellid+'</td><td>'+value.owner+'</td><td>'+value.ownerphone+'</td><td><a href="#" class="update" onclick="modal('+value.id+')">更改</a></td></tr>');
						var house = new House(value.id,value.account,value.descr,value.floorid,value.cellid,value.bdate,value.shape,value.area,value.owner,value.population,value.ownerphone,value.mdate);
						beans.push(house);
						$tbody.append($tr);
					});
				}
			});			
		}
		function loada(d){
			loadData(d.data.nowPage,d.data.pageNumber);
		}
		
		$('button#delete').click(function(){
			var ids = [];
			//var ids = new Array();
			$('tbody :checkbox:checked').each(function(index,value){
				//ids[index]=$(value).val();
				ids[index] = $(value).val();
			});
			//list.ids=ids;
			$.ajax({
				url:'/house/admin/houses/delete.do',
				data:{ids:ids},
				method:'post',
				dataType:'json',
				traditional: true,  
				success:function(msg){
					if(msg){
						alert("删除成功");
						//window.location.reload();
						loadData(1,5);
					}
				}
			});
		});
		$('input[id="selectall"]').click(function(){
			if(this.checked){
				$('tbody :checkbox').prop("checked",true);
			}else{
				$('tbody :checkbox').prop("checked",false);
			}
		});
		
		$('#myModal button#saveupdate').click(function(){
			var data = {
					id:$('#myModal input[name="id"]').val(),
					descr:$('#myModal #desc_u').val(),
					bdate:$('#myModal input[name="bdate_u"]').val(),
					shape:$('#myModal input[name="shape_u"]').val(),
					area:$('#myModal input[name="area_u"]').val(),
					owner:$('#myModal input[name="owner_u"]').val(),
					population:$('#myModal input[name="population_u"]').val(),
					ownerphone:$('#myModal input[name="phone_u"]').val(),
					mdate:$('#myModal input[name="mdate_u"]').val()
			};
			$.ajax({
				url:'/house/admin/houses/update.do',
				data:data,
				method:'post',
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("修改成功");
						loadData(1,5);
						$('#myModal').modal('hide');
					}
				}
			});
		});
		$('button#find').bind('click',{nowPage:1,pageNumber:5},loada);
		loadData(1,5);
		//console.log($('#aaaa'));
		
		//console.log($('table tfoot').find('input[id="aaaa"]'));
	});
	function modal(id){
		console.log(id);
		var key;
		console.log(beans);
		for(i in beans){
			if(beans[i].id==id){
				key = beans[i];
				break;
			}
		}
		//console.log(key);
		$('#myModal #account_u').text(key.account);
		$('#myModal #floorid_u').text(key.floorid);
		$('#myModal #cellid_u').text(key.cellid);
		$('#myModal input[name="area_u"]').val(key.area);
		$('#myModal input[name="owner_u"]').val(key.owner);
		$('#myModal input[name="population_u"]').val(key.population);
		$('#myModal input[name="phone_u"]').val(key.ownerphone);
		$('#myModal input[name="mdate_u"]').val(key.mdate);
		$('#myModal input[name="shape_u"]').val(key.shape);
		$('#myModal input[name="bdate_u"]').val(key.bdate);
		$('#myModal input[name="id"]').val(key.id);
		$('#myModal #desc_u').val(key.desc);
		$('#myModal p').children(":even").css("color","red");
		$('#myModal').modal('show');
		//var topmodal = top.document.getElementById("topModal");
		//$(topmodal).modal('toggle');
		return false;
	}
</script>
</body>
</html>