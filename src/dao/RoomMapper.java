package dao;

import java.util.Date;
import java.util.List;

import entity.Room;

public interface RoomMapper {
	//查找所有的房间数据
	public List<Room> selectAllRoom();


	public List<Room> selectAllSpareRoom(Date sdate, Date edate, Integer rCid);
}
