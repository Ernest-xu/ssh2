/**
 * 
 * @author Ernest
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展validatebox,添加验证两次密码功能
 * 
 */
	
$.extend($.fn.validatebox.defaults.rules,{
	eqPwd:{
		validator : function(value,params){
			return value==$(params[0]).val();
		},
		message : '密码不一致！'
	}
	
});