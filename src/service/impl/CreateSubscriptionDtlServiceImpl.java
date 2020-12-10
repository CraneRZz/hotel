package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.CreateSubscriptionDtlService;
import dao.CreateSubscriptionDtlMapper;
import entity.CreateSubscriptionDtl;

@Service
//定义事务处理
//插入一个订单
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class CreateSubscriptionDtlServiceImpl implements CreateSubscriptionDtlService {
	
	@Autowired
	private CreateSubscriptionDtlMapper createSubscriptionDtlMapper;
	@Override
	public void create(CreateSubscriptionDtl createSubscriptionDtl){
		
		createSubscriptionDtlMapper.insert(createSubscriptionDtl);
	}
	//获取用户所有订单详情
	@Transactional(readOnly=true)
	@Override
	public List<CreateSubscriptionDtl> findAllSubscriptionDtl(Integer id) {
		return createSubscriptionDtlMapper.selectAllSubscriptionDtl(id);
	}
	//根据id查询预订
	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		createSubscriptionDtlMapper.delById(id);
	}
	


}
