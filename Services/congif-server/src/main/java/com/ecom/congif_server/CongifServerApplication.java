package com.ecom.congif_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class CongifServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CongifServerApplication.class, args);
	}

}
