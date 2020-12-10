package service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.RoomService;
import dao.RoomMapper;
import entity.Room;

@Service
//定义事务处理
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomMapper roomMapper;
	//查找所有的房间数据
	@Transactional(readOnly=true)
	@Override
	public List<Room> findAllRoom() {
		return roomMapper.selectAllRoom();
	}
	@Override
	public List<Room> findAllSpareRoom(Date sdate, Date edate, Integer rCid) {
		// TODO Auto-generated method stub
		return roomMapper.selectAllSpareRoom(sdate,edate,rCid);
	}

}
