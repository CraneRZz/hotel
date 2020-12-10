package service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.MemberMapper;
import entity.Member;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;
import service.MemberService;
import util.MD5Util;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	//用户注册
	@Override
	public void regist(Member member) throws DuplicateUsernameException {
		Member m=memberMapper.selectByUsername(member.getUsername());
		if(m!=null){
			throw new DuplicateUsernameException("用户名已存在");
		}
		//为空
		member.setPwd(MD5Util.md5(member.getPwd()));
		memberMapper.insert(member);	
	}
	//用户登录查询密码比对
	@Transactional(readOnly=true)
	@Override
	public Member login(String username, String password)
			throws UserNotFoundException {
		Member member=memberMapper.selectByUsernameAndPassword(username, MD5Util.md5(password));
		if(member==null){
			throw new UserNotFoundException("用户不存在");
		}
		return member;
	}
	
	//用户查询
	@Transactional(readOnly=true)
	@Override
	public Member indexLogin(String username, String password)
			throws UserNotFoundException {
		Member member=memberMapper.selectByUsernameAndPassword(username, MD5Util.md5(password));
		if(member==null){
			throw new UserNotFoundException("用户不存在");
		}
		return member;
	}
	
	//用户信息更新
	@Override
	public void edit(Member member) {
		if(member.getPwd()!=null){
			member.setPwd(MD5Util.md5(member.getPwd()));
		}
		memberMapper.update(member);
	}
	
	//查询用户的订单
	@Transactional(readOnly=true)
	@Override
	public List<Member> findAllInfo(String cid, String status,Date sdate, Date edate, String sno, String username) {
		// TODO Auto-generated method stub
		 List<Member> allinfos = memberMapper.selectALL(cid,status,sdate, edate, sno, username);
		return allinfos;
	}

}
