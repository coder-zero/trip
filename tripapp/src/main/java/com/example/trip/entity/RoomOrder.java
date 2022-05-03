package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

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
@ApiModel(value="RoomOrder对象", description="")
public class RoomOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "房间id")
    private Integer roomId;

    @ApiModelProperty(value = "用户id")
    private Integer userId;

    @ApiModelProperty(value = "入住时间")
    private Date startTime;

    @ApiModelProperty(value = "退房时间")
    private Date endTime;

    @ApiModelProperty(value = "退房时间")
    private Integer hotelId;

    @ApiModelProperty(value = "是否接受")
    private Integer isAccept;

    @ApiModelProperty(value = "所属酒店名称")
    @TableField(exist = false)
    private String hotelName;

    @ApiModelProperty(value = "房间类型")
    @TableField(exist = false)
    private Integer roomType;

    @ApiModelProperty(value = "房间价格")
    @TableField(exist = false)
    private String roomPrice;

    @ApiModelProperty(value = "用户名")
    @TableField(exist = false)
    private String username;

    @ApiModelProperty(value = "用户真实名")
    @TableField(exist = false)
    private String realName;


}
