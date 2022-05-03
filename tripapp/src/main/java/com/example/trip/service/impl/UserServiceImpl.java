package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.User;
import com.example.trip.mapper.UserMapper;
import com.example.trip.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int editUser(User user) { return userMapper.editUser(user); }

    @Override
    public int delUser(String ids) { return userMapper.delUser(ids); }

    @Override
    public int editPass(User user) { return userMapper.editPass(user.getId(), user.getPassword());}

    @Override
    public IPage<User> searchUser(Page<User> page, User user) { return userMapper.searchUser(page, user);}

    @Override
    public int editAvatar(User user){
        return userMapper.editAvatar(user);
    }
}
