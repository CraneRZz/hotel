package constant;

public interface Constant {
	/**
	 * 订单状态：已取消
	 */
	public String SUBSCRIPTION_STATUS_CANCELLED="0";
	/**
	 * 订单状态：未确认
	 */
	public String SUBSCRIPTION_STATUS_UNCONFIRMED="1";
	/**
	 * 订单状态：已确认
	 */
	public String SUBSCRIPTION_STATUS_CONFIRM="2";
	/**
	 * 客房类型：单人间
	 */
	public String ROOMTYPE_STATUS_SINGEL="1";
	/**
	 * 客房类型：标准间
	 */
	public String ROOMTYPE_STATUS_STANDARD="2";
	/**
	 * 客房类型：豪华标准间
	 */
	public String ROOMTYPE_STATUS_CONFIRM="3";
	/**
	 * 预定方式：单个床位
	 */
	public String BOOKTYPE_STATUS_ONE="1";
	
	/**
	 * 预定方式：整个房间
	 */
	public String BOOKTYPE_STATUS_ALL="2";
	/**
	 * 房间状态：空闲
	 */
	public String ROOM_STATUS_free="0";
	/**
	 * 房间状态：被预定
	 */
	public String ROOM_STATUS_BOOKED="1";
	
}


