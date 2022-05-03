package com.example.trip.service.impl;

import com.example.trip.entity.Menu;
import com.example.trip.mapper.MenuMapper;
import com.example.trip.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 系统菜单表 服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

//    通过递归getChildren 获取完整菜单
    public List<Menu> getAllMenu(){
        List<Menu> parent = menuMapper.getMenuListById(0);
        if (parent != null){
            getChildrenToAllMenu(parent);
            return parent;
        }else {
            return null;
        }
    }

    public void getChildrenToAllMenu(List<Menu> parent){
        for (Menu menu:parent){
            List<Menu> menuListById = menuMapper.getMenuListById(menu.getId());
            if (menuListById != null){
                menu.setChildren(menuListById);
                getChildrenToAllMenu(menuListById);
            }
        }
    }

    public List<Menu> getMenuByRoleId(String ids){
        if(ids == "" || ids ==null){
            return null;
        }else {
//        Arrays.asList将数组转化为list
            String[] split = ids.split(",");
            List<String> idList = Arrays.asList(split);
            List<Menu> parent = menuMapper.getMenuByRoleId(idList, 0);
            if (parent != null){
                getChildrenMenuByRoleId(parent, idList);
                return parent;
            }else {
                return null;
            }
        }
    }
    public void getChildrenMenuByRoleId(List<Menu> parent, List<String> idList){
        for (Menu menu:parent){
            List<Menu> children = menuMapper.getMenuByRoleId(idList, menu.getId());
            if (children !=null){
                menu.setChildren(children);
                getChildrenMenuByRoleId(children, idList);
            }
        }
    }

    public List<Menu> getMenuTree(String ids){
        if(ids == null||ids == ""){
            return null;
        }
//        Arrays.asList将数组转化为list
        String[] str= ids.split(",");
        List<String> idList = Arrays.asList(str);
        List<Menu> firstMenu = menuMapper.getMenuList(idList,0);//获取当前菜单集合中的一级菜单
        getChildren(firstMenu,idList);//通过递归方法填充子菜单
        return firstMenu;
    }
    public void getChildren(List<Menu> parent,List<String> idList){
        for (Menu m:parent) {
            List<Menu> children = menuMapper.getMenuList(idList,m.getId());//获取当前菜单节点的所有子菜单
            if(children != null){
                m.setChildren(children);
                getChildren(children,idList);
            }

        }
    }
    public int editMenu(Menu menu){
        return menuMapper.editMenu(menu);
    }

    public void setChildren(List<Menu> parent){
        for(Menu m:parent){
            List<Menu> child = menuMapper.getMenuListByPid(m.getId());//当前m节点下的所有子节点
            if(child != null){
                m.setChildren(child);
                setChildren(child);
            }

        }
    }

    //获取当前排序中最大值
    public int getMaxSort(){
        return menuMapper.getMaxSort();
    }

    public Menu getBigger(Integer sortFlag, Integer pid){
        return menuMapper.getBigger(sortFlag,pid);
    }

    public Menu getLesser(Integer sortFlag, Integer pid){
        return menuMapper.getLesser(sortFlag,pid);
    }

    public void updateSort(Integer id, Integer sortFlag){
        menuMapper.updateSort(id,sortFlag);
    }

}
