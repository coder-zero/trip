package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Role;
import com.example.trip.mapper.RoleMapper;
import com.example.trip.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统角色表 服务实现类
 * </p>
 *
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public int addRole(Role role){
        return roleMapper.addRole(role);
    }

    @Override
    public int editRole(Role role){
        return roleMapper.editRole(role);
    }

    @Override
    public int grantRole(Role role){
        return roleMapper.grantRole(role);
    }

    @Override
    public int editStatus(Integer id,Integer status){
        return roleMapper.editStatus(id,status);
    }

    @Override
    public IPage<Role> searchRole(Page<Role> page, String keyWord){
        return roleMapper.searchRole(page,keyWord);
    }
}
