package com.concerto.cpl.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.cpl.entity.AuctionMaster;

public interface AuctionMasterRepository extends JpaRepository<AuctionMaster, Integer>{
	
	Optional<AuctionMaster> findByAuctionName(String auctionName);
}
