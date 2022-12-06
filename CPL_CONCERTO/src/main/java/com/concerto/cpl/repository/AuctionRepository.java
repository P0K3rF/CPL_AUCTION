package com.concerto.cpl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.cpl.entity.Auction;

public interface AuctionRepository extends JpaRepository<Auction, Integer>{
	
	@Query(nativeQuery = true,value = "select count(*) from dbo.Auction where playerId=? AND Sold='True';")
	Integer checkForUnsoldPlayer(@Param(value = "playerId")int playerId);
	
	@Query(nativeQuery = true,value = "select * from Auction where Teamid=? AND Sold=1")
	List<Auction> getPlayerFromTeam(@Param(value = "Teamid")int teamId);
	
	
	@Query(nativeQuery = true,value="select SUM(Bidprice) from auction where TeamId=?")
	Integer getRemainingPrice(@Param(value = "TeamId") int teamId);
	
	
	@Query(nativeQuery = true,value="select count(*) from player where Teamid=?")
	public Integer getSoldPlayerCount(@Param(value="Teamid")int teamId);
}
