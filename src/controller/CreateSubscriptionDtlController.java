package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.IteratorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Category;
import entity.CreateSubscriptionDtl;
import entity.Member;
import entity.Room;
import service.CreateSubscriptionDtlService;
import service.RoomService;

@Controller
//所有响应请求的方法都是以该地址/create作为父路径
@RequestMapping("/create")
public class CreateSubscriptionDtlController {
	//通过@Autowired自动装配方式，从IoC容器中去查找到，并返回给该属性
	@Autowired
	private CreateSubscriptionDtlService createSubscriptionDtlService;
	@Autowired
	private RoomService roomService;
    //所有响应请求的方法都是以该地址/showSubscriptionDtl作为父路径
	@RequestMapping("/showSubscriptionDtl")
	//定义showSubscriptionDtl方法，获取数据库订单详细数据

	public String showSubscriptionDtl(HttpServletRequest request,Integer id,HttpSession session)throws Exception{
		//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
		List<CreateSubscriptionDtl> subscription_dtl=createSubscriptionDtlService.findAllSubscriptionDtl(id);
		//将数据封装在变量中
		request.setAttribute("subscription_dtl", subscription_dtl);
		session.setAttribute("subscription_dtl", subscription_dtl);
		session.setAttribute("sid", id);

		//并将数据返回到subscriptionDetail.jsp。
		return "subscriptionDetail";
//		return "redirect:/create/createSubscription1";
	}
	
	//查找可被预订的房间
	@SuppressWarnings({ "unchecked" })
	@RequestMapping("/createSubscriptionSession")
	
	public String createSubscriptionSession(CreateSubscriptionDtl createSubscriptionDtl,Integer rCid,HttpServletRequest request,HttpSession session)throws Exception{
		//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
		@SuppressWarnings({ "unchecked" })
		List<Room> rooms = (List<Room>) session.getAttribute("rooms");
		//定义空闲房间list与房间类型list

		List<String> spareRooms =new ArrayList<String>();
		List<Room> roomsType =new ArrayList<Room>();
		
		//将数据封装在变量中，在创建订单的时候获取
		request.setAttribute("createSubscriptionDtl", createSubscriptionDtl);
		session.setAttribute("createSubscriptionDtl", createSubscriptionDtl);
		//获取到房间种类与开始时间与结束时间
		Date sdate = createSubscriptionDtl.getSdate();
		Date edate = createSubscriptionDtl.getEdate();
		System.out.println(sdate);
		System.out.println(edate);
		//获取可预订房间号码
		List<Room> notSparerooms=roomService.findAllSpareRoom(sdate,edate,rCid);
		List<Room> notRoomno1 =new ArrayList<Room>();
		for(Room room1:notSparerooms) {
//			notRoomno[i] = room1.getNo();
			notRoomno1.add(room1);
			
		}
		//取出房间session
		
		
		System.out.println("非空闲房间"+notSparerooms);
	
		//比较两个list的元素，去除不满足条件的元素，挑选满足种类的元素
		for(Room room : rooms) {
			if(room.getCid() == rCid) {
				roomsType.add(room);
			}	
			
		}
//		spareRooms=roomsType;
		
		
		
		//*******************************************//
		List<String> notRoomno =new ArrayList<String>();
		
		List<String> spareRoom =new ArrayList<String>();
//		String [] notRoomno = new String[notSparerooms.size()];
//		String [] spareRoom = new String[roomsType.size()];
		int i =0;
		int j =0;
		for(Room room1:notSparerooms) {
//			notRoomno[i] = room1.getNo();
			notRoomno.add(room1.getNo());
			
		}
		for(Room room1:roomsType) {
			spareRoom.add(room1.getNo());
//			spareRooms.add(spareRoom[j]);
			j++;
		}
		for(String room1:spareRoom) {
			String test = room1;
				if(notRoomno.contains(test)) {
					System.out.println("不能被使用的房间");
					continue;
					
			}
				else {
					System.out.println("能被使用的房间");
					spareRooms.add(room1);
				}
			
		}
		System.out.println("空闲房间"+spareRooms);
		
		
		//*******************************************//
//		Iterator<Room> sroom = spareRooms.iterator();  
//		String [] roomno = new String[notSparerooms.size()];
//		int i =0;
//		for(Room room1:notSparerooms) {
//			roomno [i] = room1.getNo();
//			
//			i++;
//		}
//		System.out.println(sroom);
//        while (sroom.hasNext()) {
//        	Room sapreroom = sroom.next();
//        	System.out.println("测试元素"+sapreroom.getNo());
//        	for (int j = 0;j<roomno.length;j++) {
//        		
//        		if (sapreroom.getNo().equals(roomno[j])) {  
//        			System.out.println("测试元素"+sapreroom.getNo());
//        			sroom.remove();
//        			
//            	//使用迭代器的删除方法删除  
//        		} 
//            }
//        }
//        
//        while (sroom.hasNext()) {
//        	Room sapreroom = sroom.next();
//        	System.out.println("测试元素"+sapreroom.getNo());
//        }
//        
//        System.out.println(sroom);
//        spareRooms = IteratorUtils.toList(sroom);
		//*******************************************//
		
		
//		for(Room room : roomsType) {
//			for(Room room1:notRoomno1) {				
//				if(room1.getNo()==room.getNo()) {
//					System.out.println(room1.getNo());
//					System.out.println(room.getNo());
//					spareRooms.remove(room);
//					break;
//				}
//			}
//
//		}
		//将数据封装在变量中
		request.setAttribute("spareRooms", spareRooms);
		session.setAttribute("spareRooms", spareRooms);
		session.setAttribute("rCid", rCid);
		
		//并将数据返回到createSubscriptionDtl-2.jsp。
		return "createSubscriptionDtl-2";
	}
	//创建新增预定
	@RequestMapping("/createSubscription3")
	public String create(HttpSession session,String[] roomNo)throws Exception{
		//通过session获取数据
		//步骤，获取到房间，订单，房间种类信息的session
		//通过循环获取所需信息s
		//然后将数据进行保存
		//List <Room> rooms = (List<Room>) session.getAttribute("rooms");
		//Category categorie = (Category)session.getAttribute("categories");
	
		//createSubscriptionDtl.setRid(1);
		CreateSubscriptionDtl createSubscriptionDtl = (CreateSubscriptionDtl) session.getAttribute("createSubscriptionDtl");
		@SuppressWarnings("unused")
		Member member=(Member)session.getAttribute("member");
		@SuppressWarnings({ "unchecked" })
		List<Room> rooms = (List<Room>) session.getAttribute("rooms");
		//@SuppressWarnings("unused")
		//List<Subscription> subscriptions = (List<Subscription>) session.getAttribute("subscriptions");
		@SuppressWarnings({ "unchecked" })
		List<Category> categories=(List<Category>) session.getAttribute("categories");
		Integer rCid = (Integer) session.getAttribute("rCid");
		//设置预定rid
		//房间id获取不到
		String[] RoomNo = roomNo;
		for (int i =0;i<RoomNo.length;i++) {
			String roomno = RoomNo[i];
		for(Room room : rooms) {
			
//			room.getCid() == rCid && 
			String rNo = room.getNo();
			System.out.println(rNo);
			System.out.println(roomno);
			if(rNo.equals(roomno)) {
				System.out.println(room.getId());
				createSubscriptionDtl.setRid(room.getId());
				break;
			}
			
		}
		
		//设置价格
		for(Category catetory : categories) {
			if(catetory.getId()==rCid) {
				float price = (float)catetory.getRoomprice();
				createSubscriptionDtl.setPrice(price);
			}
		}
		//createSubscriptionDtl.setPrice((float) 100);
		int sid = (Integer) session.getAttribute("sid");
		createSubscriptionDtl.setSid(sid);
		createSubscriptionDtlService.create(createSubscriptionDtl);
		}
		return "redirect:/create1/createSubscription3";
	}
	//删除一个预定订单
	@RequestMapping("/deleteSubscriptionDtl")
	public String deleteSubscriptionDtl(Integer id,HttpServletRequest request,HttpSession session)throws Exception{
		createSubscriptionDtlService.deleteById(id);
		int sid = (Integer) session.getAttribute("sid");
		return "redirect:/create/showSubscriptionDtl？"+"id="+sid;
	}
	//管理员删除一个预定订单
	@RequestMapping("/m_deleteSubscriptionDtl")
	public String m_deleteSubscriptionDtl(Integer id,HttpServletRequest request,HttpSession session)throws Exception{
		createSubscriptionDtlService.deleteById(id);
		int onesid = (Integer) session.getAttribute("onesid");
		return "redirect:/subscription/m_showDetail?"+"id="+onesid;
	}
	
	@RequestMapping("/m_subscriptionDetail")
	//管理员获取数据库订单详细数据
	public String m_subscriptionDetail(HttpServletRequest request,HttpSession session)throws Exception{
		//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
		Integer id = (Integer) session.getAttribute("onesid");
		List<CreateSubscriptionDtl> oneSubscriptionDetail=createSubscriptionDtlService.findAllSubscriptionDtl(id);
		//将数据封装在变量中
		System.out.println(oneSubscriptionDetail);
		request.setAttribute("oneSubscriptionDetail", oneSubscriptionDetail);
		//session.setAttribute("onesid", id);
		session.setAttribute("oneSubscriptionDetail", oneSubscriptionDetail);
		//并将数据返回
		
		//return "showmanager/Detail";
		return "/manager/subscriptionDetail";
		
	}
	@RequestMapping("/member_subscriptionDetail")
	//管理员获取数据库订单详细数据
	public String member_subscriptionDetail(HttpServletRequest request,HttpSession session)throws Exception{
		//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
		Integer id = (Integer) session.getAttribute("memberonesid");
		List<CreateSubscriptionDtl> memberSubscriptionDetail=createSubscriptionDtlService.findAllSubscriptionDtl(id);
		//将数据封装在变量中
		System.out.println(memberSubscriptionDetail);
		request.setAttribute("memberSubscriptionDetail", memberSubscriptionDetail);
		//session.setAttribute("onesid", id);
		session.setAttribute("memberSubscriptionDetail", memberSubscriptionDetail);
		//并将数据返回
		
		//return "showmanager/Detail";
		return "subscriptionDetail-1";
		
	}
//	@RequestMapping("/createSubscription1")
//	//定义showSubscriptionDtl方法，获取数据库订单详细数据
//	public String createSubscription1(HttpServletRequest request,HttpSession session)throws Exception{
//		
//		return "redirect:/create/createSubscription1";
//		
//	}
//	时间格式化
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	
}
