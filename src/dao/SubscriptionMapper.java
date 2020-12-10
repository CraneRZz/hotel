package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Subscription;

public interface SubscriptionMapper {
	//插入一个新订单
	public void insert(Subscription subscription);
	//查找没有被确认的订单
	public List<Subscription> selectStatusUnconfirmed(Integer mid,String status);
	//通过订单id查找预定
	public Subscription selectById(Integer id);
	//更新订单信息
	public void update(Subscription subscription);
	//根据订单id删除数据
	public void delById(Integer id);
	//管理员查询所有订单
	public List<Subscription> selectAllByCondition(@Param("cid") String cid, @Param("status") String status, @Param("sdate") Date sdate, @Param("edate") Date edate, @Param("sno") String sno, @Param("username") String username);
	//管理员更新订单状态及备注
	public void updateStatus(Subscription subscription);
	//用户历史订单查询
	public List<Subscription> selectHistorySubscription(Integer mid);
	
}
