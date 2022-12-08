package com.concerto.cpl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.cpl.entity.Owner;
import com.concerto.cpl.entity.Team;

public interface OwnerRepository extends JpaRepository<Owner, Integer>{
	
	@Query(nativeQuery = true,value = "select OwnerName from Owner where TeamId=?")
	String getOwnerNameByTeamId (@Param(value = "TeamId") int teamId);
}
