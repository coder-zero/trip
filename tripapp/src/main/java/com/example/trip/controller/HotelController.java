package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Hotel;
import com.example.trip.entity.Room;
import com.example.trip.entity.RoomOrder;
import com.example.trip.service.HotelService;
import com.example.trip.service.RoomOrderService;
import com.example.trip.service.RoomService;
import com.example.trip.utils.R;
import io.swagger.models.auth.In;
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
@RequestMapping("/trip/hotel")
public class HotelController {

    @Autowired
    private HotelService hotelService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private RoomOrderService roomOrderService;

//    插入酒店信息
    @PostMapping("/insertHotel")
    @LogAnnotation(module = "酒店",operator = "插入酒店信息")
    public R insertHotel(@RequestBody Hotel hotel){
        if (hotelService.save(hotel)){
            return R.ok().message("添加酒店信息成功");
        }else {
            return R.error().message("添加酒店信息失败");
        }
    }

//    删除酒店信息 需要删除 评论、房间、房间订单
    @PostMapping("/delHotel")
    @LogAnnotation(module = "酒店",operator = "删除酒店信息包括（酒店评论、房间、房间订单）")
    public R delHotel(String ids){
        String[] split = ids.split(",");
        int res1 =0;
        int res2 =0;
        for (int i=0; i < split.length; i++){
            List<Room> list = roomService.lambdaQuery().eq(Room::getHotelId, Integer.parseInt(split[i])).list();
            List<RoomOrder> list1 = roomOrderService.lambdaQuery().eq(RoomOrder::getHotelId, Integer.parseInt(split[i])).list();
            System.out.println(list);
            if (list != null && !list.isEmpty()){
                return R.error().message("酒店尚有房间未删除");
            }else {
                res1++;
            }
            if (list1 != null && !list1.isEmpty()){
              return R.error().message("酒店尚有订单未删除");
            }else {
                res2++;
            }
        }
        if (res1  == split.length && res2 == split.length){
            if(hotelService.delHotel(ids) != 0){
                return R.ok().message("删除成功");
            }else {
                return R.error().message("删除失败");
            }
        }else {
            return R.error().message("删除失败");
        }
    }

//    修改酒店信息
    @PostMapping("editHotel")
    @LogAnnotation(module = "酒店",operator = "修改酒店信息")
    public R editHotel(@RequestBody Hotel hotel){
        System.out.println(hotel);
        if (hotelService.editHotel(hotel) != 0){
            return R.ok().message("修改成功");
        }else {
            return R.error().message("修改失败");
        }
    }

//    分页获取酒店信息
    @PostMapping("/searchHotel/{current}/{size}")
    public R searchHotel(@Param(value = "page") Page<Hotel> page, @RequestBody Hotel hotel){
        IPage<Hotel> hotelIPage = hotelService.searchHotel(page, hotel);
        return R.ok().data("hotelIPage", hotelIPage);
    }

//    获取所有酒店id
    @GetMapping("getAllHotel")
    public R getAllHotel(){
        List<Hotel> allHotel = hotelService.getAllHotel();
//        Hotel[] hotels = new Hotel[allHotel.size()];
//        Hotel[] hotels1 = allHotel.toArray(hotels);

        return R.ok().data("hotels1", allHotel);

    }

//    通过id获取酒店信息
    @GetMapping("getHotelById")
    public R getHotelById(Integer id){
        Hotel byId = hotelService.getById(id);
        return R.ok().data("byId",byId);

    }

//    获取所有的酒店以及房间
    @PostMapping("getAllHotelAndRoom")
    public R getAllHotelAndRoom( @RequestBody  Hotel hotel){
        List<Hotel> allHotelAndRoom = hotelService.getAllHotelAndRoom(hotel);
        for (Hotel item:allHotelAndRoom){
            List<Room> list = roomService.lambdaQuery().eq(Room::getHotelId, item.getId()).list();
            item.setRoomList(list);
        }
        return R.ok().data("allHotelAndRoom",allHotelAndRoom);

    }


}

