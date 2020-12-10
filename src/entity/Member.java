package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Member implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;			//用户id，主键
	private String username;	//用户名
	private String pwd;			//通用户密码
	private String name;		//联系人名字
	private String email;		//联系人邮箱
	private String phone;		//联系人电话
	private Date regtime;		//用户注册时间
	private List<Subscription> subscription;


	public Member() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	public List<Subscription> getSubscription() {
		return subscription;
	}

	public void setSubscription(List<Subscription> subscription) {
		this.subscription = subscription;
	}



}
