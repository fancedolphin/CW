package com.example.schoolService.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.schoolService.domain.Delivery;
import com.example.schoolService.domain.DeliveryHistory;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryHistoryMapper extends BaseMapper<DeliveryHistory> {
}
