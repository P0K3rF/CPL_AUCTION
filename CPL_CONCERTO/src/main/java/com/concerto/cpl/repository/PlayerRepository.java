package com.concerto.cpl.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer>{
	
	
	Page<Player> findPlayerByCategory(Category category,Pageable pageable);
}
