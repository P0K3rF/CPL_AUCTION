package com.concerto.cpl.Exceptions;

public class MaximumSoldPlayerReachedException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5882417315092079344L;

	public MaximumSoldPlayerReachedException(String message) {
		super(message);
	}

}
