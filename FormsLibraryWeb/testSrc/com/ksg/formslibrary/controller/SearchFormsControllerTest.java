package com.ksg.formslibrary.controller;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksg.formslibrary.domain.KeyValue;
import com.ksg.formslibrary.domain.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
public class SearchFormsControllerTest {

	@Autowired
	SearchFormsController controller;
	
	@Test
	public void testSetupListValues() {
		Map<String, KeyValue[]> listValues = controller.setupListValues();
		
		assertNotNull(listValues);
		System.out.println("listvalues: " + listValues);
		assertTrue(listValues.get("companyList").length > 0);
		assertTrue(listValues.get("formTypeList").length > 0);
		assertTrue(listValues.get("lobList").length > 0);
		assertTrue(listValues.get("policyTypeList").length > 0);
		assertTrue(listValues.get("stateList").length > 0);
	}
	
	@Test
	public void testProcessSearch() {
		String response = controller.showSearchCriteriaForInternal(null);
		
		assertNotNull(response);

	}

}
