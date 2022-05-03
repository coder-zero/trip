package com.example.trip.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.Spot;
import com.example.trip.service.SpotService;
import com.example.trip.utils.R;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@RestController
@RequestMapping("/trip/spot")
public class SpotController {

    @Autowired
    private SpotService spotService;

    //添加景点信息
    @PostMapping("/insertSpot")
    @LogAnnotation(module = "景点",operator = "添加景点信息")
    public R insertSpot(@RequestBody Spot spot){
        if (spotService.save(spot)){
            return R.ok().message("添加景点成功");
        }else {
            return R.error().message("添加失败");
        }
    }
    //修改景点信息
    @PostMapping("/editSpot")
    @LogAnnotation(module = "景点",operator = "修改景点")
    public R editSpot(@RequestBody Spot spot){
        if (spotService.editSpot(spot) !=0){
            return R.ok().message("景点信息修改成功");
        }else {
            return R.error().message("景点信息修改失败");
        }
    }
//  通过id获取景点信息
    @GetMapping("/getSpotById")
    public R getSpotById(Integer id){
        Spot spotById = spotService.getSpotById(id);
        return R.ok().data("spotById", spotById);
    }
//  多条件分页查询
    @PostMapping("/searchSpot/{current}/{size}")
    public R searchSpot(@Param(value = "page") Page<Spot> page, @RequestBody Spot spot) {
        IPage<Spot> spotIPage = spotService.searchSpot(page, spot);
        return R.ok().data("spotIPage", spotIPage);
    }
//  批量删除景点信息
    @GetMapping("/delSpot")
    @LogAnnotation(module = "景点",operator = "删除景点")
    public R delSpot(String ids){
        int i = spotService.delSpot(ids);
        if (i != 0){
            return R.ok().data("i", i);
        }else {
            return R.ok().data("i", i);
        }
    }
//    获取全部景点
    @PostMapping("/getAllSpot")
    public R getAllSpot(@RequestBody Spot spot){
        List<Spot> allSpot = spotService.getAllSpot(spot);
        return R.ok().data("allSpot", allSpot);
    }
}

