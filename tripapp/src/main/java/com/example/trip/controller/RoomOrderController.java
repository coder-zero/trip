package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Room;
import com.example.trip.entity.RoomOrder;
import com.example.trip.service.RoomOrderService;
import com.example.trip.service.RoomService;
import com.example.trip.utils.R;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@RestController
@RequestMapping("/trip/order")
public class RoomOrderController {

    @Autowired
    private RoomOrderService roomOrderService;
    @Autowired
    private RoomService roomService;


//    预定房间
    @PostMapping("/insertRoomOrder")
    @LogAnnotation(module = "预定",operator = "用户预定房间")
    public R insertRoomOrder(@RequestBody RoomOrder roomOrder){
        System.out.println(roomOrder);
        Room one = roomService.lambdaQuery().eq(Room::getId, roomOrder.getRoomId()).one();
        if (one.getCurrentNum()>0){
            if (roomOrderService.save(roomOrder)){
                List<RoomOrder> list = roomOrderService.lambdaQuery().eq(RoomOrder::getRoomId, one.getId()).list();
                System.out.println(list.size());
                int n =one.getRoomCount();
                one.setCurrentNum(n-list.size());
                if (roomService.updateRoomCurrentNum(one)!=0){
                   return R.ok().message("预定成功");
                }else {
                   return R.error().message("预定失败");
                }

            }else {
                return R.error().message("预定失败");
            }
        }else {
            return R.error().message("该类型房间没有余量");
        }
    }

//    接受预定
    @PostMapping("/updateOrder")
    @LogAnnotation(module = "预定",operator = "预定状态改变")
    public R reciveOrder(@RequestBody RoomOrder roomOrder){
        if (roomOrderService.updateOrder(roomOrder) !=0){
            return R.ok().message("接受预定成功");
        }else {
            return R.error().message("接受预定失败");
        }
    }

//    删除订单
    @PostMapping("/delOrder")
    @LogAnnotation(module = "预定",operator = "删除预定")
    public R delOrder(String ids){
        String[] split = ids.split(",");
        int reslut =0;
        for (int i=0;i<split.length;i++) {
            RoomOrder one = roomOrderService.lambdaQuery().eq(RoomOrder::getId, Integer.parseInt(split[i])).one();
            Room room = roomService.lambdaQuery().eq(Room::getId, one.getRoomId()).one();
            if (roomOrderService.delOrder(Integer.parseInt(split[i])) != 0) {
                List<RoomOrder> list = roomOrderService.lambdaQuery().eq(RoomOrder::getRoomId, room.getId()).list();
                int n = room.getRoomCount();
                room.setCurrentNum(n-list.size());
                if (roomService.updateRoomCurrentNum(room) != 0) {
                    reslut ++;
                }
            }
        }
        return R.ok().message("已经删除"+reslut+"个预定");
    }

//    分页显示订单
    @PostMapping("/searchOrder/{current}/{size}")
    public R searchOrder(@Param(value = "page") Page<RoomOrder> page, @RequestBody RoomOrder roomOrder){
        IPage<RoomOrder> roomOrderIPage = roomOrderService.searchOrder(page, roomOrder);
        return R.ok().data("roomOrderIPage", roomOrderIPage);
    }

//    通过用户id获取订单
    @PostMapping("/getOrderByUserId")
    public R getOrderByUserId(Integer id){

        System.out.println(id);
        List<RoomOrder> orderByUserId = roomOrderService.getOrderByUserId(id);
        return R.ok().data("orderByUserId",orderByUserId);
    }
}

