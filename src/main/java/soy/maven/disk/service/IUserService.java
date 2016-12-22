package soy.maven.disk.service;

import soy.maven.disk.pojo.User;

public interface IUserService {
	public User getUserById(int userId);  
	
	public int insert(User user);
	
    public int getUserNumByName(String userName);//通过用户名查找到的用户数
	
	public String selectPasswordByName(String userName);
	
	public int selectIdByUserName(String username);
}
