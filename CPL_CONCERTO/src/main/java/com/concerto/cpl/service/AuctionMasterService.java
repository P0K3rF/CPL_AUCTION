package com.concerto.cpl.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.AuctionMaster;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.repository.AuctionMasterRepository;

@Service
public class AuctionMasterService {
	
	@Autowired
	AuctionMasterRepository  auctionMasterRepository;
	
	public List<AuctionMaster> getAllAuctionMasterData(){
		if(this.auctionMasterRepository.count()>0) {
			return this.auctionMasterRepository.findAll();
		}
		throw new EntityNotFoundException("No Data Present");
	}
	
	
	public int getAuctionIdByAuctionName(String auctionName) {
		Optional<AuctionMaster> optionalAuction=this.auctionMasterRepository.findByAuctionName(auctionName);
		if(optionalAuction.isPresent())	
			return optionalAuction.get().getAuctionId();
		throw new EntityNotFoundException("Auction not found");
	}
	
	public AuctionMaster getAuctionByAuctionName(String auctionName) {
		Optional<AuctionMaster> optionalAuction=this.auctionMasterRepository.findByAuctionName(auctionName);
		if(optionalAuction.isPresent())	
			return optionalAuction.get();
		throw new EntityNotFoundException("Auction not found");
	}
	
	public Integer getPlayerPerTeam(int auctionId) {
		return this.auctionMasterRepository.findById(auctionId).get().getPlayerPerTeam();
	}
	
	public Integer getPointsPerTeam(int auctionId) {
		return Integer.parseInt(this.auctionMasterRepository.findById(auctionId).get().getPointsPerTeam());
	}
	
}
