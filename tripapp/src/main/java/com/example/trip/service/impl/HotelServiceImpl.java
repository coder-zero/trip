package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Hotel;
import com.example.trip.mapper.HotelMapper;
import com.example.trip.service.HotelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.omg.PortableInterceptor.HOLDING;
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
public class HotelServiceImpl extends ServiceImpl<HotelMapper, Hotel> implements HotelService {

    @Autowired
    private HotelMapper hotelMapper;

    public int delHotel(String ids){ return hotelMapper.delHotel(ids);}
    public int editHotel(Hotel hotel){ return hotelMapper.editHotel(hotel);}
    public IPage<Hotel> searchHotel(Page<Hotel> page, Hotel hotel){ return hotelMapper.searchHotel(page,hotel);}
    public List<Hotel> getAllHotel(){ return hotelMapper.getAllHotel();}

    @Override
    public List<Hotel> getAllHotelAndRoom(Hotel hotel) { return hotelMapper.getAllHotelAndRoom(hotel);}
}
