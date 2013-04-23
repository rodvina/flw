package com.ksg.formslibrary.controller;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksg.formslibrary.domain.CodeValue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
public class ListValControllerTest {

	@Autowired
	ListValController controller;
	
	@Test
	public void testSetupListValues() {
		Map<String, List<CodeValue>> listValues = controller.setupListValues("kp");
		
		assertNotNull(listValues);
		System.out.println("listvalues: " + listValues);
		assertTrue(listValues.get("companyList").size() > 0);
		assertTrue(listValues.get("formTypeList").size() > 0);
		assertTrue(listValues.get("lobList").size() > 0);
		assertTrue(listValues.get("policyTypeList").size() > 0);
		assertTrue(listValues.get("stateList").size() > 0);
	}
	
	@Test
	public void testProcessSearch() {
		String response = controller.showSearchInternal(null, null, null);
		
		assertNotNull(response);

	}

}
