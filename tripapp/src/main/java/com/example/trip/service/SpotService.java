package com.example.trip.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Spot;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
public interface SpotService extends IService<Spot> {

    int editSpot(Spot spot);

    Spot getSpotById(Integer id);

    IPage<Spot> searchSpot(Page<Spot> page, Spot spot);

    int delSpot(String ids);

    List<Spot> getAllSpot(Spot spot);
}
