package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Hotel;
import com.example.trip.entity.Room;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.trip.entity.RoomOrder;
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
public interface RoomMapper extends BaseMapper<Room> {


    @Update("update room set room_describe = #{roomDescribe}, room_type = #{roomType},  room_count = #{roomCount}, img_url = #{imgUrl}, room_price = #{roomPrice}, current_num=#{currentNum} where id = #{id}")
    public int editRoom(Room room);

    @Delete("<script>"+
            "delete t1 from room AS t1\n" +
            "<where>" +
            "t1.id in (${ids})"+
            "</where>"+"</script>")
    public int delRoom(String ids);

    @Select("<script>" +
            "select r.id, r.hotel_id, r.room_type, r.room_count, r.img_url, r.room_price, r.room_describe, r.current_num, r.user_id, ho.hotel_name from room r left join hotel ho on r.hotel_id = ho.id" +
            "<where> 1 = 1" +
            "<if test= \" room.hotelName != null and room.hotelName != '' \"> AND hotel_id in (select id from hotel h where h.hotel_name like concat('%',#{room.hotelName},'%'))</if>" +
            "<if test= \" room.id != null \"> AND r.id = #{room.id}</if>" +
            "</where>" +
            "</script>")
    public IPage<Room> searchRoom(@Param(value = "page") Page<Room> page, @Param(value = "room") Room room);

    @Update("update room set current_num=#{currentNum} where id=#{id}")
    public int updateRoomCurrentNum(Room room);

    @Select("<script>" +
            "select r.id, r.hotel_id, r.room_type, r.room_count, r.img_url, r.room_price, r.room_describe, r.current_num, r.user_id, ho.hotel_name from room r left join hotel ho on r.hotel_id = ho.id\n" +
            "where r.hotel_id=#{id}"+
            "</script>")
    public List<Room> getRoomByHotelById( @Param(value = "id") Integer id);



}
