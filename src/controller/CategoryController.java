package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Category;

import service.CategoryService;

@Controller
//所有响应请求的方法都是以该地址/category作为父路径
@RequestMapping("/category")
public class CategoryController {
	
	//通过@Autowired自动装配方式，从IoC容器中去查找到，并返回给该属性
	
	@Autowired
	private CategoryService categoryService;
    //所有响应请求的方法都是以该地址/showCategory作为父路径
	
	@RequestMapping("/showCategory")
	//定义showCategory方法，获取数据库category数据
	
	public String showCategory(HttpServletRequest request,HttpSession session)throws Exception{
		
		//在控制器里调用service查找房间种类方法，并将数据返回到jso中
		List<Category> categories=categoryService.findAllCategory();
		
		//将数据封装在变量中
		
		System.out.println("房间种类"+categories);
		request.setAttribute("categories", categories);
		session.setAttribute("categories", categories);
		
		//并将数据返回到roomPrice.jsp。
//		return "roomPrice";
		return "redirect:/create/createSubscription1";

	}
	
}
