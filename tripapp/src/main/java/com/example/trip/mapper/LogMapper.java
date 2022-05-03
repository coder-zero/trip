package com.example.trip.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Log;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 */
@Repository
public interface LogMapper extends BaseMapper<Log> {

    @Delete("delete from sys_log where id in (${ids})")
    int delLog(String ids);

    @Delete("truncate table sys_log")
    void delAllLog();

    @Select("select * from sys_log order by record_date desc")
    List<Log> logExcelDownloads();

    @Select({"<script>" +
            "select * from sys_log" +
            "<where> 1 = 1" +
            "<if test = \" log.methodName != null and  log.methodName != '' \"> AND method_name like concat('%',#{log.methodName},'%') </if>" +
            "<if test = \" log.operateAccount != null and  log.operateAccount != '' \"> AND operate_account like concat('%',#{log.operateAccount},'%') </if>" +
            "<if test = \" log.operator != null and  log.operator != '' \"> AND operator like concat('%',#{log.operator},'%') </if>" +
            "<if test = \" log.module != null and  log.module != '' \"> AND module like concat('%',#{log.module},'%') </if>" +
            "<if test = \" log.startDate != null and  log.startDate != '' \"> AND record_date between #{log.startDate}  and #{log.endDate} </if>" +
            "</where>" +
            " order by record_date desc"+
            "</script>"})
    IPage<Log> searchLog(Page<Log> page, @Param(value = "log") Log log);
}
