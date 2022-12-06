package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class AuctionDataDto {

	private int auctionMasterId;
	private int playerId;
	private int teamId;
	private boolean sold;
	private int bidPrice;
}
