package com.example.trip.controller;


import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Menu;
import com.example.trip.entity.Role;
import com.example.trip.service.MenuService;
import com.example.trip.service.RoleService;
import com.example.trip.utils.R;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 系统菜单表 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@RestController
@RequestMapping("/trip/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private RoleService roleService;

    @GetMapping("getAllMenu")
    public R getAllMenu(){
        List<Menu> menuList = menuService.getAllMenu();
        return R.ok().data("menuList", menuList);
    }

    @GetMapping("getMenuByRoleId")
    public R getMenuByRoleId(@ApiParam(name = "id", required = true) Integer id){
        Role one = roleService.lambdaQuery().eq(Role::getId, id).one();
        List<Menu> menuByRoleId = menuService.getMenuByRoleId(one.getMenuIds());
        return R.ok().data("menuTree", menuByRoleId);
    }
    @PostMapping("/addMenu")
    @ApiOperation(value = "添加菜单,pid = 0则添加一级菜单，否则添加子菜单")
    @LogAnnotation(module = "菜单",operator = "添加菜单")
    public R addMenu(@RequestBody Menu menu){
        menu.setSortFlag(menuService.getMaxSort()+1);
        if(menuService.save(menu)){
            return R.ok().message("菜单添加成功！");
        }else {
            return R.error().message("菜单添加失败！");
        }
    }

    @PostMapping("/editMenu")
    @ApiOperation(value = "修改菜单项")
//    @LogAnnotation(module = "菜单",operator = "修改菜单")
    public R editMenu(@RequestBody Menu menu){
        int result = menuService.editMenu(menu);
        if(result == 0){
            return R.error().message("当前菜单项修改失败！");
        }else {
            return R.ok().message("当前菜单修改成功！");
        }
    }

    @GetMapping("/delMenu")
    @ApiOperation(value = "删除当前菜单项，如果该菜单有子菜单则无法删除")
    @LogAnnotation(module = "菜单",operator = "删除菜单")
    public R delMenu(Integer id){

        List<Menu> menus = menuService.lambdaQuery().eq(Menu::getPid,id).list();
        if(menus.size() != 0){
            return R.error().message("当前菜单包含子菜单，无法删除！");
        }else {
            menuService.removeById(id);
            return R.ok().message("当前菜单删除成功！");
        }
    }

    @GetMapping("/upMenu")
    @ApiOperation(value = "将当前菜单的位置向上移动")
    @LogAnnotation(module = "菜单",operator = "菜单上移")
    @Transactional(rollbackFor = Exception.class)
    public R upMenu(Integer id){
        Menu currentMenu = menuService.lambdaQuery().eq(Menu::getId,id).one();
        //查找和当前菜单项处于同一级（pid相同）且sort_flag刚好比它小的菜单项
        Menu lesserMenu = menuService.getLesser(currentMenu.getSortFlag(),currentMenu.getPid());
        if(lesserMenu != null){
            menuService.updateSort(currentMenu.getId(),lesserMenu.getSortFlag());
            menuService.updateSort(lesserMenu.getId(),currentMenu.getSortFlag());
            return R.ok().message("当前菜单上移成功！");
        }else {
            return R.error().message("当前菜单已处于最顶层！");
        }
    }

    @GetMapping("/downMenu")
    @ApiOperation(value = "将当前菜单的位置向下移动")
    @LogAnnotation(module = "菜单",operator = "菜单下移")
    @Transactional(rollbackFor = Exception.class)
    public R downMenu(Integer id){
        Menu currentMenu = menuService.lambdaQuery().eq(Menu::getId,id).one();
        //查找和当前菜单项处于同一级（pid相同）且sort_flag刚好比它大的菜单项
        Menu biggerMenu = menuService.getBigger(currentMenu.getSortFlag(),currentMenu.getPid());
        if(biggerMenu != null){
            menuService.updateSort(currentMenu.getId(),biggerMenu.getSortFlag());
            menuService.updateSort(biggerMenu.getId(),currentMenu.getSortFlag());
            return R.ok().message("当前菜单下移成功！");
        }else {
            return R.error().message("当前菜单已处于最底层！");
        }
    }




}

