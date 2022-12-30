package com.concerto.cpl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.Exceptions.MaximumAmountReachedException;
import com.concerto.cpl.Exceptions.MaximumSoldPlayerReachedException;
import com.concerto.cpl.dto.AuctionDataDto;
import com.concerto.cpl.entity.Auction;
import com.concerto.cpl.mapper.BeanMapper;
import com.concerto.cpl.repository.AuctionRepository;

@Service
public class AuctionService {

	@Autowired
	AuctionRepository auctionRepository;

	@Autowired
	PlayerService playerService;

	@Autowired
	AuctionMasterService auctionMasterService;

	public boolean checkForUnsoldPlayer(int playerId) {
		int playerCheck = this.auctionRepository.checkForUnsoldPlayer(playerId);
		if (playerCheck <= 0) {
			return true;
		} else {
			return false;
		}
	}

	public Integer getPurseLeft(int teamId) {
		if(this.auctionRepository.getRemainingPrice(teamId)==null || this.auctionRepository.getRemainingPrice(teamId)<0)
		{
			return 0;
		}
		return this.auctionRepository.getRemainingPrice(teamId);
	}
	
	
	public Integer getBidAmountOfPlayer(int playerId) {
		return this.auctionRepository.getBidPriceOfPlayer(playerId);
	}
	
	
	
	
	
	public boolean insertAuctionData(AuctionDataDto auctionDataDto) {
		Auction auction = BeanMapper.convertAuctionDataDtoToAuction(auctionDataDto);
		
	Integer remainingPrice=this.auctionRepository.getRemainingPrice(auction.getTeamId());
	Integer soldPlayer=this.auctionRepository.getSoldPlayerCount(auction.getTeamId());
	
	if(remainingPrice==null || remainingPrice+auction.getBidPrice()<=10000) {
		
		if(soldPlayer==0 || soldPlayer+1 <=20) {
			this.playerService.updateTeamForPlayer(auction.getTeamId(), auction.getPlayerId());
			this.auctionRepository.save(auction);
			return true;
		}else {
			throw new MaximumSoldPlayerReachedException("Your Team has Reached Maximum Player Limit");
		}
	}else {
		throw new MaximumAmountReachedException("Your Purse amount has exceeded the Limit");
	}
	}

	public List<Auction> getAuctions(int teamId) {
		return this.auctionRepository.getPlayerFromTeam(teamId);
	}
	
	public Integer getReaminingPrice(int teamId) {
		return this.auctionRepository.getRemainingPrice(teamId);
	}
	
	public Integer getSoldPlayerCount(int teamId) {
		return this.auctionRepository.getSoldPlayerCount(teamId);
	}
}
