package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 系统角色表 Mapper 接口
 * </p>
 */
@Repository
public interface RoleMapper extends BaseMapper<Role> {

    @Insert("insert into role (role_name,introduce) values (#{roleName},#{introduce})")
    int addRole(Role role);

    @Insert("update role set role_name = #{roleName},introduce = #{introduce} where id = #{id}")
    int editRole(Role role);

    @Update("update role set menu_ids = #{menuIds} where id = #{id}")
    int grantRole(Role role);

    @Update("update role set is_register = #{status} where id = #{id}")
    int editStatus(@Param(value = "id") Integer id,@Param(value = "status") Integer status);

    @Select({"<script>" +
            "select * from role" +
            "<where> 1 = 1" +
            "<if test = \" keyWord != null and  keyWord != '' \"> AND role_name like concat('%',#{keyWord},'%') </if>" +
            "</where>" +
            "</script>"})
    IPage<Role> searchRole(@Param(value = "page") Page<Role> page,@Param(value = "keyWord") String keyWord);
}
