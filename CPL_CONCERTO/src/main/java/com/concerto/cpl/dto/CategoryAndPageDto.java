package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class CategoryAndPageDto {
	private String categoryName;
	private String categoryGrade;
	private int PageNo;
}
