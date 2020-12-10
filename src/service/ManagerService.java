package service;

import entity.Manager;
import exception.UserNotFoundException;

public interface ManagerService {
	//管理员登录查询
	public Manager login(String username,String password)throws UserNotFoundException;
	//管理员登录查询密码比对
	public Manager indexLogin(String username,String password)throws UserNotFoundException;

}
