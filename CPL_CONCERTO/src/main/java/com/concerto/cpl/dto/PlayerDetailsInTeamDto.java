package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data


public class PlayerDetailsInTeamDto {
	
	private String profilePhoto;
	private String playerName;
	private String categoryName;
	private Integer finalBidPrice;
}
