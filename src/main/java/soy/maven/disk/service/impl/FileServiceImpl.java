package soy.maven.disk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import soy.maven.disk.dao.IFileDao;
import soy.maven.disk.pojo.File;
import soy.maven.disk.service.IFileService;

@Service("fileSerivce")
public class FileServiceImpl implements IFileService{
	
	@Resource
	private IFileDao iFileDao;

	@Override
	public int insert(File file) {
		// TODO Auto-generated method stub
		return this.iFileDao.insert(file);
	}

	
	
	

}
