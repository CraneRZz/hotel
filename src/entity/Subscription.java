package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;



public class Subscription implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;			//订单id，主键
	private Integer mid;		//订单用户id
	private String no;			//订单号
	private String linkman;		//联系人
	private String email;		//email
	private String phone;		//电话
	private String status;		//订单状态，取消、确定、未生效
	private Date cretime;		//创建时间
	private String remark;		//备注
	private List<CreateSubscriptionDtl> subscriptionDtl;

	
	
	public Subscription() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCretime() {
		return cretime;
	}

	public void setCretime(Date cretime) {
		this.cretime = cretime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<CreateSubscriptionDtl> getSubscriptionDtl() {
		return subscriptionDtl;
	}

	public void setSubscriptionDtl(List<CreateSubscriptionDtl> subscriptionDtl) {
		this.subscriptionDtl = subscriptionDtl;
	}

}
