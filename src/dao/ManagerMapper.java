package dao;

import entity.Manager;

public interface ManagerMapper {
	//管理员登录查询
	public Manager selectByUsername(String username);
	//管理员登录查询密码比对
	public Manager selectByUsernameAndPassword(String username, String password);

}
