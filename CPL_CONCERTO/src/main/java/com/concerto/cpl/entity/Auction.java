package com.concerto.cpl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
public class Auction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "AuctionMasterId")
    private int auctionMasterId;
	@Column(name = "PlayerId")
	private int playerId;
	@Column(name = "TeamId")
	private int teamId;
	@Column(name = "Sold")
	private boolean sold;
	@Column(name = "BidPrice")
	private int bidPrice;
	
}
