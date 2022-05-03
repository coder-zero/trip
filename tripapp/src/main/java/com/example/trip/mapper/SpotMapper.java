package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Spot;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.trip.utils.R;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

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
public interface SpotMapper extends BaseMapper<Spot> {

    @Update("update spot set spot_describe = #{spotDescribe}, spot_name = #{spotName}, spot_address = #{spotAddress}, spot_price = #{spotPrice}, img_url = #{imgUrl}, spot_content = #{spotContent} where id = #{id} ")
    int editSpot(Spot spot);

    @Select("select * from spot where id = #{id}")
    Spot getSpotById(Integer id);

    @Select("<script>"+
            "select *, u.real_name from spot s left join user u on s.user_id = u.id"+
            "<where> 1=1"+
            " <if test= \" spot.spotName != null and spot.spotName != '' \"> AND s.spot_name like concat('%',#{spot.spotName},'%') </if>"+
            " <if test= \" spot.spotAddress != null and spot.spotAddress != '' \"> AND s.spot_address like concat('%',#{spot.spotAddress},'%') </if>"
            +"</where>"
            +"</script>")
    IPage<Spot> searchSpot(Page<Spot> page, @Param(value = "spot") Spot spot);

    @Delete("delete s,c from spot s left join comment c on s.id = c.belong_id where s.id in (${ids})")
    int delSpot(String ids);

    @Select("<script>"+
            "select * from spot s"+
            "<where> 1=1"+
            " <if test= \" spot.spotName != null and spot.spotName != '' \"> AND s.spot_name like concat('%',#{spot.spotName},'%') </if>"+
            " <if test= \" spot.spotAddress != null and spot.spotAddress != '' \"> AND s.spot_address like concat('%',#{spot.spotAddress},'%') </if>"
            +"</where>"
            +"</script>")
    public List<Spot> getAllSpot(@Param(value = "spot") Spot spot);
}
