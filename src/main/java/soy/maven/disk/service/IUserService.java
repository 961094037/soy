package soy.maven.disk.service;

import soy.maven.disk.pojo.User;

public interface IUserService {
	public User getUserById(int userId);  
	
	public int insert(User user);
}
