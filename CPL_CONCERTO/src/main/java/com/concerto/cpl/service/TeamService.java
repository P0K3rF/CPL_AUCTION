package com.concerto.cpl.service;

import java.util.List;
import java.util.Optional;

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
	
	public Team getTeamDetailsById( String teamId)
	{
		if(this.teamRespository.count()>0) {
			
			return this.teamRespository.findById(Integer.parseInt(teamId)).get();
		}
		throw new  EntityNotFoundException("No teams are available ");
	}
	
	public int getTeamIdByTeamName(String teamName) {
		
	Optional<Team> optionalTeam=this.teamRespository.findByTeamName(teamName);
	if(optionalTeam.isPresent())	
		return optionalTeam.get().getTeamId();
	throw new EntityNotFoundException("Team not found");
	}
	
	
	public List<Team> getAllTeam()
	{
		if(this.teamRespository.count()>0) {
			
			return this.teamRespository.findAll();
		}
		throw new  EntityNotFoundException("No teams are available ");
	}
	

}
