<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML >
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="jslib/easyui-1.5.3/jquery.min.js"></script>
  	<script type="text/javascript" src="jslib/easyui-1.5.3/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="jslib/easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
  	<link rel="stylesheet" href="jslib/easyui-1.5.3/themes/default/easyui.css" type="text/css"></link>
  	<link rel="stylesheet" href="jslib/easyui-1.5.3/themes/icon.css" type="text/css"></link>
  	<link rel="stylesheet" href="jslib/easyui-1.5.3/themes/color.css" type="text/css"></link>
  	<script type="text/javascript" src="jslib/syUtil.js"></script>
  	
  	<script type="text/javascript">
  	//初始化
  		$(function(){
  			
  			/*$('#index_regDialog').dialog({
  				title:'注册',
  				modal:true,
  				buttons:[{
  					text:'注册',
  					iconCls:'icon-edit',
  					handler:function(){
  						
  					}
  					
  				}]
  				
  				
  			}).dialog('close');
  			*/
  			/*
  			$('#index_regFrom').form({
  				url:'${pageContext.request.contextPath}/userAction!reg.action',
  				onSubmit:function(){
  					
  				},
  				success:function(data){
  					//alert(data)
  					console.info(data);
  				}
  				
  			});
  			*/
  		});
  	
  		function regUser(){
  			
  			/*
  			$('#index_regForm').form('submit',{
  				url:'${pageContext.request.contextPath}/userAction!reg.action',
  				success:function(data){
  					console.info(data);
  					//var obj = eval("("+data+")");
  					var obj = jQuery.parseJSON(data);
  					if(obj.success){
  						$('#index_regDialog').dialog("close");
  						
  					}
  					$.messager.show({
  						title:'提示',
  						msg:obj.msg
  						
  					});
  					
  				}
  				
  			});
  			*/
  			/*
  			if($('#index_regFrom').form('validate')){
  			$.ajax({
  		  		url:'${pageContext.request.contextPath}/userAction!reg.action',
  		  		
  		  		data : $('#index_regForm').serialize(),
  		  		dataType:'json',
  		  		success:function(data){
  		  			console.info(data);
  		  			if(data.success){
  		  				$('#index_regDialog').dialog('close');
  		  				
  		  			}
  		  			$.messager.show({
  		  				title:'提示',
  		  				msg:data.msg
  		  			});
  		  		}
  		  		
  		  	});
  			}else{
  				$.messager.show({
  					title:'提示',
  					msg:'密码不一致！ '
  				})
  			}
  			*/
  		}
  
  	
  	</script>
  </head>
  
  <body class = "easyui-layout">
   		<div data-options="region:'north'" style="height:60px;"></div>
   		<div data-options="region:'south'" style="height:20px;"></div>
   		<div data-options="region:'west',split:true" style="width:200px;">
   			<div class = "easyui-panel" data-options = "title:'菜单',border:false,fit:true"></div>
   		</div>
   		<div data-options="region:'east',title:'east',split:true" style="width:200px;"></div>
   		<div data-options="region:'center',title:'center'"></div>
   		<jsp:include page="user/login.jsp"></jsp:include>
   		<jsp:include page="user/reg.jsp"></jsp:include>
  <!-- 		
   		<div style = "width:250px;" class = "easyui-dialog" data-options="title:'登录',modal:true,closable:false,
   				buttons:[{
   					text:'注册',
   					iconCls:'icon-edit',
   					handler:function(){
   						$('#index_regForm').form('load',{name:'',pwd:'',rePwd:''});
   						$('#index_regForm input').val('');
	   					$('#index_regDialog').dialog('open');
	   					
   					}	
   				},{
   					text:'登录',
   					iconCls:'icon-help',
   					handler:function(){}
   				}]">
   			
		<table>
			<tr>
				<th>登录名：</th>
				<td><input name = "name" class = "sasyui-validatebox" data-option="required:true,missingMessage:'登录名称必填'"/></td>
			</tr>
			<tr>
				<th>密码：</th>
				<td><input name= "pwd" type="password" class = "easyui-valdatebox" data-options="required:true"/></td>
			</tr>
			
			
		</table>
		</div>
		<jsp:include page="user/login.jsp"></jsp:include>
		<div id = "index_regDialog" style = "width:250px;" class = "easyui-dialog" data-options="title:'注册',closed:true,modal:true,
   				buttons:[{
   					text:'注册',
   					iconCls:'icon-edit',
   					handler:function(){
   						
	   					$('#index_regForm').form('submit',{
  							url:'${pageContext.request.contextPath}/userAction!reg.action',
  							onSubmit:function(){
  					
  							},
  							success:function(data){
  								var obj = JQuery.parseJSON(data);
  								if(obj.success){
  									$('#index_regDialog').dialog('close');
  								}
	  							$.messager.show({
	  								title:'提示',
	  								msg:obj.msg
	  							});
  							}
	   					
   						});
   					}	
   				}]"> --> 
   					<!--  $('#index_regFrom').submit();-->
		 	<!-- <form id = "index_regForm"   method="post">		
	   			<table>
	   			<tr>
					<th>登录名</th>
					<td><input name = "name" class = "easyui-validatebox" data-options="required:true,missingMessage:'登录名称必填'"/></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input name= "pwd" type="password" class = "easyui-validatebox" data-options="required:true"/></td>
				</tr>
				<tr>
					<th>重复密码</th>
					<td><input name= "rePwd" type="password" class = "easyui-validatebox" data-options="required:true,validType:'eqPwd[\'#index_regFrom input[name=pwd]\']'"/></td>
				</tr>
				</table>
	   		</form>
   		</div>
   		 --> 
  </body>
</html>
