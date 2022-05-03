package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Hotel;
import com.example.trip.entity.Room;
import com.example.trip.entity.RoomOrder;
import com.example.trip.service.HotelService;
import com.example.trip.service.RoomOrderService;
import com.example.trip.service.RoomService;
import com.example.trip.utils.R;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping("/trip/room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private RoomOrderService roomOrderService;

//    添加房间信息
    @PostMapping("/insertRoom")
    @LogAnnotation(module = "房间",operator = "新增房间")
    public R insertRoom(@RequestBody Room room){
        Hotel one = hotelService.lambdaQuery().eq(Hotel::getId, room.getHotelId()).one();
        if (one != null){
            if (roomService.save(room)){
                return R.ok().message("添加成功");
            }else {
                return R.error().message("添加失败");
            }
        }else {
            return R.error().message("酒店信息错误");
        }
    }

//    修改房间信息
    @PostMapping("/editRoom")
    @LogAnnotation(module = "房间",operator = "修改房间信息")
    public R editRoom(@RequestBody Room room){
        List<RoomOrder> list = roomOrderService.lambdaQuery().eq(RoomOrder::getRoomId, room.getId()).list();
        int i=0;
        i=room.getRoomCount();
        if (list.size()>i || i==0){
            return R.error().message("修改失败，房间数量少于已预定的房间数量或房间数量为0");
        }else {
            System.out.println(list.size());
            room.setCurrentNum(i-list.size());
            if (roomService.editRoom(room) != 0){
                return R.ok().message("修改成功");
            }else {
                return R.error().message("修改失败");
            }
        }

    }

//    删除房间
    @PostMapping("/delRoom")
    @LogAnnotation(module = "房间",operator = "删除房间")
    public R delRoom(String ids){
        String[] split = ids.split(",");
        int res = 0;
        for (int i=0; i < split.length; i++){
            RoomOrder one = roomOrderService.lambdaQuery().eq(RoomOrder::getRoomId, Integer.parseInt(split[i])).one();
            if (one !=null){
                return R.error().message("删除失败,房间"+split[i]+"有预定未处理");
            }else {
                res++;
            }
        }
        if (res == split.length){
            if (roomService.delRoom(ids) !=0){
                return R.ok().message("删除成功");
            }else {
                return R.error().message("删除失败");
            }
        }else {
            return R.error().message("删除失败");
        }
    }

//    查询房间
    @PostMapping("/searchRoom/{current}/{size}")
    public R searchRoom(@Param(value = "page") Page<Room> page, @RequestBody Room room){
        IPage<Room> roomIPage = roomService.searchRoom(page, room);
        return R.ok().data("roomIPage", roomIPage);
    }

    @GetMapping("getRoomByHotelId")
    public R getRoomByHotelId(Integer id){
        List<Room> roomByHotelId = roomService.getRoomByHotelId(id);
        return R.ok().data("roomByHotelId",roomByHotelId);
    }

}

