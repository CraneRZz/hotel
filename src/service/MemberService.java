package service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Member;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;

public interface MemberService {
	//用户注册
	public void regist(Member member)throws DuplicateUsernameException;
	//用户登录查询密码比对
	public Member login(String username,String password)throws UserNotFoundException;
	//用户查询
	public Member indexLogin(String username,String password)throws UserNotFoundException;
	//用户信息更新
	public void edit(Member member);
	//查询用户的订单
	public List<Member> findAllInfo(@Param("cid") String cid, @Param("status") String status, @Param("sdate") Date sdate, @Param("edate") Date edate, @Param("sno") String sno, @Param("username") String username);
	//public List<Member> findAllInfo(String cid, String status, Date sdate, Date edate, String sno, String username);
}
