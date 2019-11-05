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
						<input type="text" class="form-control laydate-icon" id="time" name="time" readonly="readonly" onclick="laydate()" placeholder="哪个月(完成时间的月份)" style="height:34px"/>
					</div>
					<div class="form-group" style="display:inline;float:left;">
						<input type="text" class="form-control" id="principal" name="principal" placeholder="请输入需要统计哪个负责人"/>
					</div>
					<button type="button" class="btn btn-block btn-primary btn-default" id="find" onclick="prepare()">查询</button>
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
							报修类型
						</th>
						<th>
							保修房号
						</th>
						<th>
							报修时间
						</th>
						<th>
							维修时间
						</th>
						<th>
							材料费
						</th>
						<th>
							维修费
						</th>
						<th>
							维修负责人
						</th>
					</tr>
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
	function prepare(){
		var data = {
				principal:$('#principal').val(),
				time:$('#time').val()
		};
		loaddata(data,'/house/admin/repair/count.do','post',callback);
	}
	function callback(msg){
		if(msg.message){
			alert(msg.message);
			return;
		}
		var $tbody = $('table#list>tbody');
		$tbody.empty();
		//console.log(msg.list);
		$.each(msg.list,function(index,value){
			var $tr=$('<tr><td>'+value.id+'</td><td>'+value.category+'</td><td>'+value.houseid+'</td><td>'+value.reportdate+'</td><td>'+value.repairdate+'</td><td>'+value.material+'</td><td>'+value.upkeep+'</td><td>'+value.principal+'</td></tr>');
			$tbody.append($tr);
		});
		$tfoot = $('table#list>tfoot');
		$tfoot.empty();
		$tfoot.append('<tr><td colspan="8">材料费总计:'+msg.material+',劳务费:'+msg.upkeep+'</td></tr>')
	}

	
</script>
</body>
</html>