package com.concerto.cpl.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ResponseData<T> {
	private int statusCode;
	private T data;
}
