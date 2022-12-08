package com.concerto.cpl.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.Owner;
import com.concerto.cpl.repository.OwnerRepository;

@Service
public class OwnerService {
	
	@Autowired
	OwnerRepository ownerRepository;

	public List<Owner> getAllOwner(){
		if(this.ownerRepository.count()>0) {
			return this.ownerRepository.findAll();
		}
		throw new EntityNotFoundException("No Owners Found");
	}
	
	public String getOwnerNameByTeamId(int teamId) {
		return this.ownerRepository.getOwnerNameByTeamId(teamId);
	}
}
