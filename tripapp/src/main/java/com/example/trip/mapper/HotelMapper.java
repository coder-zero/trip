package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Hotel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

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
public interface HotelMapper extends BaseMapper<Hotel> {

    @Delete("<script>"+
            "delete t1,t2,t3,t4 from hotel AS t1\n" +
            "LEFT JOIN room AS t2 ON t1.id = t2.hotel_id\n" +
            "LEFT JOIN room_order AS t3 ON t1.id = t3.hotel_id\n" +
            "LEFT JOIN comment AS t4 ON t1.id = t4.belong_id\n" +
            "<where>" +
            "t1.id in (${ids})"+
    "</where>"+"</script>")
    public int delHotel(String ids);

    @Update("update hotel set hotel_describe = #{hotelDescribe}, hotel_name = #{hotelName}, hotel_address = #{hotelAddress}, hotel_phone = #{hotelPhone}, img_url = #{imgUrl}, hotel_content = #{hotelContent} where id = #{id}")
    public int editHotel(Hotel hotel);

    @Select("<script>" +
            "select *, u.real_name from hotel h left join user u on h.user_id = u.id" +
            "<where> 1 = 1" +
            " <if test= \" hotel.hotelName != null and hotel.hotelName != '' \"> AND h.hotel_name like concat('%',#{hotel.hotelName},'%') </if>"+
            " <if test= \" hotel.hotelAddress != null and hotel.hotelAddress != '' \"> AND h.hotel_address like concat('%',#{hotel.hotelAddress},'%') </if>"+
            "</where>" +
            "</script>")
    public IPage<Hotel> searchHotel(@Param(value = "page") Page<Hotel> page, @Param(value = "hotel") Hotel hotel);

    @Select("select id, hotel_name from hotel")
    public List<Hotel> getAllHotel();

    @Select("<script>" +
            "select * from hotel h" +
            "<where> 1 = 1" +
            " <if test= \" hotel.hotelName != null and hotel.hotelName != '' \"> AND h.hotel_name like concat('%',#{hotel.hotelName},'%') </if>"+
            " <if test= \" hotel.hotelAddress != null and hotel.hotelAddress != '' \"> AND h.hotel_address like concat('%',#{hotel.hotelAddress},'%') </if>"+
            "</where>" +
            "</script>")
    public List<Hotel> getAllHotelAndRoom(@Param(value = "hotel") Hotel hotel);
}
