package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Member;
import entity.Room;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;
import service.MemberService;
import service.RoomService;
import util.MD5Util;
import vo.AjaxResult;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private RoomService roomService;
	
	@ExceptionHandler(DuplicateUsernameException.class)
	public ModelAndView registExceptionHandler(Exception e){
		return new ModelAndView("register-1","e",e);
	}
	
	@ExceptionHandler(value={UserNotFoundException.class})
	public ModelAndView loginExceptionHandler(Exception e){
		return new ModelAndView("login","e",e);
	}

	//注册操作
	@RequestMapping("/regist")
	//将数据以对象方式传递
	public String regist(HttpServletRequest request,Member member)throws Exception{
		memberService.regist(member);
		return "redirect:/registSuccess";
	}
	//登录操作
	@RequestMapping("/login")
	public String login(String username,String pwd,HttpSession session)throws Exception{
		List<Room> rooms=roomService.findAllRoom();
		//将数据封装在变量中
		session.setAttribute("rooms", rooms);
		Member member=memberService.login(username, pwd);
		session.setAttribute("member", member);
		
		return "redirect:/";
	}
	//用户登出操作
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/indexLogin")
	@ResponseBody
	public AjaxResult indexLogin(String username,String pwd,HttpSession session){
		AjaxResult ajaxResult=new AjaxResult();
		try {
			Member member=memberService.indexLogin(username,pwd);
			session.setAttribute("member", member);
			ajaxResult.setName("success");
		} catch (UserNotFoundException e) {
			ajaxResult.setName("userNotFound");
			ajaxResult.setData(e.getMessage());
		}
		return ajaxResult;
	}
	
	@RequestMapping("/edit")
	public String editMember(HttpServletRequest request,Member member,HttpSession session)throws Exception{
		memberService.edit(member);
		session.invalidate();
		return "redirect:/showLogin";
	}
	//用户检查数据操作
	@RequestMapping("/checkPwd")
	@ResponseBody
	public AjaxResult checkPwd(String pwd,HttpSession session){
		AjaxResult ajaxResult=new AjaxResult();
		Member member=(Member) session.getAttribute("member");
		if(MD5Util.md5(pwd).equals(member.getPwd())){
			ajaxResult.setName("success");
		}else{
			ajaxResult.setName("fail");
			ajaxResult.setData("原密码不正确");
		}
		return ajaxResult;
	}
	//管理员展示所有订单操作
	@RequestMapping("/showAll")
	
	public String showAll(String cid,String status,Date sdate,Date edate,String sno,String username,HttpServletRequest request,HttpSession session)throws Exception{
		//在控制器里调用service查找方法，并将数据返回到jsp中
		List<Member> allInfos = memberService.findAllInfo(cid,status,sdate,edate,sno,username);
		System.out.println(allInfos);
		//将数据封装在变量中
		request.setAttribute("allInfos", allInfos);
		session.setAttribute("allInfos", allInfos);
		//并将数据返回到roomPrice.jsp。
		
		return "/manager/subscriptionList";
	}
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
