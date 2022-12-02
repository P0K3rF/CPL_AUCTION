package com.concerto.cpl.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.Team;
import com.concerto.cpl.repository.TeamRespository;

@Service
public class TeamService {

	@Autowired
	TeamRespository teamRespository;

	public List<String> getAllTeamsName() {
		if (this.teamRespository.count() > 0) {
			return this.teamRespository.getTeamNames();
		}
		throw new EntityNotFoundException("No Team found");
	}

}
