package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 系统角色表
 * </p>
 *
 * @author ${author}
 * @since 2022-04-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Role对象", description="系统角色表")
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "角色名称")
    private String roleName;

    @ApiModelProperty(value = "菜单id的集合")
    private String menuIds;

    @ApiModelProperty(value = "角色简介")
    private String introduce;

    @ApiModelProperty(value = "表示角色是否可注册，1：可以，0：不可以，默认可注册")
    private Integer isRegister;


}
