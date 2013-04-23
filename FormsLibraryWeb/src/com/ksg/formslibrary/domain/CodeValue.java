package com.ksg.formslibrary.domain;

/**
 * Encapsulates attribute values from Resource Categories
 *
 */
public class CodeValue extends AbstractDomain {

	String code;
	String value;
	String pattern;
	
	public CodeValue() {
		
	}
	
	public CodeValue(String code, String value) {
		this.code = code;
		this.value = value;
	}
	
	public CodeValue(String code, String value, String pattern) {
		this.code = code;
		this.value = value;
		this.pattern = pattern;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
		
}
