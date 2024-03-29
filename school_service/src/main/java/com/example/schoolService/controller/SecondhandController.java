package com.example.schoolService.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.schoolService.Utils.AjaxResult;
import com.example.schoolService.domain.Secondhand;
import com.example.schoolService.domain.SecondhandHistory;
import com.example.schoolService.mapper.SecondhandHistoryMapper;
import com.example.schoolService.mapper.SecondhandMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/secondhand")
public class SecondhandController {
    @Resource
    private SecondhandMapper secondhandMapper;
    @Resource
    private SecondhandHistoryMapper secondhandHistoryMapper;
    @PostMapping("/insert")
    public AjaxResult insert(@RequestBody Secondhand secondhand){
        secondhand.setCreateTime(new Date());
        int insert = secondhandMapper.insert(secondhand);
        if (insert ==1){
            return AjaxResult.success("添加成功");
        }else {
            return AjaxResult.error("添加失败");

        }
    }
    @GetMapping("/delete")
    public AjaxResult delete(int id){
        Secondhand secondhand = secondhandMapper.selectById(id);
        SecondhandHistory secondhandHistory = new SecondhandHistory();
        BeanUtils.copyProperties(secondhand,secondhandHistory);
        int i = secondhandMapper.deleteById(id);
        int insert = secondhandHistoryMapper.insert(secondhandHistory);
        if (i ==1){
            return AjaxResult.success("删除成功");
        }else {
            return AjaxResult.error("删除失败");
        }
    }
    @GetMapping("/select")
    public AjaxResult select(String articleName,int pageNum,int pageSize){
        QueryWrapper<Secondhand> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(Secondhand::getArticleName,articleName);
        PageHelper.startPage(pageNum,pageSize);
        List<Secondhand> deliveries = secondhandMapper.selectList(queryWrapper);
        PageInfo<Secondhand> pageInfo = new PageInfo<>(deliveries);
        return AjaxResult.success(pageInfo);
    }

    @GetMapping("/selectHistory")
    public AjaxResult selectHistory(String articleName,int pageNum,int pageSize){
        QueryWrapper<SecondhandHistory> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(SecondhandHistory::getArticleName,articleName);
        PageHelper.startPage(pageNum,pageSize);
        List<SecondhandHistory> deliveries = secondhandHistoryMapper.selectList(queryWrapper);
        PageInfo<SecondhandHistory> pageInfo = new PageInfo<>(deliveries);
        return AjaxResult.success(pageInfo);
    }
}

