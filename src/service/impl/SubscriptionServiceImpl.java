package service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.SubscriptionService;
import util.SubscriptionNoUtil;
import constant.Constant;
import dao.SubscriptionMapper;
import entity.Subscription;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class SubscriptionServiceImpl implements SubscriptionService {
	
	@Autowired
	private SubscriptionMapper subscriptionMapper;
	//插入一个新订单
	@Override

	public void create(Subscription subscription) {
		//		获取订单号
		subscription.setNo(SubscriptionNoUtil.getSubscriptionNo());
		//	利用常量̬设置订单状态
		subscription.setStatus(Constant.SUBSCRIPTION_STATUS_UNCONFIRMED);
		subscriptionMapper.insert(subscription);
	}

	@Transactional(readOnly=true)
	@Override
	//参数的传入来自于controller
	//查找没有被确认的订单
	public List<Subscription> findStatusUnconfirmed(Integer mid, String status) {
		return subscriptionMapper.selectStatusUnconfirmed(mid, status);
	}
	
	//通过订单id查找预定
	@Transactional(readOnly=true)
	@Override
	public Subscription findById(Integer id) {
		return subscriptionMapper.selectById(id);
	}

	//更新订单信息
	@Override
	public void edit(Subscription subscription) {
		subscriptionMapper.update(subscription);
	}
	
	//根据订单id删除数据
	@Override
	public void deleteById(Integer id) {
		subscriptionMapper.delById(id);
	}

	//管理员查询所有订单
	@Override
	public List<Subscription> findAllByCondition(String cid, String status, Date sdate, Date edate, String sno, String username) {
		// TODO Auto-generated method stub
		return subscriptionMapper.selectAllByCondition(cid,status,sdate,edate,sno,username);
	}

	//管理员更新订单状态及备注
	@Override
	public void updateById(Subscription subscription) {
		// TODO Auto-generated method stub
		subscriptionMapper.updateStatus(subscription);
	}

	//用户历史订单查询
	@Override
	public List<Subscription> findHistorySubscription(Integer mid) {
		// TODO Auto-generated method stub
		return subscriptionMapper.selectHistorySubscription(mid);
	}

}
