package com.ksg.formslibrary.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

public class AbstractDomain implements Serializable {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(AbstractDomain.class);

	@Override
	public String toString() {

		return ReflectionToStringBuilder.toString(this);
	}

	public String toJSON() {
		try {
			return new ObjectMapper().writeValueAsString(this);
		} catch (Exception e) {
			return "toJSON failed:"+this.toString();
		}
	}
	
}
