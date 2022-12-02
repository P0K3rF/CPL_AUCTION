package com.concerto.cpl.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
@Table(name = "Auction_Master")
public class AuctionMaster {
	
	@Id
	@Column(name = "AuctionId")
	private int auctionId;
	@Column(name = "AuctionName")
	private String auctionName;
	@Column(name = "AuctionDate")
	private Date auctionDate;
	@Column(name="PointsPerTeam")
	private String pointsPerTeam;
	@Column(name="MinimumBid")
	private int minimumBid;
	@Column(name="BidIncreasedBy")
	private int bidIncreasedBy;
	@Column(name="PlayerPerTeam")
	private int playerPerTeam;
}
