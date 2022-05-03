package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Menu;
import com.example.trip.entity.Role;
import com.example.trip.entity.User;
import com.example.trip.service.MenuService;
import com.example.trip.service.RoleService;
import com.example.trip.service.UserService;
import com.example.trip.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 系统角色表 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/trip/role")
@Api(tags = "角色接口")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;


    @GetMapping("/getAllRole")
    @ApiOperation(value = "获取所有的角色信息")
//    @LogAnnotation(module = "角色",operator = "获取所有角色")
    public R getAllRole(){
        List<Role> roleList = roleService.lambdaQuery().list();
        return R.ok().data("roleList",roleList);
    }

    //通过角色id获取当前角色所拥有的菜单树
    @GetMapping("/getMenuTree")
    @ApiOperation(value = "通过角色获取菜单树")
    public R getMenuTree(@ApiParam(value = "角色id",name =  "id",required = true) int  id){
        Role r = roleService.lambdaQuery().eq(Role::getId,id).one();//通过角色id获取到当前的角色
        List<Menu> menuTree = menuService.getMenuTree(r.getMenuIds());
        return R.ok().data("menuTree",menuTree);
    }

    @PostMapping("/addRole")
    @ApiOperation(value = "新增一个角色信息")
    @LogAnnotation(module = "角色",operator = "新增角色")
    public R addRole(@RequestBody Role role){
        int result = roleService.addRole(role);
        if(result == 1){
            return R.ok().message("角色信息添加成功！");
        }else {
            return R.error().message("角色信息添加失败！");
        }
    }

    @PostMapping("/editRole")
    @ApiOperation(value = "修改角色信息")
    @LogAnnotation(module = "角色",operator = "修改角色")
    public R editRole(@RequestBody Role role){
        int result = roleService.editRole(role);
        if(result == 1){
            return R.ok().message("角色信息修改成功！");
        }else {
            return R.error().message("角色信息修改失败！");
        }
    }

    @GetMapping("/delRole")
    @ApiOperation(value = "删除角色信息")
    @LogAnnotation(module = "角色",operator = "删除角色")
    public R delRole(Integer id){
        List<User> users = userService.lambdaQuery().eq(User::getRoleId,id).list();
        if(users.size() == 0){
            roleService.removeById(id);
            return R.ok().message("该角色信息成功删除！");
        }else {
            return R.error().message("该角色下有账号信息，无法删除！");
        }
    }

    @GetMapping("/getRightsById")
    @ApiOperation(value = "通过角色id获取对应的权限数组")
    public R getRightsById(Integer id){
        String ids = roleService.lambdaQuery().eq(Role::getId,id).one().getMenuIds();
        if(ids == null || ids == ""){
            return R.ok().data("rights",new String[0]);
        }else{
            String[] rights = ids.split(",");
            return R.ok().data("rights",rights);
        }

    }

    @PostMapping("/grantRole")
    @ApiOperation(value = "给对应的角色进行授权")
    @LogAnnotation(module = "角色",operator = "角色授权")
    public R grantRole(@RequestBody Role role){
        int result = roleService.grantRole(role);
        if(result == 0){
            return R.error().message("角色授权失败！");
        }else {
            return R.ok().message("角色授权成功！");
        }
    }

    @GetMapping("/editStatus")
    @ApiOperation(value = "改变角色是否可注册的状态")
    @LogAnnotation(module = "角色",operator = "更改角色可注册状态")
    public R editStatus(Integer id){
        Role r = roleService.lambdaQuery().eq(Role::getId,id).one();
        int result;
        if(r.getIsRegister() == 1){
            result = roleService.editStatus(id,0);
        }else {
            result = roleService.editStatus(id,1);
        }
        if(result == 0){
            return R.error();
        }else {
            return R.ok();
        }
    }

    @PostMapping("/searchRole/{current}/{size}")
    @ApiOperation(value = "通过角色名称模糊查找角色信息，以分页返回")
    public R searchRole(Page<Role> page,@RequestBody Role r){
        IPage<Role> roleIPage = roleService.searchRole(page,r.getRoleName());
        return R.ok().data("roleIPage",roleIPage);
    }

}

