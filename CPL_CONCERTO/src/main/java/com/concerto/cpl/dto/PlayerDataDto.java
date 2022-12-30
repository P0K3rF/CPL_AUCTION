package com.concerto.cpl.dto;

import java.util.Date;

import javax.persistence.Column;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PlayerDataDto {
	private String playerName;
	private String playerDOB;
	private String playerDebut;
	private int minimumBid;
	private String playerPhoto;
	private String playerBatStyle;
	private String playerRuns;
	private String playerStrikeRate;
	private String playerBallStyle;
	private String playerBallEconomy;
	private String playertotalWickets;

	private Integer fifties;

	private Integer hundreds;

	private Integer highestRuns;

	private String bestOver;
	private int increaseBy;
	private int maximum_bid;
	private String teamName;
	
}
