package com.example.schoolService.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.schoolService.domain.Secondhand;
import com.example.schoolService.domain.SecondhandHistory;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecondhandHistoryMapper extends BaseMapper<SecondhandHistory> {

}
