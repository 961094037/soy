package soy.maven.disk.dao;

import java.util.List;

import soy.maven.disk.pojo.File;

public interface IFileDao {
    int insert(File record);

    int insertSelective(File record);
    
    List<File> selectByPrimaryKey(Integer id);
    
    String selectfileurl(Integer userid,String filename);
    
    int deletebyfilename(Integer userid,String filename);
}