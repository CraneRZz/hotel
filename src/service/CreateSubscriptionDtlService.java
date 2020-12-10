package service;

import java.util.List;

import entity.CreateSubscriptionDtl;
//定义房间数据查询接口
//为categorycontroller控制层提供服务，接受控制层的参数，完成相应的功能，并返回给控制层
public interface CreateSubscriptionDtlService {
	//插入一个订单
	public void create(CreateSubscriptionDtl createSubscriptionDtl);
	//获取用户所有订单详情
	public List<CreateSubscriptionDtl> findAllSubscriptionDtl(Integer id);
	//public List<CreateSubscriptionDtl> findAllSubscriptionDtl(Integer id);
	//根据id查询预订
	public void deleteById(Integer id);
	
}
