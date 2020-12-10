package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Manager;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;
import service.CreateSubscriptionDtlService;
import service.ManagerService;
import service.SubscriptionService;
import util.MD5Util;
import vo.AjaxResult;
@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	@ExceptionHandler(DuplicateUsernameException.class)
	public ModelAndView registExceptionHandler(Exception e){
		return new ModelAndView("/manager/login","e",e);
	}
	
	@ExceptionHandler(value={UserNotFoundException.class})
	public ModelAndView loginExceptionHandler(Exception e){
		return new ModelAndView("/manager/login","e",e);
	}
	//登录controller
	@RequestMapping("/login")
	public String login(String username,String pwd,HttpSession session)throws Exception{
		Manager manager=managerService.login(username, pwd);
		session.setAttribute("manager", manager);
		//System.out.println(manager);
		return "redirect:/manager/Query";
//		/manager/subscriptionQuery
	}
	//退出操作
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		Manager manager = (Manager) session.getAttribute("manager");
		System.out.println("退出前的session"+manager);
		session.invalidate();
		
		return "redirect:/showmanager/login";
	}
	
	@RequestMapping("/indexLogin")
	@ResponseBody
	public AjaxResult indexLogin(String username,String pwd,HttpSession session){
		AjaxResult ajaxResult=new AjaxResult();
		try {
			Manager manger=managerService.indexLogin(username,pwd);
			session.setAttribute("manger", manger);
			ajaxResult.setName("success");
		} catch (UserNotFoundException e) {
			ajaxResult.setName("userNotFound");
			ajaxResult.setData(e.getMessage());
		}
		return ajaxResult;
	}
	//检查密码是否正确
	@RequestMapping("/checkPwd")
	@ResponseBody
	public AjaxResult checkPwd(String pwd,HttpSession session){
		AjaxResult ajaxResult=new AjaxResult();
		Manager manger=(Manager) session.getAttribute("manger");
		if(MD5Util.md5(pwd).equals(manger.getPwd())){
			ajaxResult.setName("success");
		}else{
			ajaxResult.setName("fail");
			ajaxResult.setData("原密码不正确");
		}
		return ajaxResult;
	}
	
	
}
