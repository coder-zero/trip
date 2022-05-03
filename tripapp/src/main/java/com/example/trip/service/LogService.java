package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.trip.entity.Log;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 */
public interface LogService extends IService<Log> {

    int delLog(String ids);

    void delAllLog();

    List<Log> logExcelDownloads();

    IPage<Log> searchLog(Page<Log> page, Log log);
}
