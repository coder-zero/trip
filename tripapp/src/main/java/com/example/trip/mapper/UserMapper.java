package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Repository
public interface UserMapper extends BaseMapper<User> {

    @Update("update user set username = #{username},real_name=#{realName}, role_id = #{roleId} where id = #{id}")
    int editUser (User user);

    @Delete("delete from user where id = #{ids}")
    int delUser (String ids);

    @Update("update user set password = #{password} where id =#{id}")
    int editPass(@Param(value = "id") int id, @Param(value = "password") String password);

    //    当满足test条件时，才会将<if>标签内的SQL语句拼接上去
    @Select({"<script>"+
            "select *, r.role_name from user u LeFT JOIN role r ON u.role_id = r.id"+
            "<where> 1=1" +
            " <if test= \" user.username != null and user.username != '' \"> AND u.username like concat('%',#{user.username},'%') </if>" +
            "</where>"
            +"</script>"})
    IPage<User> searchUser(Page<User> page, @Param(value = "user") User user);


    @Update("update user set img_url = #{imgUrl} where id = #{id}")
    int editAvatar(User user);


}
