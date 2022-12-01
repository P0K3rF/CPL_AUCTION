package com.concerto.cpl.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class AuctionMaster {
	
	private int auctionId;
	private String auctionName;
	private Date auctionDate;
	private String pointsPerTeam;
	private int minimumBid;
	private int bidIncreasedBy;
	private int playerPerTeam;
}
