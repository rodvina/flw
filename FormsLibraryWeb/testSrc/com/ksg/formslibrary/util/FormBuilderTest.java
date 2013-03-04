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
	
	@Test
	public void testState() {
		FormBuilder builder = new FormBuilder();
		assertNotNull(builder.state("AL"));
		assertEquals("AL", builder.build().getState());
	}
	
	@Test
	public void testStatus() {
		FormBuilder builder = new FormBuilder();
		assertNotNull(builder.status("A"));
		assertEquals("A", builder.build().getStatus());
	}
	
	@Test
	public void testNbEffDate() {
		FormBuilder builder = new FormBuilder();
		Calendar cal = Calendar.getInstance();
		cal.set(2012, 05, 01);
		assertNotNull(builder.nbEffDate(cal.getTime()));
		assertEquals(cal.getTime(), builder.build().getNbEffDate());
	}
	
	@Test
	public void testNbExpDate() {
		FormBuilder builder = new FormBuilder();
		Calendar cal = Calendar.getInstance();
		cal.set(2012, 05, 01);
		assertNotNull(builder.nbExpDate(cal.getTime()));
		assertEquals(cal.getTime(), builder.build().getNbExpDate());
	}
	
	@Test
	public void testRenEffDate() {
		FormBuilder builder = new FormBuilder();
		Calendar cal = Calendar.getInstance();
		cal.set(2012, 05, 01);
		assertNotNull(builder.renEffDate(cal.getTime()));
		assertEquals(cal.getTime(), builder.build().getRenEffDate());
	}
	
	@Test
	public void testRenExpDate() {
		FormBuilder builder = new FormBuilder();
		Calendar cal = Calendar.getInstance();
		cal.set(2012, 05, 01);
		assertNotNull(builder.renExpDate(cal.getTime()));
		assertEquals(cal.getTime(), builder.build().getRenExpDate());
	}


}
