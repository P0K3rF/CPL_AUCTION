package com.concerto.cpl.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Auction {
	private int id;
	private int auctionId;
	private String auctionName;
	private Date auctionDate;
	private Player player;
	private Team team;
	private boolean sold;
	private int bidPrice;
	
}
