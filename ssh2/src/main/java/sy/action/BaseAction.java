package sy.action;

import java.io.IOException;

import javax.xml.rpc.encoding.SerializerFactory;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;

@ParentPackage("basePackage")
@Namespace("/")
public class BaseAction {
	private static final Logger logger = Logger.getLogger(BaseAction.class);
	/**
	 * 将对象转换成JSON字符串，并相应前台	
	 * @param object
	 * @throws IOException
	 */
	public void writeJson(Object object){
		
		
		try {
//			SerializeConfig serializeConfig = new SerializeConfig();
//			serializeConfig.setAsmEnable(false);
//			String json = JSON.toJSONString(object);
//			String json = JSON.toJSONString(object,serializeConfig,SerializerFactory.PrettyFromat);
			
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss" );
//			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss" ,SerializerFactory.PrettyFromat);
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
			ServletActionContext.getResponse().getWriter().write(json);
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
}
