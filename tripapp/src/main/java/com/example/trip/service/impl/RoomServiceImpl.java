package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Room;
import com.example.trip.mapper.RoomMapper;
import com.example.trip.service.RoomService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.trip.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Service
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    public int editRoom(Room room){ return roomMapper.editRoom(room);}

    public int delRoom(String ids){ return roomMapper.delRoom(ids);}

    public IPage<Room> searchRoom(Page<Room> page, Room room){ return roomMapper.searchRoom(page, room);}

    @Override
    public int updateRoomCurrentNum(Room room) { return roomMapper.updateRoomCurrentNum(room);}

    @Override
    public List<Room> getRoomByHotelId(Integer id) { return roomMapper.getRoomByHotelById(id);}
}
