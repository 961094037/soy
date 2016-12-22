package soy.maven.disk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import soy.maven.disk.dao.IUserDao;
import soy.maven.disk.pojo.User;
import soy.maven.disk.service.IUserService;






@Service("userService")
public class UserServiceImpl implements IUserService{
	
	@Resource  
    private IUserDao userDao;

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}  
	
	@Override
	public int insert(User user){
		return this.userDao.insert(user);
	}
   
	@Override
	public int getUserNumByName(String userName) {
		// TODO Auto-generated method stub
		return this.userDao.selectByUserName(userName);
	}

	@Override
	public String selectPasswordByName(String userName) {
		// TODO Auto-generated method stub
		return this.userDao.selectPasswordByName(userName);
	}

	@Override
	public int selectIdByUserName(String username) {
		// TODO Auto-generated method stub
		return this.userDao.selectIdByUserName(username);
	}
   

}