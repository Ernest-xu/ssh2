<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	$('#user_login_loginFrom').form({
			url:'${pageContext.request.contextPath}/userAction!login.action',
			success:function(data){
				var obj = $.parseJSON(data);
				if(obj.success){
					$('#user_login_loginDialog').dialog('close');
				}
				$.messager.show({
					title:'提示',
					msg:obj.msg
				});
			}
		
		});
		$('#user_login_loginFrom input').bind('keyup',function(event){
			
			if(event.keyCode == '13'){
				$('#user_login_loginFrom').submit();
			}
		});
		window.setTimeout(function(){
			$('#user_login_loginFrom input[name=name]').focus();
		},0);
		
});
</script>
<div id ="user_login_loginDialog" style = "width:250px;" class = "easyui-dialog" data-options="title:'登录',modal:true,closable:false,
   				buttons:[{
   					text:'注册',
   					iconCls:'icon-edit',
   					handler:function(){
   						
	   					$('#user_reg_regDialog').dialog('open');
	   					
   					}	
   				},{
   					text:'登录',
   					iconCls:'icon-help',
   					handler:function(){
   						$('#user_login_loginFrom').submit();
   					}
   				}]">
   	<form id="user_login_loginFrom" method="post">		
		<table>
			<tr>
				<th>登录名：</th>
				<td><input name = "name" class = "easyui-validatebox" data-options="required:true,missingMessage:'登录名称必填'"/></td>
			</tr>
			<tr>
				<th>密码：</th>
				<td><input name= "pwd" type="password" class = "easyui-validatebox" data-options="required:true,missingMessage:'密码必填'"/></td>
			</tr>
			
			
		</table>
	</form>
</div>