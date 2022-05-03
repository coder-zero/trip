package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Log;
import com.example.trip.service.LogService;
import com.example.trip.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 */
@RestController
@RequestMapping("/trip/log")
@Api(tags = "日志接口")
public class LogController {

    @Autowired
    private LogService logService;

    @GetMapping("/delLog")
    @ApiOperation(value = "批量删除系统日志")
    public R delLog(String ids){
        int result = logService.delLog(ids);
        if(result != 0){
            return R.ok().data("result",result);
        }else {
            return R.error().data("result",0);
        }
    }

    @GetMapping("/delAllLog")
    @ApiOperation(value = "删除所有系统日志")
    public R delAllLog(){
        logService.delAllLog();
        return R.ok();
    }

    @PostMapping("/searchLog/{current}/{size}")
    @ApiOperation(value = "通过查询条件模糊查找系统日志，以分页返回")
    public R searchLog(Page<Log> page,@RequestBody Log log){
        IPage<Log> logIPage = logService.searchLog(page,log);
        return R.ok().data("logIPage",logIPage);
    }

    @GetMapping("/downLogExcel")
    @ApiOperation(value = "导出系统日志到excel文件中")
    public void LogExcelDownloads(HttpServletResponse response)throws IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("日志表");
        List<Log> logExcelList = logService.logExcelDownloads();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        String fileName = "系统操作日志-"+dateFormat.format(date) + ".xls";
        int rowNum = 1;
        String [] headers = {"模块","操作","方法名","所在类","参数","操作时间","执行时间","操作账号","结果"};
        HSSFRow row = sheet.createRow(0);
        for (int i = 0;i<headers.length;i++){
            HSSFCell cell = row.createCell((short) i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        for (Log log : logExcelList){
            HSSFRow row1 = sheet.createRow(rowNum);
            row1.createCell((short) 0).setCellValue(new HSSFRichTextString(log.getModule()));
            row1.createCell((short) 1).setCellValue(new HSSFRichTextString(log.getOperator()));
            row1.createCell((short) 2).setCellValue(new HSSFRichTextString(log.getMethodName()));
            row1.createCell((short) 3).setCellValue(new HSSFRichTextString(log.getClassName()));
            row1.createCell((short) 4).setCellValue(new HSSFRichTextString(log.getParams()));
            row1.createCell((short) 5).setCellValue(new HSSFRichTextString(simpleDateFormat.format(log.getRecordDate())));
            row1.createCell((short) 6).setCellValue(new HSSFRichTextString(log.getExecuteTime().toString()+"毫秒"));
            row1.createCell((short) 7).setCellValue(new HSSFRichTextString((log.getOperateAccount() == null||log.getOperateAccount() == "")?"未登录":log.getOperateAccount()));
            row1.createCell((short) 8).setCellValue(new HSSFRichTextString(log.getOperateResult() == 1?"成功":"失败"));
            rowNum++;

        }
        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment;filename=" + new String(fileName.getBytes(StandardCharsets.UTF_8),"ISO8859-1"));
        response.flushBuffer();
        workbook.write(response.getOutputStream());
//        return R.ok();
    }



}

