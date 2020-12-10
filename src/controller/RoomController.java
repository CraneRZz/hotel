package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Room;
import service.RoomService;

@Controller
//所有响应请求的方法都是以该地址/create作为父路径
//获取所有房间信息
@RequestMapping("/create")
public class RoomController {
	//通过@Autowired自动装配方式，从IoC容器中去查找到，并返回给该属性
	@Autowired
	private RoomService roomService;
    //所有响应请求的方法都是以该地址/showSubscriptionDtl2作为父路径
	@RequestMapping("/createSubscription1")
	//定义showRoom方法，获取数据库room数据
	public String showRoom(HttpServletRequest request,HttpSession session)throws Exception{
		//在控制器里调用service查找房间种类方法，并将数据返回到jsp中
		List<Room> rooms=roomService.findAllRoom();
		//将数据封装在变量中
		request.setAttribute("rooms", rooms);
		session.setAttribute("rooms", rooms);
		System.out.println("房间信息"+rooms);
		//并将数据返回到。

		return "roomPrice";
	}
	
	
	
}
