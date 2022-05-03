package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Role;
import com.example.trip.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 系统角色表 服务类
 * </p>
 *
 */
public interface RoleService extends IService<Role> {


    int addRole(Role role);

    int editRole(Role role);

    int grantRole(Role role);

    int editStatus(Integer id,Integer status);

    IPage<Role> searchRole(Page<Role> page, String keyWord);
}
