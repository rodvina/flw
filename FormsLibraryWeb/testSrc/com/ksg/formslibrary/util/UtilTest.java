package com.ksg.formslibrary.util;

import static org.junit.Assert.assertNull;

import org.junit.Test;

import com.ksg.formslibrary.domain.SearchCriteria;

public class UtilTest {

	@Test
	public void testConvertToStringNull() {
		assertNull(Util.convertToString(null));
	}
	
	@Test
	public void testConvertToString() {
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setFormNumber("AK2343");
		assertNull(Util.convertToString(searchCriteria));
	}

}
