package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data


public class AuctionRequestDto {
	private String teamName;
	private String playerName;
	private int bidPrice;
	private boolean sold;
}
