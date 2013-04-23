package com.ksg.formslibrary.util;

public enum Affiliate {
	Preferred("kp"),
	Specialty("ks")
	
	;
	String abbrev;
	private Affiliate(String abbrev) {
		this.abbrev = abbrev;
	}
	public String getAbbrev() {
		return abbrev;
	}
	
	@Override
	/**
	 * Returns the affiliate abbreviation
	 */
	public String toString() {
		return this.getAbbrev();
	}
	
	
	
}
