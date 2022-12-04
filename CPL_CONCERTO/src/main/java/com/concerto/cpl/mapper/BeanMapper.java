package com.concerto.cpl.mapper;

import org.springframework.context.annotation.Scope;

import com.concerto.cpl.dto.PlayerDataDto;
import com.concerto.cpl.entity.Player;

@Scope
public class BeanMapper {


		
	public static PlayerDataDto convertPlayerTolayerDataDto(Player player) {
		PlayerDataDto	playerDataDto=new PlayerDataDto();
		playerDataDto.setPlayerName(player.getPlayerName());
		playerDataDto.setPlayerDOB(player.getPlayerDOB());
		playerDataDto.setPlayerDebut(player.getPlayerDebut());
		playerDataDto.setMinimumBid(player.getCategory().getMinimumBid());
		playerDataDto.setPlayerPhoto(player.getPlayerPhoto());
		playerDataDto.setPlayerBatStyle(player.getPlayerBatStyle());
		playerDataDto.setPlayerRuns(player.getPlayerRuns());
		playerDataDto.setPlayerStrikeRate(player.getPlayerStrikeRate());
		playerDataDto.setPlayerBallStyle(player.getPlayerBallStyle());
		playerDataDto.setPlayerBallEconomy(player.getPlayerBallEconomy());
		playerDataDto.setPlayertotalWickets(player.getPlayertotalWickets());
		return playerDataDto;
	}
	
}
