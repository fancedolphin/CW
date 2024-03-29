package com.example.schoolService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.support.DefaultBeanNameGenerator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@ComponentScan(nameGenerator = DefaultBeanNameGenerator.class)
@MapperScan(basePackages = {"com.example.schoolService.mapper"})
public class SchoolServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(SchoolServiceApplication.class, args);
    }

}
