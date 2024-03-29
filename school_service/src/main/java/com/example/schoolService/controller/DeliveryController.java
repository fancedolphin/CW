package com.example.schoolService.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.schoolService.Utils.AjaxResult;
import com.example.schoolService.domain.Delivery;
import com.example.schoolService.domain.DeliveryHistory;
import com.example.schoolService.mapper.DeliveryHistoryMapper;
import com.example.schoolService.mapper.DeliveryMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/delivery")
public class DeliveryController {
    @Resource
    private DeliveryMapper deliveryMapper;
    @Resource
    private DeliveryHistoryMapper deliveryHistoryMapper;
    @PostMapping("/insert")
    public AjaxResult insert(@RequestBody Delivery delivery){
        delivery.setCreateTime(new Date());
        int insert = deliveryMapper.insert(delivery);
        if (insert ==1){
            return AjaxResult.success("添加成功");
        }else {
            return AjaxResult.error("添加失败");

        }
    }
    @GetMapping("/delete")
    public AjaxResult delete(int id){
        Delivery delivery = deliveryMapper.selectById(id);
        DeliveryHistory deliveryHistory = new DeliveryHistory();
        BeanUtils.copyProperties(delivery,deliveryHistory);
        int i = deliveryMapper.deleteById(id);
        int insert = deliveryHistoryMapper.insert(deliveryHistory);
        if (i ==1){
            return AjaxResult.success("删除成功");
        }else {
            return AjaxResult.error("删除失败");
        }
    }
    @GetMapping("/select")
    public AjaxResult select(String articleName,int pageNum,int pageSize){
        QueryWrapper<Delivery> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(Delivery::getArticleName,articleName);
        PageHelper.startPage(pageNum,pageSize);
        List<Delivery> deliveries = deliveryMapper.selectList(queryWrapper);
        PageInfo<Delivery> pageInfo = new PageInfo<>(deliveries);
        return AjaxResult.success(pageInfo);
    }

    @GetMapping("/selectHistory")
    public AjaxResult selectHistory(String articleName,int pageNum,int pageSize){
        QueryWrapper<DeliveryHistory> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(DeliveryHistory::getArticleName,articleName);
        PageHelper.startPage(pageNum,pageSize);
        List<DeliveryHistory> deliveries = deliveryHistoryMapper.selectList(queryWrapper);
        PageInfo<DeliveryHistory> pageInfo = new PageInfo<>(deliveries);
        return AjaxResult.success(pageInfo);
    }
}
