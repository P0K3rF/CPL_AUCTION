package com.concerto.cpl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.dto.PlayerDetailsInTeamDto;
import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.mapper.BeanMapper;
import com.concerto.cpl.repository.PlayerRepository;
import com.concerto.cpl.util.PagingList;

@Service
public class PlayerService {

	@Autowired
	PlayerRepository playerRepository;

	@Autowired
	AuctionService auctionService;

	public int getPlayerIdByPlayerName(String playerName) {
		System.out.println(playerName);
		Optional<Player> optionalPlayer = this.playerRepository.findByPlayerName(playerName);
		if (optionalPlayer.isPresent())
			return optionalPlayer.get().getPlayerId();
		throw new EntityNotFoundException("Player not found");
	}

	public Player getPlayerById(int id) {
		return this.playerRepository.findById(id).get();
	}

	public List<Player> getAllPlayer() {
		if (this.playerRepository.count() > 0) {
			return this.playerRepository.findAll();
		}
		throw new EntityNotFoundException("No players are available");
	}

	public List<PlayerDetailsInTeamDto> getPlayerListByTeamId(String teamId){
		
		
		List<PlayerDetailsInTeamDto> PlayerListResult = new ArrayList<>();
		if(this.playerRepository.count()>0) {
			List<Player> playerList =  this.playerRepository.findAll();
			for (Player iteratePlayer : playerList) {
				if(iteratePlayer.getTeam() != null ) {
					if(iteratePlayer.getTeam().getTeamId() == (Integer.parseInt(teamId))) {
						
						PlayerListResult.add(BeanMapper.convertPlayerToPlayerDetailsInTeamDto(iteratePlayer, this.auctionService.getBidAmountOfPlayer(iteratePlayer.getPlayerId())));
					}
				}
				
				
			}
			return PlayerListResult;
		}
		throw new EntityNotFoundException("No players are available");
	}

	public void updateTeamForPlayer(int TeamId, int PlayerId) {

		this.playerRepository.updateTeamIdForPlayer(TeamId, PlayerId);
	}

	public Map<String, Object> getPlayerData(Category category, int pageNo, String filter) {
		Map<String, Object> map = new HashMap<>();

		List<Player> players = this.playerRepository.findPlayerByCategory(category);

		if (filter.equalsIgnoreCase("Sold")) {
			List<Player> listofSoldPlayer = players.stream()
					.filter(p -> !auctionService.checkForUnsoldPlayer(p.getPlayerId())).collect(Collectors.toList());
			Optional<Player> p = PagingList.getPage(listofSoldPlayer, pageNo, 1).stream().findFirst();
		
			if (p.isPresent()) {
				map.put("filter", "sold");
				map.put("data", p.get());
				map.put("max_bid", category.getMaximumBid());
				map.put("increase", category.getIncreaseBid());
				map.put("size", listofSoldPlayer.size());
				return map;
			}

		} else if (filter.equalsIgnoreCase("Unsold")) {

			List<Player> listofUnsoldPlayer = players.stream()
					.filter(p -> auctionService.checkForUnsoldPlayer(p.getPlayerId())).collect(Collectors.toList());
			Optional<Player> p = PagingList.getPage(listofUnsoldPlayer, pageNo, 1).stream().findFirst();

			if (p.isPresent()) {
				map.put("filter", "unsold");
				map.put("data", p.get());
				map.put("max_bid", category.getMaximumBid());
				map.put("increase", category.getIncreaseBid());
				map.put("size", listofUnsoldPlayer.size());
				return map;
			}

		} else {

			Optional<Player> p = PagingList.getPage(players, pageNo, 1).stream().findFirst();
			Player player = p.get();
			if (player.getTeam() != null) {
				map.put("filter", "sold");
				map.put("data", player);
				map.put("max_bid", category.getMaximumBid());
				map.put("increase", category.getIncreaseBid());
				map.put("size", players.size());
				return map;
			} else {
				map.put("filter", "unsold");
				map.put("data", player);
				map.put("max_bid", category.getMaximumBid());
				map.put("increase", category.getIncreaseBid());
				map.put("size", players.size());
				return map;
			}

		}
		throw new EntityNotFoundException("No Player Found");
	}

}
