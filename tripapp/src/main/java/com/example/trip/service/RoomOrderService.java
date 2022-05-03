package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.RoomOrder;
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
public interface RoomOrderService extends IService<RoomOrder> {

    int updateOrder(RoomOrder roomOrder);
    int delOrder(Integer ids);
    IPage<RoomOrder> searchOrder(Page<RoomOrder> page, RoomOrder roomOrder);
    List<RoomOrder> getOrderByUserId(Integer userId);

}
