package com.concerto.cpl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.concerto.cpl.entity.Team;

public interface TeamRespository extends JpaRepository<Team, Integer>{
	
	@Query(nativeQuery = true,value = "select TeamName from Teams")
	List<String> getTeamNames();
	
	
}
