package com.xhu.computermall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@ServletComponentScan
@MapperScan("com.xhu.computermall.dao")
public class MallApplication {

	public static void main(String[] args) {
		SpringApplication.run(MallApplication.class, args);
	}
}
