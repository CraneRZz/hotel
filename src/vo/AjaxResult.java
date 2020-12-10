package vo;

import java.io.Serializable;

public class AjaxResult implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private Object data;
	public AjaxResult() {
		super();
	}
	public AjaxResult(String name, Object data) {
		super();
		this.name = name;
		this.data = data;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
