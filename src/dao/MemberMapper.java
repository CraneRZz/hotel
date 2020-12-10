package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Member;

public interface MemberMapper {
	//用户查询
	public Member selectByUsername(String username);
	//用户注册
	public void insert(Member member);
	//用户登录查询密码比对
	public Member selectByUsernameAndPassword(String username, String password);
	//用户信息更新
	public void update(Member member);
	//查询用户的订单
	public List<Member> selectALL(@Param("cid") String cid, @Param("status") String status, @Param("sdate") Date sdate, @Param("edate") Date edate, @Param("sno") String sno, @Param("username") String username);
}
