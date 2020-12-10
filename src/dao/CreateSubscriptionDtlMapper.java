package dao;

import java.util.List;

import entity.CreateSubscriptionDtl;

public interface CreateSubscriptionDtlMapper {
	//插入一个订单
	public void insert(CreateSubscriptionDtl createSubscriptionDtl);
	//获取用户所有订单详情
	public List<CreateSubscriptionDtl> selectAllSubscriptionDtl(Integer id);
	//public void delSubscriptionDtl(Integer id);
	//根据id查询预订
	public void delById(Integer id);
}
