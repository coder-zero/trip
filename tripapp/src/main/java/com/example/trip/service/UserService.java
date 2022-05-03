package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface UserService extends IService<User> {
    int editUser(User user);
    int delUser(String ids);
    int editPass(User user);
    IPage<User> searchUser(Page<User> page, User user);
    int editAvatar(User user);
}
