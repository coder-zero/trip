package com.example.trip.entity;

import java.math.BigDecimal;
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
@ApiModel(value="Room对象", description="")
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "酒店id")
    private Integer hotelId;

    @ApiModelProperty(value = "房间类型（0，1）")
    private Integer roomType;

    @ApiModelProperty(value = "房间数量")
    private Integer roomCount;

    @ApiModelProperty(value = "房间图像")
    private String imgUrl;

    @ApiModelProperty(value = "房间价格")
    private BigDecimal roomPrice;

    @ApiModelProperty(value = "房间描述")
    private String roomDescribe;

    @ApiModelProperty(value = "当前剩余房间的数量")
    private Integer currentNum;

    @ApiModelProperty(value = "发布人id")
    private Integer userId;

    @ApiModelProperty(value = "所属酒店名称")
    @TableField(exist = false)
    private String hotelName;



}
