package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="User对象", description="")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "角色id")
    private Integer roleId;

    @ApiModelProperty(value = "用户真实姓名")
    private String realName;

    @ApiModelProperty(value = "用户头像地址")
    private String imgUrl;

    @ApiModelProperty(value = "角色id对应的角色名称")
    @TableField(exist = false)
    private String roleName;

    @ApiModelProperty(value = "原密码，用来做修改密码的验证")
    @TableField(exist = false)
    private String oldPass;

}
