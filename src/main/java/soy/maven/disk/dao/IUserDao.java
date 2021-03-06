package soy.maven.disk.dao;

import soy.maven.disk.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int selectByUserName(String Username);
    
    String selectPasswordByName(String userName);
    
    int selectIdByUserName(String username);
}