package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
public class TeamDetailsDto {
	private String teamImage;
	private String teamName;
	private Integer playersCount;
	private Integer purseLeft;
	public String getTeamImage() {
		return teamImage;
	}
	public String getTeamName() {
		return teamName;
	}
	public Integer getPlayersCount() {
		return playersCount;
	}
	public Integer getPurseLeft() {
		if(purseLeft!=null) {			
			return purseLeft;
		}
		return 0;
	}
	
	
}
