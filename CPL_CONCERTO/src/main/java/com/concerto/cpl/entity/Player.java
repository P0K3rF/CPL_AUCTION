package com.concerto.cpl.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
public class Player {
	@Id
	private int playerId;
	private String playerName;
	private Date playerDOB;
	@ManyToOne
	private Team team;
	private String playerBatStyle;
	private String playerBallStyle;
	private String playerDebut;
	private String playerRuns;
	private String playerGrade;
	private String playertotalWickets;
	private String playerBallEconomy;
	private String playerStrikeRate;
	private String playersRole;
	private String playerPhoto;
}
