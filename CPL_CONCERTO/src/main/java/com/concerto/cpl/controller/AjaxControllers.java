package com.concerto.cpl.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.cpl.dto.AuctionDataDto;
import com.concerto.cpl.dto.AuctionRequestDto;
import com.concerto.cpl.dto.CategoryAndPageDto;
import com.concerto.cpl.dto.PlayerDataDto;
import com.concerto.cpl.dto.ResponseData;
import com.concerto.cpl.entity.Auction;
import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.mapper.BeanMapper;
import com.concerto.cpl.service.AuctionMasterService;
import com.concerto.cpl.service.AuctionService;
import com.concerto.cpl.service.CategoryService;
import com.concerto.cpl.service.PlayerService;
import com.concerto.cpl.service.TeamService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class AjaxControllers {

	@Autowired
	TeamService teamService;
	@Autowired
	CategoryService categoryService;

	@Autowired
	PlayerService playerService;

	@Autowired
	AuctionMasterService auctionMasterService;

	@Autowired
	AuctionService auctionService;

	@GetMapping("/getteamnames")
	public @ResponseBody ResponseData<Object> getAllTeamName() {

		try {

			return new ResponseData<>(200, this.teamService.getAllTeamsName());
		} catch (EntityNotFoundException e) {
			return new ResponseData<>(401, "No Content Present");
		}

	}

	@PostMapping("/playerdata")
	public @ResponseBody Map<String, Object> getPlayerData(@RequestBody CategoryAndPageDto categoryAndPageDto) {
		Map<String, Object> map = new HashMap<>();
		try {
			Category category = this.categoryService.getCategoryByNameAndGrade(categoryAndPageDto.getCategoryName(),
					categoryAndPageDto.getCategoryGrade());
			System.out.println(category);
			map = this.playerService.getPlayerData(category, categoryAndPageDto.getPageNo(),categoryAndPageDto.getFilter());
			Player player = (Player) map.get("data");
			PlayerDataDto pdo=BeanMapper.convertPlayerTolayerDataDto(player);
			Integer max_Bid=(Integer)map.get("max_bid");
			Integer increaseby=(Integer)map.get("increase");
			pdo.setMaximum_bid(max_Bid);
			pdo.setIncreaseBy(increaseby);
			map.put("data", pdo);
			return map;
		} catch (Exception e) {
			map.put("statusCode", 401);
			return map;
		}
	}

	@PostMapping("/insertauctiondata")
	public @ResponseBody ResponseData<Object> addAuctionData(@RequestBody AuctionRequestDto auctionRequestDto,
			HttpSession session) {
		AuctionDataDto auctionDataDto = new AuctionDataDto();
		auctionDataDto.setAuctionMasterId(
				this.auctionMasterService.getAuctionIdByAuctionName((String) session.getAttribute("auction")));
		auctionDataDto.setTeamId(this.teamService.getTeamIdByTeamName(auctionRequestDto.getTeamName()));
		auctionDataDto.setPlayerId(this.playerService.getPlayerIdByPlayerName(auctionRequestDto.getPlayerName()));
		auctionDataDto.setSold(auctionRequestDto.isSold());
		auctionDataDto.setBidPrice(auctionRequestDto.getBidPrice());
		if (this.auctionService.insertAuctionData(auctionDataDto))
			return new ResponseData<>(200, "SUCCESS");
		return new ResponseData<>(401, "Failed");

	}

	@PostMapping("/getplayerbyname")
	public @ResponseBody ResponseData<Object> getPlayersByTeam(@RequestBody String ajaxTeamName) throws JsonProcessingException{
		
		
		JSONObject jsonObj = new JSONObject(ajaxTeamName);
		String teamName = jsonObj.getString("teamName");
	List<Player> players=this.auctionService.getAuctions(this.teamService.getTeamIdByTeamName(teamName))
		                    .stream()
		                    .map(Auction::getPlayerId)
		                    .map(pid->this.playerService.getPlayerById(pid))
		                    .collect(Collectors.toList());
	System.out.println(players);
	
		return new ResponseData<>(200, players);
		
		
		
	}
}
