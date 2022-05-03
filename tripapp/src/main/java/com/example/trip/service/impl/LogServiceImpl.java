package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.trip.entity.Log;
import com.example.trip.mapper.LogMapper;
import com.example.trip.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

    @Autowired
    private LogMapper logMapper;

    public int delLog(String ids){
        return logMapper.delLog(ids);
    }

    public void delAllLog(){
         logMapper.delAllLog();
    }

    public List<Log> logExcelDownloads(){
        return logMapper.logExcelDownloads();
    }

    public IPage<Log> searchLog(Page<Log> page, Log log){
        return logMapper.searchLog(page,log);
    }
}
