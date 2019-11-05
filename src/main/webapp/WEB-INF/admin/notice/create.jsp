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
<div class="container" style="padding:0px;margin-top:30px">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
			<div class="col-md-3 column">
				</div>
				<div class="col-md-6 column">
						<div class="form-group" >
							 <input type="text" class="form-control" id="title" name="title" style="height:34px" placeholder="标题"/>
						</div>
						<div>
							<script id="editor" type="text/plain" style="width:700px;height:300px;"></script>
 							
   						</div>
						<button type="button" class="btn btn-block btn-primary btn-default" id="save">保存</button>
				</div>
				<div class="col-md-3 column">
				</div>
			</div> 
		</div>
	</div>
</div>

<script type="text/javascript" src="/house/js/jquery.min.js"></script>
<script type="text/javascript" src="/house/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/house/js/bean.js"></script>
<script type="text/javascript" src="/house/js/util.js"></script>
<script type="text/javascript" src="/house/laydate/laydate.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/house/utf8-jsp/ueditor.all.min.js"> </script>
<script type="text/javascript"> 
	$(function(){
		var ue = UE.getEditor('editor',{  
            //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个  
            toolbars:[['FullScreen', 'Undo', 'Redo','bold','test','emotion','spechars','cleardoc','simpleupload']],  
            //focus时自动清空初始化时的内容  
           // autoClearinitialContent:true,  
            //关闭字数统计  
            //wordCount:false,  
            //关闭elementPath  
            //elementPathEnabled:false,  
            //默认的编辑区域高度  
            //initialFrameHeight:300  
            //更多其他参数，请参考ueditor.config.js中的配置项  
        });   
	});
	function save(){
		var data = {
				title:$('#title').val(),
				content:UE.getEditor('editor').getContent()
		};
		console.log(data);
		loaddata(data,'/house/admin/announce/save.do','post',function(msg){
			alert(msg.msg);
			if(msg.flag){
				if(confirm("是否继续添加?")){
					window.location.reload();
				}else{
					//alert('跳转到列表页面');
					window.location.href='/house/admin/page/notice/list.do';
				}
			}
		});
	}
	$(function(){
		$('#save').click(save);
	});
      </script> 
</body>
</html>