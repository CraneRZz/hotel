package dao;

import java.util.List;

import entity.Category;
//定义房间种类数据查询接口，供service使用
public interface CategoryMapper {
	//查询所有房间种类
	public List<Category> selectAllCategory();
}
