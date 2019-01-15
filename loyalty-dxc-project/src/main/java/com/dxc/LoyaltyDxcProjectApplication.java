package com.dxc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dxc.repository.ProductRepository;

@SpringBootApplication(scanBasePackages = "com.dxc")
@ComponentScan
@EnableAutoConfiguration
public class LoyaltyDxcProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(LoyaltyDxcProjectApplication.class, args);
	}
	
}

