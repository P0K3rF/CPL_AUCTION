package com.concerto.cpl.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "Player")
public class Player {
	@Id
	@Column(name = "PlayerId")
	private int playerId;
	@Column(name = "PlayerName")
	private String playerName;
	@Column(name = "PlayerDOB")
	private Date playerDOB;
	@ManyToOne
	@JoinColumn(name = "TeamId")
	private Team team;
	@Column(name = "PlayerBatStyle")
	private String playerBatStyle;
	@Column(name = "PlayerBallStyle")
	private String playerBallStyle;
	@Column(name = "PlayerDebut")
	private String playerDebut;
	@Column(name = "PlayerRuns")
	private String playerRuns;
	@Column(name = "TotalWickets")
	private String playertotalWickets;
	@Column(name = "BowlEconomy")
	private String playerBallEconomy;
	@Column(name = "StrikeRate")
	private String playerStrikeRate;
	@ManyToOne
	@JoinColumn(name = "CategoryId")
	private Category category;
	@Column(name = "Profile_Photo")
	private String playerPhoto;
	@Override
	public String toString() {
		return "Player [playerId=" + playerId + ", playerName=" + playerName + ", playerDOB=" + playerDOB + ", playerBatStyle=" + playerBatStyle + ", playerBallStyle=" + playerBallStyle
				+ ", playerDebut=" + playerDebut + ", playerRuns=" + playerRuns + ", playertotalWickets="
				+ playertotalWickets + ", playerBallEconomy=" + playerBallEconomy + ", playerStrikeRate="
				+ playerStrikeRate + ", playerPhoto=" + playerPhoto + "]";
	}
	
	
}
