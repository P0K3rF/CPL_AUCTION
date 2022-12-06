package com.concerto.cpl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int playerCheck=this.auctionRepository.checkForUnsoldPlayer(playerId);
		if(playerCheck<=0) {
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	public boolean insertAuctionData(AuctionDataDto auctionDataDto) {
	Auction auction=BeanMapper.convertAuctionDataDtoToAuction(auctionDataDto);
	
	if(this.auctionRepository.getRemainingPrice(auction.getTeamId())==null && this.auctionRepository.getSoldPlayerCount(auction.getTeamId())==null) {
	if(this.auctionRepository.getRemainingPrice(auction.getTeamId())<=8500 && this.auctionRepository.getSoldPlayerCount(auction.getTeamId())<=20) {
		
		if(auction.isSold()) {
			this.playerService.updateTeamForPlayer(auction.getTeamId(), auction.getPlayerId());		
		}
		this.auctionRepository.save(auction);
		return true;
		
	}
	}
	return false;
	}
	
	
	
	public List<Auction> getAuctions(int teamId){
		return this.auctionRepository.getPlayerFromTeam(teamId);
	}
	
}
