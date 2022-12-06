package com.concerto.cpl.dto;

import java.util.Date;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Team;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class PlayerResponseDto {

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

}
