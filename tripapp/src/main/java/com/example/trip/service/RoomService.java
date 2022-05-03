package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Room;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface RoomService extends IService<Room> {

    int editRoom(Room room);
    int delRoom(String ids);
    IPage<Room> searchRoom(Page<Room> page, Room room);
    int updateRoomCurrentNum(Room room);
    List<Room> getRoomByHotelId(Integer id);
}
