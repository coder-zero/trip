package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_log")
@ApiModel(value="系统日志对象（Log）", description="系统操作生成的日志记录")
public class Log implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "执行的方法名称")
    private String methodName;

    @ApiModelProperty(value = "方法所在的类名")
    private String className;

    @ApiModelProperty(value = "自定义的模块名")
    private String module;

    @ApiModelProperty(value = "自定义的操作名")
    private String operator;

    @ApiModelProperty(value = "操作的时间")
    private Date recordDate;

    @ApiModelProperty(value = "执行的时间（毫秒）")
    private Integer executeTime;

    @ApiModelProperty(value = "执行的用户ip地址")
    private String ipAddress;

    @ApiModelProperty(value = "传递的参数")
    private String params;

    @ApiModelProperty(value = "操作用户的姓名")
    private String operateName;

    @ApiModelProperty(value = "操作的账户")
    private String operateAccount;

    @ApiModelProperty(value = "操作结果，0失败，1成功")
    private Integer operateResult;

    @ApiModelProperty(value = "查询条件的开始日期")
    @TableField(exist = false)
    private String startDate;

    @ApiModelProperty(value = "查询条件的结束日期")
    @TableField(exist = false)
    private String endDate;


}
