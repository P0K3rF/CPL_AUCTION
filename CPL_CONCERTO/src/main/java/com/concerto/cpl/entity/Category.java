package com.concerto.cpl.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data


@Entity
@Table(name = "Category")
public class Category {
	@Id
	@Column(name = "CategoryId")
	private int categoryId;
	@Column(name = "CategoryName")
	private String categoryName;
	@Column(name = "Grade")
	private String grade;
	@Column(name = "Minimum_Bid")
	private int minimumBid;
	
	@OneToMany(mappedBy = "team",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private List<Player> players;
}
