package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 系统菜单表
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Menu对象", description="系统菜单表")
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单表id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    @ApiModelProperty(value = "菜单指向的地址")
    private String menuPath;

    @ApiModelProperty(value = "菜单对应的图标")
    private String icon;

    @ApiModelProperty(value = "菜单的父节点id，一级菜单pid为0")
    private Integer pid;

    @ApiModelProperty(value = "菜单功能说明")
    private String introduce;

    @ApiModelProperty(value = "菜单位置之间的排序")
    private Integer sortFlag;

    @ApiModelProperty(value = "子菜单")
    @TableField(exist = false)
    private List<Menu> Children;


}
