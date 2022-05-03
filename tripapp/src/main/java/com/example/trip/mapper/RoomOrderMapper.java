package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Room;
import com.example.trip.entity.RoomOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Repository
public interface RoomOrderMapper extends BaseMapper<RoomOrder> {

    @Update("update room_order set is_accept=#{isAccept} where id=#{id}")
    public int updateOrder(RoomOrder roomOrder);

    @Delete("<script>"+
            "delete t1 from room_order AS t1\n" +
            "<where>" +
            "t1.id = #{id}"+
            "</where>"+"</script>")
    public int delOrder(@Param(value = "id") Integer id);

    @Select("<script>" +
            "select ro.id, ro.hotel_id, ro.user_id, ro.room_id, ro.start_time, ro.end_time, ro.is_accept, r.room_type, r.room_price, ho.hotel_name, u.username,u.real_name from room_order ro left join room r on ro.room_id = r.id \n" +
            "left join hotel ho on ro.hotel_id = ho.id\n" +
            "left join  user u on ro.user_id = u.id" +
            "<where> 1 = 1" +
            "<if test= \" roomOrder.hotelName != null and roomOrder.hotelName != '' \"> AND ro.hotel_id in (select id from hotel h where h.hotel_name like concat('%',#{roomOrder.hotelName},'%'))</if>" +
            "<if test= \" roomOrder.username != null and roomOrder.username != '' \"> AND ro.user_id in (select id from user us where us.username like concat('%',#{roomOrder.username},'%'))</if>" +
            "</where>" +
            "</script>")
    public IPage<RoomOrder> searchOrder(@Param(value = "page") Page<RoomOrder> page, @Param(value = "roomOrder") RoomOrder roomOrder);

    @Select("<script>" +
            "select ro.id, ro.hotel_id, ro.user_id, ro.room_id, ro.start_time, ro.end_time, ro.is_accept, r.room_type, r.room_price, h.hotel_name, u.username, u.real_name from room_order ro left join room r on ro.room_id = r.id\n" +
            "left join hotel h on ro.hotel_id = h.id\n" +
            "left join user u  on ro.user_id = u.id\n" +
            "where ro.user_id = #{userId}" +
            "</script>")
    public List<RoomOrder> getOrderByUserId(@Param(value = "userId") Integer userId);
}
