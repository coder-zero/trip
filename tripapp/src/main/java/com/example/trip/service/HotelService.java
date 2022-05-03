package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Hotel;
import com.baomidou.mybatisplus.extension.service.IService;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface HotelService extends IService<Hotel> {

    int delHotel(String ids);
    int editHotel(Hotel hotel);
    IPage<Hotel> searchHotel(Page<Hotel> page, Hotel hotel);
    List<Hotel> getAllHotel();
    List<Hotel> getAllHotelAndRoom(Hotel hotel);


}
