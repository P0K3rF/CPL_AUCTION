package com.concerto.cpl.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

@Entity
@Table(name="Teams")
public class Team {
	
	@Id
	@Column(name="TeamID")
	private int teamId;
	@Column(name = "TeamName")
	private String teamName;
	@Column(name = "Profile_Photo")
	private String profilePhoto;
	@OneToMany(mappedBy = "team",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private List<Player> players;
}
