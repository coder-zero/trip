package com.example.trip.service;

import com.example.trip.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 系统菜单表 服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface MenuService extends IService<Menu> {

    List<Menu> getMenuTree(String ids);
    List<Menu> getAllMenu();
    List<Menu> getMenuByRoleId(String ids);
    int editMenu(Menu menu);

    int getMaxSort();

    Menu getBigger(Integer sortFlag, Integer pid);

    Menu getLesser(Integer sortFlag, Integer pid);

    void updateSort(Integer id, Integer sortFlag);

}
