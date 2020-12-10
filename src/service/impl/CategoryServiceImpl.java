package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.CategoryService;
import dao.CategoryMapper;
import entity.Category;

@Service
//定义事务处理
//查询所有房间种类
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Transactional(readOnly=true)
	@Override
	public List<Category> findAllCategory() {
		return categoryMapper.selectAllCategory();
	}

}
