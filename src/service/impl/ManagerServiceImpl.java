package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ManagerMapper;
import entity.Manager;
import exception.UserNotFoundException;
import service.ManagerService;
import util.MD5Util;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	//管理员登录查询
	@Transactional(readOnly=true)
	@Override
	public Manager login(String username, String password)
			throws UserNotFoundException {
		Manager manager=managerMapper.selectByUsernameAndPassword(username, MD5Util.md5(password));
		if(manager==null){
			throw new UserNotFoundException("用户不存在");
		}
		return manager;
	}
	//管理员登录查询密码比对
	@Transactional(readOnly=true)
	@Override
	public Manager indexLogin(String username, String password)
			throws UserNotFoundException {
		Manager manager=managerMapper.selectByUsernameAndPassword(username, MD5Util.md5(password));
		if(manager==null){
			throw new UserNotFoundException("用户不存在");
		}
		return manager;
	}

}
