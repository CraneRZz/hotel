package entity;

import java.io.Serializable;
import java.util.Date;

public class CreateSubscriptionDtl implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer id;         //详细订单id，主键
	private Integer rid;		//房间id，外键
	private Integer sid;		//订单id，外键
	private Date sdate;			//入住日期
	private Date edate;			//退房日期
	private Integer residetype; //预定房间的类型
	private Float price;		//预定房间的价格
	private Room room;			//关系，一个新增预定包含一个房间。
	private Subscription subscription;


	public CreateSubscriptionDtl() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Integer getResidetype() {
		return residetype;
	}
	public void setResidetype(Integer residetype) {
		this.residetype = residetype;
	}
	public Subscription getSubscription() {
		return subscription;
	}
	public void setSubscription(Subscription subscription) {
		this.subscription = subscription;
	}
	
	/*`id` int(11) NOT NULL AUTO_INCREMENT,
	  `rid` int(11) DEFAULT NULL,
	  `sid` int(11) DEFAULT NULL,
	  `sdate` date NOT NULL,
	  `edate` date NOT NULL,
	  `residetype` int(11) NOT NULL,
	  `price` float NOT NULL,*/

}
