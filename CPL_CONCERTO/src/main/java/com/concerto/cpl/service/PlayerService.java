package com.concerto.cpl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.repository.PlayerRepository;

@Service
public class PlayerService {
	
	@Autowired
	PlayerRepository playerRepository;
	
	
	public Map<String, Object> getPlayerData(Category category,int pageNo) {
		
		Map<String, Object> map=new HashMap<>();
		
		Pageable pageable=PageRequest.of(pageNo, 1);
		
	long size=this.playerRepository.findPlayerByCategory(category, pageable).getTotalElements();
	Optional<Player> optionalPlayer= this.playerRepository.findPlayerByCategory(category, pageable).getContent().stream().findFirst();
	
		if(optionalPlayer.isPresent()) {
		
			map.put("data", optionalPlayer.get());
			map.put("size", size);
			return map;
		}
		throw new EntityNotFoundException("No Player Found");	
	}
	
}
