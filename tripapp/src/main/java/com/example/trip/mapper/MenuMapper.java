package com.example.trip.mapper;

import com.example.trip.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 系统菜单表 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

    @Select("select * from menu where pid  = #{pid} order by sort_flag")
    List<Menu> getMenuListById(Integer pid);

    @Select("<script>" +
            "select * from menu m where m.id in"+
            "<foreach collection=\"idList\" item=\"id\" open=\"(\" separator=\",\" close=\")\" >"+
            "#{id}" +
            "</foreach>"+
            "and m.pid = #{pid} order by sort_flag"
            +"</script>")
    List<Menu> getMenuByRoleId(@Param("idList") List<String> idList, @Param("pid") Integer pid);


    @Select({"<script>",
            "select * from menu where id in ",
            "<foreach collection=\"idList\" item=\"id\" index=\"index\" open=\"(\" separator=\",\" close=\")\">",
            "#{id}",
            "</foreach>",
            " and pid = #{pid} order by sort_flag",
            "</script>"})
    List<Menu> getMenuList(@Param("idList") List<String > idList, @Param("pid") int pid);

    @Select("select * from menu where pid = #{pid} order by sort_flag")
    List<Menu> getMenuListByPid(int pid);

    @Update("update menu set menu_name = #{menuName},menu_path = #{menuPath},icon = #{icon},introduce = #{introduce} where id = #{id}")
    int editMenu(Menu menu);

    @Select("select MAX(sort_flag) from menu")
    int getMaxSort();

    @Select("select * from menu where sort_flag > #{sortFlag} and pid = #{pid} order by sort_flag limit 0,1")
    Menu getBigger(@Param(value = "sortFlag") Integer sortFlag,@Param(value = "pid") Integer pid);

    @Select("select * from menu where sort_flag < #{sortFlag} and pid = #{pid} order by sort_flag DESC limit 0,1")
    Menu getLesser(@Param(value = "sortFlag") Integer sortFlag,@Param(value = "pid") Integer pid);

    @Update("update menu set sort_flag = #{sortFlag} where id = #{id}")
    void updateSort(@Param(value = "id") Integer id,@Param(value = "sortFlag") Integer sortFlag);
}
