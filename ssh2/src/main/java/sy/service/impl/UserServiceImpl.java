package sy.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.UserDaoI;
import sy.model.Tuser;
import sy.pageModel.User;
import sy.service.UserServiceI;
import sy.util.Encrypt;

//@Service("userService")只有value
@Service(value = "userService")
public class UserServiceImpl implements UserServiceI {
	private static final Logger logger =Logger.getLogger(UserServiceImpl.class); 
	
	private UserDaoI userDao;
	
	public UserDaoI getUserDao() {
		return userDao;
	}
	@Autowired
	public void setUserDao(UserDaoI userDao) {
		this.userDao = userDao;
	}
/*
	@Override
	public void test() {
		logger.info("测试测试");
	
	}

	@Override
	public Serializable save(Tuser t) {
		return userDao.save(t);
	}
*/
	@Override
	public void save(User user) {
		Tuser t = new Tuser();
		BeanUtils.copyProperties(user, t,new String[]{"pwd"});//,new String[]{ "id","name"}第三个参数排除数组内的
		t.setId(UUID.randomUUID().toString());
//		t.setName(user.getName());
		t.setPwd(Encrypt.e(user.getName()));
		t.setCreatedatetime(new Date());
		userDao.save(t);
		
	}
	@Override
	public User login(User user) {
		//Tuser t = userDao.get("from Tuser t where t.name='"+user.getName()+"' and t.pwd='"+Encrypt.e(user.getPwd())+"'");
		//Tuser t = userDao.get("from Tuser t where t.name=? and t.pwd=?",new Object[]{user.getName(),Encrypt.e(user.getPwd())});
		Map<String,Object>	params = new HashMap<String, Object>();
		params.put("name", user.getName());
		params.put("pwd", Encrypt.e(user.getPwd()));
		Tuser t = userDao.get("from Tuser t where t.name=:name and t.pwd = :pwd", params);
		if(t!=null){
			return user;
		}
		return null;
	}
}
