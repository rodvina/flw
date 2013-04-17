package com.ksg.formslibrary.util;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class FormBuilderTest {

	@Test
	public void testFormNumber() {
		FormBuilder builder = new FormBuilder();
		assertNotNull(builder.formNumber("AK3324"));
		assertEquals("AK3324", builder.build().getFormNumber());
	}

	@Test
	public void testFormEdition() {
		FormBuilder builder = new FormBuilder();
		assertNotNull(builder.formEdition("1205"));
		assertEquals("1205", builder.build().getFormEdition());
	}
	


}
