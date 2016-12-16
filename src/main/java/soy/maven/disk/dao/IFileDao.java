package soy.maven.disk.dao;

import soy.maven.disk.pojo.File;

public interface IFileDao {
    int insert(File record);

    int insertSelective(File record);
}