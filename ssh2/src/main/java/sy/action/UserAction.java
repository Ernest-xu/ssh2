package sy.action;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import sy.pageModel.Json;
import sy.pageModel.User;
import sy.service.UserServiceI;

import com.opensymphony.xwork2.ModelDriven;

//@ParentPackage("basePackage")
//@Namespace("/")
@Action(value = "userAction")
public  class UserAction extends BaseAction implements ModelDriven<User>{
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserAction.class);
	
	User user = new User();
	
	@Override
	public User getModel() {
		
		return user;
	}
	
	private UserServiceI userService;
	

	public UserServiceI getUserService() {
		return userService;
	}


	@Autowired//自动注入
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}


/*
	public void test() {
		logger.info("进入action");
		
//		调用service		
//		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
//		UserServiceI userService = (UserServiceI) ac.getBean("userService");
//		userService.test();
		
		userService.test();
		
	};

	public void addUser(){
		Tuser t = new Tuser();
		t.setId(UUID.randomUUID().toString());
		t.setName("XXX");
		t.setPwd("123456");
		t.setCreatedatetime(new Date());
		userService.save(t);
		
	}
	*/
	
	public void reg(){
		//logger.info("进入");
//		String name = ServletActionContext.getRequest().getParameter("name");
//		String pwd = ServletActionContext.getRequest().getParameter("pwd");
//		Map<String, Object> m = new HashMap<String,Object>();
		Json j = new Json();
		try {
			userService.save(user);//user.getName(),user.getPwd());
			j.setSuccess(true);
			j.setMsg("注册成功!");
//			m.put("success", true);
//			m.put("msg", "注册成功!");
			//json="{\"success\":true,\"msg\":'注册成功！'}";
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg(e.getMessage());
			//e.getMessage();e的信息
			//json="{\"success\":true,\"msg\":'注册失败！'}";
			
//			m.put("success", false);
//			m.put("msg",e.getMessage());
		}
		
//		try {
//			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
//			ServletActionContext.getResponse().getWriter().write(JSON.toJSONString(m));
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//		}
		super.writeJson(j);
	}

	public void login(){
		User u = userService.login(user);
		Json j = new Json();
		if(u!=null){
			j.setSuccess(true);
			j.setMsg("登录成功!");
		}else{
			j.setMsg("登录失败,用户名密码错误!");
			
		}
		super.writeJson(j);
	}

	
}
