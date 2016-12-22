package soy.maven.disk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import soy.maven.disk.dao.IFileDao;
import soy.maven.disk.pojo.File;
import soy.maven.disk.service.IFileService;
import java.util.List;

@Service("fileSerivce")
public class FileServiceImpl implements IFileService{
	
	@Resource
	private IFileDao iFileDao;

	@Override
	public int insert(File file) {
		// TODO Auto-generated method stub
		return this.iFileDao.insert(file);
	}

	@Override
	public List<File> getInfoById(int id){
		return this.iFileDao.selectByPrimaryKey(id);
		
	}

	@Override
	public String getfileurl(Integer userid,String filename) {
		// TODO Auto-generated method stub
		return this.iFileDao.selectfileurl(userid,filename);
	}

	@Override
	public int deletebyfilename(Integer userid,String filename) {
		// TODO Auto-generated method stub
		return this.iFileDao.deletebyfilename(userid,filename);
	}
	
	
	
	

}
