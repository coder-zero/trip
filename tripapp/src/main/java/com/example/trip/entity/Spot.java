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
@ApiModel(value="Spot对象", description="")
public class Spot implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "景点简述")
    private String spotDescribe;

    @ApiModelProperty(value = "景点名称")
    private String spotName;

    @ApiModelProperty(value = "景点地址")
    private String spotAddress;

    @ApiModelProperty(value = "景点价格")
    private BigDecimal spotPrice;

    @ApiModelProperty(value = "景点图像")
    private String imgUrl;

    @ApiModelProperty(value = "景点详述")
    private String spotContent;

    @ApiModelProperty(value = "发布人id")
    private Integer userId;

    @ApiModelProperty(value = "发布人昵称")
    @TableField(exist = false)
    private String realName;

}
