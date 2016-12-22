package soy.maven.disk.service;

import java.util.List;

import soy.maven.disk.pojo.File;

public interface IFileService {

	public int insert(File file);

	public List<File> getInfoById(int id);
	
	public String getfileurl(Integer userid,String filename);
	
	public int deletebyfilename(Integer userid,String filename);
	
	
}
