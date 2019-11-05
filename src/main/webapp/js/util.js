/**
 * 
 */
function loaddata(data,url,method,callback){
	$.ajax({
		url:url,
		data:data,
		method:method,
		dataType:'json',
		success:function(msg){
			//alert(msg.nowPage);
			callback(msg);
		}
	});
}
function ajaxArray(data,url,method,callback){
	$.ajax({
		url:url,
		data:data,
		method:method,
		dataType:'json',
		traditional: true,  
		success:function(msg){
			callback(msg);
		}
	});
}
function selectAll(source,targetSelector){
	if(source.checked){
		$(targetSelector).prop("checked",true);
	}else{
		$(targetSelector).prop("checked",false);
	}
}
function logout(){
	$.ajax({
		url:'/house/admin/user/logout.do',
		data:null,
		method:'get',
		dataType:'json',
		success:function(msg){
			alert(msg.msg);
			window.location.href="/house/index.jsp";
			//callback(msg);
		}
	});
}