package entity;

import java.io.Serializable;

public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	//根据数据库字段写出简单java类，也就是entity类
	private Integer id;			//房间种类id
	private String name;		//房间类型名字
	private String code;		//
	private String description;	//房间描述
	private Float bedprice;		//单个床位价格
	private Float roomprice;	//整个房间价格
	

	//无参数构造方法
	public Category() {
	}
	//setter与getter方法
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getBedprice() {
		return bedprice;
	}

	public void setBedprice(Float bedprice) {
		this.bedprice = bedprice;
	}

	public Float getRoomprice() {
		return roomprice;
	}

	public void setRoomprice(Float roomprice) {
		this.roomprice = roomprice;
	}

}
