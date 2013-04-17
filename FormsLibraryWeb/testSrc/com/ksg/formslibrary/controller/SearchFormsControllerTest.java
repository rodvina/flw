package com.ksg.formslibrary.controller;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.ksg.formslibrary.domain.ListValues;
import com.ksg.formslibrary.domain.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
public class SearchFormsControllerTest {

	@Autowired
	SearchFormsController controller;
	
	@Test
	public void testSetupListValues() {
		ListValues listValues = controller.setupListValues();
		
		assertNotNull(listValues);
		System.out.println("listvalues: " + listValues);
		assertTrue(listValues.getCompanyList().length > 0);
		assertTrue(listValues.getFormTypeList().length > 0);
		assertTrue(listValues.getLobList().length > 0);
		assertTrue(listValues.getPolicyTypeList().length > 0);
		assertTrue(listValues.getStateList().length > 0);
	}
	
	@Test
	public void testProcessSearch() {
		String response = controller.processSearch(new SearchCriteria(), null);
		
		assertNotNull(response);

	}

}
