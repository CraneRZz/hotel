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
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Constant;
import service.RoomService;
import service.SubscriptionService;
import entity.Member;
import entity.Room;
import entity.Subscription;

@Controller
@RequestMapping("/subscription")
public class SubscriptionController {
	
	@Autowired
	private SubscriptionService subscriptionService;
	@Autowired
	private RoomService roomService;
	//用户中心未确认订单显示
	@RequestMapping("/center")
	public String center(HttpServletRequest request,HttpSession session)throws Exception{
		//cretate页面请求执行center操作
		/**
		 * 
		 * 步骤：
		 * 1.session找到之前的member对象
		 * 2.通过member的id与状态找到未确认的订单信息
		 * 3.将查询得到的数据用request进行返回
		 */
		Member member=(Member)session.getAttribute("member");
		List<Subscription> subscriptions=subscriptionService.findStatusUnconfirmed(member.getId(), Constant.SUBSCRIPTION_STATUS_UNCONFIRMED);
		request.setAttribute("subscriptions", subscriptions);
		session.setAttribute("subscriptions", subscriptions);
		return "memberCenter";
	}
	//管理员所有订单显示
	@RequestMapping("/showAll")
	public String showAll(String cid,String status,Date sdate,Date edate,String sno,String username,HttpServletRequest request,HttpSession session)throws Exception{
		//cretate页面请求执行center操作
		/**
		 * 
		 * 步骤：
		 * 查询所有订单信息
		 */
		List<Room> rooms=roomService.findAllRoom();
		session.setAttribute("rooms", rooms);
		String id =cid;
		String s_status =status;
		Date s_sdate =sdate;
		Date s_edate =edate;
		String s_sno = sno;
		String s_username=username;
		session.setAttribute("msid", id);
		session.setAttribute("s_status",s_status);
		session.setAttribute("s_sdate",s_sdate);
		session.setAttribute("s_edate",s_edate);
		session.setAttribute("s_sno",s_sno);
		session.setAttribute("s_username",s_username);

		if(cid == "4") {
			id=null;
		}
		if(s_status=="3") {
			s_status=null;
		}
		if("".equals(s_sno)) {
			s_sno=null;
		}
		if("".equals(s_username)) {
			s_username=null;
		}
		if(sdate==null) {
			sdate=null;
		}
		if(edate==null) {
			edate=null;
		}
		System.out.println(id);
		System.out.println(s_status);
		System.out.println(s_sdate);
		System.out.println(s_edate);
		System.out.println(s_sno);
		System.out.println(s_username);

		List<Subscription> subscriptionsAll=subscriptionService.findAllByCondition(id,s_status,s_sdate,s_edate,s_sno,s_username);
		request.setAttribute("subscriptionsAll", subscriptionsAll);
		session.setAttribute("subscriptionsAll", subscriptionsAll);
		System.out.println(subscriptionsAll);
		return "/manager/subscriptionList";
	}
	

	//用户历史订单显示
	@RequestMapping("/historySubscription")
	public String center1(HttpServletRequest request,HttpSession session)throws Exception{
		Member member=(Member)session.getAttribute("member");
		//在这里就是返回到controller
		List<Subscription> subscriptions1=subscriptionService.findHistorySubscription(member.getId());
		request.setAttribute("subscriptions1", subscriptions1);
		//session.setAttribute("subscriptions", subscriptions);
		return "historySubscription";
	}
	//用户创建新订单
	@RequestMapping("/create")
	public String create(Subscription subscription,HttpSession session)throws Exception{
		//通过sess获取数据
		Member member=(Member)session.getAttribute("member");
		//返回设置当前用户id
		subscription.setMid(member.getId());
		subscriptionService.create(subscription);

		//页面跳转到/subscription/center页面并请求数据返回订单信息到页面。
		return "redirect:/subscription/center";
		
	}
	//修改订单联系人
	@RequestMapping("/showEdit")
	public String showEdit(Integer id,HttpServletRequest request,HttpSession session)throws Exception{
		Subscription subscription=subscriptionService.findById(id);
		request.setAttribute("subscription", subscription);
		session.setAttribute("subscription", subscription);
		return "editSubscription";
	}

	//管理员删除一个订单
	@RequestMapping("/mdeleteSubscription")
	public String mdeleteSubscription(Integer id,HttpServletRequest request,HttpSession session)throws Exception{

        
		String msid = (String) session.getAttribute("msid");
		String s_status = (String) session.getAttribute("s_status");
		Date sdate=(Date) session.getAttribute("s_sdate");
		Date edate=(Date) session.getAttribute("s_edate");
		String s_sno=(String) session.getAttribute("s_sno");
		String s_username=(String) session.getAttribute("s_username");
		String s_edate ="";
		String s_sdate ="";
		String strDateFormat = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
		if(sdate!=null) { 
			 s_edate = sdf.format(edate);
		}
		if(edate!=null) {
			 s_sdate = sdf.format(sdate);
		}
		
	
		System.out.println(s_edate);
		System.out.println(s_sdate);
		subscriptionService.deleteById(id);
		return "redirect:/subscription/showAll?"+"cid="+msid+"&status="+s_status+"&sdate="+s_sdate+"&edate="+s_edate+"&sno="+s_sno+"&username="+s_username;
	}
	@RequestMapping("/edit")
	public String edit(Subscription subscription)throws Exception{
		subscriptionService.edit(subscription);
		return "redirect:/subscription/center";
	}
	
	//管理员页面订单详情显示
		@RequestMapping("/m_showDetail")
		//定义showSubscriptionDtl方法，获取数据库订单详细数据
		public String m_showDetail(HttpServletRequest request,Integer id,HttpSession session)throws Exception{
			//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
			Subscription onesubscription = subscriptionService.findById(id);
			//将数据封装在变量中
			System.out.println(onesubscription);
			request.setAttribute("onesubscription", onesubscription);
			session.setAttribute("onesubscription", onesubscription);
			session.setAttribute("onesid", id);
			//并将数据返回
			return "redirect:/create/m_subscriptionDetail";
		}
		
		//用户页面订单详情显示
				@RequestMapping("/memeber_showDetail")
				//定义showSubscriptionDtl方法，获取数据库订单详细数据
				public String memeber_showDetail(HttpServletRequest request,Integer id,HttpSession session)throws Exception{
					//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
					Subscription membersubscription = subscriptionService.findById(id);
					//将数据封装在变量中
					System.out.println(membersubscription);
					request.setAttribute("membersubscription", membersubscription);
					session.setAttribute("membersubscription", membersubscription);
					session.setAttribute("memberonesid", id);
					//并将数据返回
					return "redirect:/create/member_subscriptionDetail";
				}
		//管理员更新订单信息
		@RequestMapping("/updateDetail")
		public String updateDetail(Subscription subscription,HttpServletRequest request,HttpSession session)throws Exception{
			//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
			Integer id = (Integer) session.getAttribute("onesid");
			System.out.println(id);
			subscription.setId(id);
			subscriptionService.updateById(subscription);
			//并将数据返回
			return "/manager/subscriptionDetail";
		}
//		时间格式化
		@InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        dateFormat.setLenient(false);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	    }
		
		
		
	
}
