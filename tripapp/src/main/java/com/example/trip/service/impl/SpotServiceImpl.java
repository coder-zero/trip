package com.example.trip.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.Spot;
import com.example.trip.mapper.SpotMapper;
import com.example.trip.service.SpotService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2022-04-08
 */
@Service
public class SpotServiceImpl extends ServiceImpl<SpotMapper, Spot> implements SpotService {

    @Autowired
    private SpotMapper spotMapper;

    public int editSpot(Spot spot){return spotMapper.editSpot(spot);}

    public Spot getSpotById(Integer id){ return spotMapper.getSpotById(id);}

    public IPage<Spot> searchSpot(Page<Spot> page, Spot spot){return spotMapper.searchSpot(page, spot);}

    public int delSpot(String ids){return spotMapper.delSpot(ids);}

    @Override
    public List<Spot> getAllSpot(Spot spot) { return spotMapper.getAllSpot(spot);}
}
