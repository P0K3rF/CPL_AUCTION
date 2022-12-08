package com.concerto.cpl.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.entity.Team;

public interface PlayerRepository extends JpaRepository<Player, Integer> {

	List<Player> findPlayerByCategory(Category category);
	Page<Player> findPlayerByCategory(Category category, Pageable pageable);
	Optional<Player> findByPlayerName(String playerName);
	
	List<Player> findByTeam(Team team);
	
	@Transactional
	@Modifying
	@Query(nativeQuery = true,value="update Player set TeamId=? where PlayerId=?")
	public void updateTeamIdForPlayer(@Param(value = "TeamId")int TeamId,@Param(value = "PlayerId")int playerId);

}
