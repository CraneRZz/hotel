package service;

import java.util.List;

import entity.Category;
//定义房间数据查询接口
//为categorycontroller控制层提供服务，接受控制层的参数，完成相应的功能，并返回给控制层
public interface CategoryService {
	//查询所有房间种类
	public List<Category> findAllCategory();
}
