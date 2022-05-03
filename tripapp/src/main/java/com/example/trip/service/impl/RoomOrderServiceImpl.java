package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.RoomOrder;
import com.example.trip.mapper.RoomOrderMapper;
import com.example.trip.service.RoomOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class RoomOrderServiceImpl extends ServiceImpl<RoomOrderMapper, RoomOrder> implements RoomOrderService {

    @Autowired
    private RoomOrderMapper roomOrderMapper;

    public int updateOrder(RoomOrder roomOrder){return roomOrderMapper.updateOrder(roomOrder);}

    @Override
    public int delOrder(Integer id) { return roomOrderMapper.delOrder(id);}

    @Override
    public IPage<RoomOrder> searchOrder(Page<RoomOrder> page, RoomOrder roomOrder) { return roomOrderMapper.searchOrder(page, roomOrder);}

    @Override
    public List<RoomOrder> getOrderByUserId(Integer userId) { return roomOrderMapper.getOrderByUserId(userId);}
}
