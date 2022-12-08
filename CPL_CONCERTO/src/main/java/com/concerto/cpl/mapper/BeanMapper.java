package com.concerto.cpl.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.annotation.Scope;

import com.concerto.cpl.dto.AuctionDataDto;
import com.concerto.cpl.dto.PlayerDataDto;
import com.concerto.cpl.dto.PlayerDetailsInTeamDto;
import com.concerto.cpl.dto.PlayerResponseDto;
import com.concerto.cpl.entity.Auction;
import com.concerto.cpl.entity.Player;

@Scope
public class BeanMapper {
	private BeanMapper() {
		
	}
		
	public static PlayerDataDto convertPlayerTolayerDataDto(Player player) {
		PlayerDataDto	playerDataDto=new PlayerDataDto();
		playerDataDto.setPlayerName(player.getPlayerName());
		

		Date d= player.getPlayerDOB();
	
		SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy");// FOrmat in This Format or you change Change as well 
		String formats= format.format(d);
		playerDataDto.setPlayerDOB(formats);
		playerDataDto.setPlayerDebut(player.getPlayerDebut());
		playerDataDto.setMinimumBid(player.getCategory().getMinimumBid());
		playerDataDto.setPlayerPhoto(player.getPlayerPhoto());
		playerDataDto.setPlayerBatStyle(player.getPlayerBatStyle());
		playerDataDto.setPlayerRuns(player.getPlayerRuns());
		playerDataDto.setPlayerStrikeRate(player.getPlayerStrikeRate());
		playerDataDto.setPlayerBallStyle(player.getPlayerBallStyle());
		playerDataDto.setPlayerBallEconomy(player.getPlayerBallEconomy());
		playerDataDto.setPlayertotalWickets(player.getPlayertotalWickets());
		playerDataDto.setFifties(player.getFifties());
		playerDataDto.setHundreds(player.getHundreds());
		playerDataDto.setBestOver(player.getBestOver());
		playerDataDto.setHighestRuns(player.getHighestRuns());
		return playerDataDto;
	}
	
	
	
	public static Auction convertAuctionDataDtoToAuction(AuctionDataDto auctionDataDto) {
		Auction auction=new Auction();
		auction.setAuctionMasterId(auctionDataDto.getAuctionMasterId());
		auction.setPlayerId(auctionDataDto.getPlayerId());
		auction.setBidPrice(auctionDataDto.getBidPrice());
		auction.setTeamId(auctionDataDto.getTeamId());
		auction.setSold(auctionDataDto.isSold());
		return auction;
		
	}
	
	
	public static PlayerDetailsInTeamDto convertPlayerToPlayerDetailsInTeamDto(Player p,int BidPrice) {
		PlayerDetailsInTeamDto dto=new PlayerDetailsInTeamDto();
		dto.setPlayerName(p.getPlayerName());
		dto.setCategoryName(p.getCategory().getCategoryName());
		dto.setProfilePhoto(p.getPlayerPhoto());
		dto.setFinalBidPrice(BidPrice);
		return dto;
		
	}
	
	
	

}
