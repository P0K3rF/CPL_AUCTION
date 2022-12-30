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

	@Autowired
	TeamService respository;
	
	@Autowired
	PlayerRepository playerRepository;

	public static void main(String[] args) {
		SpringApplication.run(CplConcertoApplication.class, args);
	}

	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	AuctionRepository auctionRepository;
	
		  @Bean
	  
	  public void getData() throws ParseException {
	  
//			  this.playerService.getPlayerListByTeamId("1").forEach(System.out::println);
		
			
			  
//		  System.out.println(playerRepository.findByPlayerName("Vishal Utekar"));
			  
//			  System.out.println(this.auctionRepository.findBidPriceByPlayerId(101235));
			  
			  
//	  for(int i=1;i<9;i++) {
//		  this.respository.save(new Team(i, "Team"+i, "team"+i+".jpg", null));
//	  }
		  
//		  Category category=new Category();
//		  category.setCategoryId(4);
//		  this.playerRepository.findPlayerByCategory(category).forEach(System.out::println);
//		  
//		  java.util.Date d = new SimpleDateFormat("yyyy-MM-dd").parse(LocalDate.of(1996,04,10).toString());
//		  
//		  Player player=new Player(1011,"Umesh Yadav",d,null,"Righ-hand-Batsman",null,"2016","4000",null,null,"130",category,"umeshyadav.jpg");
//	  this.playerRepository.save(player);
		  
		  
//		 List<Category> categories= this.categoryRepository.findByCategoryNameAndGrade("Batsman", "A");
		 
//		Pageable page=PageRequest.of(0, 1);
//		Category category=new Category();
//		category.setCategoryId(5);
//		int playerCount=this.auctionRepository.checkForUnsoldPlayer(1003);
//		if(playerCount<0) {
//			
//		}
//		System.out.println();
		
		
//	System.out.println(this.playerService.getPlayerData(category, 0));
		
		//		 System.out.println(this.categoryRepository.findByCategoryNameAndGrade("Batsman", "A", page).getContent()); 
//		System.out.println(this.playerRepository.findPlayerByCategory(category, page).getTotalElements());
//		
		
//		System.out.println(this.categoryRepository.findCategoryIdByCategoryNameAndGrade("Batsman", "A"));
//		 try {
//System.out.println(this.playerService.getPlayerData(category, 2));
//		 }catch(EntityNotFoundException e) {
//			 System.out.println("No Player Found");
//		 }
		
		
//		int a=this.categoryRepository.findCategoryIdByCategoryNameAndGrade("All Rounder", "A+");
//		 System.out.println(a);
//		  for(Category c:categories) {
////			  System.out.println(c);
//			  for(Player p:c.getPlayers())
//			  {
//				  player.add(p);
//			  }
//		  }
//		  player.forEach(System.out::println);
			  
//		this.playerService.getPlayerData(category, 3);
	 }
	 

}
