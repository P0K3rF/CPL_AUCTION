package com.concerto.cpl.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.EntityNotFoundException;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.entity.Team;
import com.concerto.cpl.repository.PlayerRepository;
import com.concerto.cpl.util.PagingList;

@Service
public class PlayerService {

	@Autowired
	PlayerRepository playerRepository;

	@Autowired
	AuctionService auctionService;

	public int getPlayerIdByPlayerName(String playerName) {
		Optional<Player> optionalPlayer = this.playerRepository.findByPlayerName(playerName);
		if (optionalPlayer.isPresent())
			return optionalPlayer.get().getPlayerId();
		throw new EntityNotFoundException("Player not found");
	}

	public Player getPlayerById(int id) {
		return this.playerRepository.findById(id).get();
	}

//	public Map<String, Object> getPlayerData(Category category, int pageNo) {
//
//		Map<String, Object> map = new HashMap<>();
//
//		Pageable pageable = PageRequest.of(pageNo, 1);
//
//		long size = this.playerRepository.findPlayerByCategory(category, pageable).getTotalElements();
//
//		Optional<Player> optionalPlayer = this.playerRepository.findPlayerByCategory(category, pageable).getContent()
//				.stream().findFirst();
//
//		if (optionalPlayer.isPresent()) {
//
//			map.put("data", optionalPlayer.get());
//			map.put("size", size);
//			return map;
//		}
//		throw new EntityNotFoundException("No Player Found");
//	}

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
		Player player=p.get();
			if(player.getTeam()!=null) {
			map.put("filter", "sold");
			map.put("data", player);
			map.put("max_bid", category.getMaximumBid());
			map.put("increase", category.getIncreaseBid());
			map.put("size", players.size());
			return map;
		}else {
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
