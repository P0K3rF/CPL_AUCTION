package com.concerto.cpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.concerto.cpl.service.TeamService;

@SpringBootApplication
public class CplConcertoApplication {

	@Autowired
	TeamService service;
	
	
	public static void main(String[] args) {
		SpringApplication.run(CplConcertoApplication.class, args);
	}
	
	
	/*
	 * @Bean public void getData() {
	 * 
	 * this.service.getAllTeamsName().forEach(System.out::println);
	 * 
	 * }
	 */

}
