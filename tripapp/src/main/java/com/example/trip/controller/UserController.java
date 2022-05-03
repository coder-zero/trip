package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Comment;
import com.example.trip.entity.RoomOrder;
import com.example.trip.entity.User;
import com.example.trip.service.CommentService;
import com.example.trip.service.RoomOrderService;
import com.example.trip.service.UserService;
import com.example.trip.utils.R;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@RestController
@RequestMapping("/trip/user")
//日志输出
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoomOrderService roomOrderService;
    @Autowired
    private CommentService commentService;

    private User currentUser;

//    用户注册
    @PostMapping("/register")
    @LogAnnotation(module = "用户",operator = "注册")
    public R register(@RequestBody User user){
        User u = userService.lambdaQuery().eq(User::getUsername, user.getUsername()).one();
        if (u == null){
            user.setPassword(DigestUtils.md5Hex(user.getPassword()));
            if (userService.save(user)){
                return R.ok().message("用户注册成功");
            }else {
                return R.error().message("用户注册失败");
            }
        }else{
            return R.error().message("当前用户名已存在");
        }
    }

//    用户登录
    @PostMapping("/login")
    @LogAnnotation(module = "用户",operator = "登录")
    public R login(@RequestBody User user){
        System.out.println(user);
        User u = userService.lambdaQuery().eq(User::getUsername, user.getUsername()).
                eq(User::getPassword, DigestUtils.md5Hex(user.getPassword()))
                .eq(User::getRoleId, user.getRoleId()).one();
        currentUser = u;

        if (u != null){
            return R.ok().message("登录成功");
        }else {
            return R.error().message("用户名或密码错误，登录失败");
        }
    }

//    获取当前用户
    @GetMapping("/getCurrentUser")
    public R getCurrentUser(){
        return R.ok().data("user",currentUser);
    }

//    修改用户信息
    @PostMapping("/editUser")
    @LogAnnotation(module = "用户",operator = "修改信息")
    public R editUser(@RequestBody User user){
        User u = userService.lambdaQuery().eq(User::getUsername, user.getUsername())
                .eq(User::getPassword, user.getPassword()).eq(User::getRoleId, user.getRoleId()).one();
        if (u == null){
            if (userService.editUser(user) != 0){
                return R.ok().message("修改成功");
            }else {
                return R.error().message("修改失败");
            }
        }else {
            return R.error().message("该用户名存在");
        }
    }

//    修改用户密码
    @PostMapping("/editPassword")
    @LogAnnotation(module = "用户",operator = "修改密码")
    public R editPassword(@RequestBody User user){
        User u = userService.lambdaQuery().eq(User::getId, user.getId())
                .eq(User::getPassword, DigestUtils.md5Hex(user.getOldPass())).one();
        if (u != null){
            user.setPassword(DigestUtils.md5Hex(user.getPassword()));
            if (userService.editPass(user) != 0){
                return R.ok().message("修改成功，请重新登录");
            }else {
                return R.error().message("修改失败，请重新登录");
            }
        }else {
            return R.error().message("原始密码错误");
        }
    }
//    分页查询用户信息
    @PostMapping("/searchUser/{current}/{size}")
    public R searchUser(@Param("page") Page<User> page, @RequestBody User user){
        IPage<User> userIPage = userService.searchUser(page, user);
        return R.ok().data("userIPage", userIPage);
    }


//    批量删除 同时删除留言订单
    @GetMapping("/delUser")
    @LogAnnotation(module = "用户",operator = "批量删除 同时删除留言订单")
    public R delUser(String ids){
        String[] split = ids.split(",");
        int res1 = 0;
        for (int i=0; i<split.length; i++){
            List<Comment> list = commentService.lambdaQuery().eq(Comment::getUserId, Integer.parseInt(split[i])).list();
            List<RoomOrder> list1 = roomOrderService.lambdaQuery().eq(RoomOrder::getUserId, Integer.parseInt(split[i])).list();
            if (list.size() == 0 && list1.size() ==0){
                userService.removeById(Integer.parseInt(split[i]));
                res1++;
            }
        }
        return R.ok().data("result",res1);
    }

    @PostMapping("/editAvatar")
    @ApiOperation(value = "修改用户头像")
    public R editAvatar(@RequestBody User user){
        if(userService.editAvatar(user) != 0){
            return R.ok().message("头像修改成功,重新登录后生效！");
        }else {
            return R.error().message("用户头像修改失败！");
        }
    }
}



