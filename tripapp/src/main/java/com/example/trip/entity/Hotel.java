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
 * 
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Hotel对象", description="")
public class Hotel implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "酒店简述")
    private String hotelDescribe;

    @ApiModelProperty(value = "酒店名称")
    private String hotelName;

    @ApiModelProperty(value = "酒店地址")
    private String hotelAddress;

    @ApiModelProperty(value = "联系电话")
    private String hotelPhone;

    @ApiModelProperty(value = "标题图像")
    private String imgUrl;

    @ApiModelProperty(value = "酒店详情页")
    private String hotelContent;

    @ApiModelProperty(value = "发布人id")
    private Integer userId;

    @ApiModelProperty(value = "下属房间")
    @TableField(exist = false)
    private List<Room> roomList;

    @ApiModelProperty(value = "发布人昵称")
    @TableField(exist = false)
    private String realName;


}
