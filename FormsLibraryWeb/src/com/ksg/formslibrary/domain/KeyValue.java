package com.ksg.formslibrary.domain;

import org.codehaus.jackson.annotate.JsonProperty;


public class KeyValue extends AbstractDomain {

	@JsonProperty(value="code")
	String key;
	String value;
	String pattern;
	
	public KeyValue() {
		
	}
	
	public KeyValue(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public KeyValue(String key, String value, String pattern) {
		this.key = key;
		this.value = value;
		this.pattern = pattern;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
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
