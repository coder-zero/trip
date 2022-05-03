package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

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
@ApiModel(value="Comment对象", description="")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "留言人id")
    private Integer userId;

    @ApiModelProperty(value = "留言内容")
    private String commentContent;

    @ApiModelProperty(value = "留言时间")
    private Date createTime;

    @ApiModelProperty(value = "类型（0 为酒店 1为景点）")
    private Integer commentType;

    @ApiModelProperty(value = "所属评论的id")
    private Integer pid;

    @ApiModelProperty(value = "所属酒店或景点的id")
    private Integer belongId;

    @ApiModelProperty(value = "下一级留言")
    @TableField(exist = false)
    private List<Comment> children;

    @ApiModelProperty(value = "酒店的名字")
    @TableField(exist = false)
    private String hotelName;

    @ApiModelProperty(value = "景点的名字")
    @TableField(exist = false)
    private String spotName;

    @ApiModelProperty(value = "留言人姓名")
    @TableField(exist = false)
    private String commentName;

    @ApiModelProperty(value = "留言人头像")
    @TableField(exist = false)
    private String commentImg;

    @ApiModelProperty(value = "被留言人名称")
    @TableField(exist = false)
    private String replyName;

}
