package com.example.schoolService.domain;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class SecondhandHistory {
    private int id;
    private String studentNumber;
    private String studentName;
    private String studentAge;
    private String studentTel;
    private String studentSex;
    private String articleName;
    private String picture;
    private String articleDescribe;
    private BigDecimal price;
    private Date createTime;
}
