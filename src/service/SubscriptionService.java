package service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Subscription;

public interface SubscriptionService {
	//插入一个新订单
	public void create(Subscription subscription);
	//查找没有被确认的订单
	public List<Subscription> findStatusUnconfirmed(Integer mid,String status);
	//通过订单id查找预定
	public Subscription findById(Integer id);
	//根据订单id删除数据
	public void deleteById(Integer id);
	//更新订单信息
	public void edit(Subscription subscription);
	//管理员查询所有订单
	public List<Subscription> findAllByCondition(@Param("cid") String cid, @Param("status") String status, @Param("sdate") Date sdate, @Param("edate") Date edate, @Param("sno") String sno, @Param("username") String username);


	//public void updateById(@Param("id") Integer id,@Param("status") String status,@Param("remark") String remark);
	//用户历史订单查询
	public List<Subscription> findHistorySubscription(Integer mid);
	//管理员更新订单状态及备注
	public void updateById(Subscription subscription);

}
