package soy.maven.disk;

import java.awt.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;

import soy.maven.disk.pojo.User;
import soy.maven.disk.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMyBatis {
	
	
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
	
	
	@Resource
	private IUserService userService = null;
	
	@Test
	public void test1() {  
        User user = userService.getUserById(1);
     //   System.out.println(user.getUserName());  
     //   logger.info("值："+user.getUserName());
        logger.info(JSON.toJSONString(user));
	}
	   
}
