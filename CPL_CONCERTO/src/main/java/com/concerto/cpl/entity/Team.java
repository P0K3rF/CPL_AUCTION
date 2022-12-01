package com.concerto.cpl.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
public class Team {
	
	@Id
	private int teamId;
	private String teamName;
	private String profilePhoto;
	@OneToMany(mappedBy = "team",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private List<Player> players;
}
