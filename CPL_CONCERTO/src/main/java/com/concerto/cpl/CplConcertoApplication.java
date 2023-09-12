package com.concerto.cpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.concerto.cpl.dto.TeamDetailsDto;
import com.concerto.cpl.entity.Auction;
import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.entity.Team;
import com.concerto.cpl.repository.AuctionRepository;
import com.concerto.cpl.repository.CategoryRepository;
import com.concerto.cpl.repository.PlayerRepository;
import com.concerto.cpl.repository.TeamRespository;
import com.concerto.cpl.service.AuctionService;
import com.concerto.cpl.service.PlayerService;
import com.concerto.cpl.service.TeamService;

@SpringBootApplication
public class CplConcertoApplication {
	public static void main(String[] args) {
		SpringApplication.run(CplConcertoApplication.class, args);
	}
}
