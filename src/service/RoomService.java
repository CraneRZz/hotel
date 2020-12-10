package service;

import java.util.Date;
import java.util.List;

import entity.Room;
//定义房间数据查询接口
//为categorycontroller控制层提供服务，接受控制层的参数，完成相应的功能，并返回给控制层
public interface RoomService {
	//查找所有的房间数据
	public List<Room> findAllRoom();
	//查找空闲的房间
	public List<Room> findAllSpareRoom(Date sdate, Date edate, Integer rCid);
}
