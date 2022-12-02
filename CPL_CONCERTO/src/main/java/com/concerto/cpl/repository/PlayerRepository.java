package com.concerto.cpl.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.concerto.cpl.entity.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer>{

}
