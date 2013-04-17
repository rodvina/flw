package com.ksg.formslibrary.service;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestOperations;

import com.ksg.formslibrary.domain.Form;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
//@ActiveProfiles(profiles="test")
public class FormsLibraryServiceImplTest {

	@Autowired
	RestOperations restTemplate;
	
	@Test
	public void testGetFormDetailsForStringObj() {
		String url = "http://localhost:9080/formslibraryservice/details/company/{co}/form/{key}";
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("co", "Kemper");
		urlVariables.put("key", "AK23478");
		String response = restTemplate.getForObject(url, String.class, urlVariables);
		
		assertNotNull(response);
		System.out.println("detail response: " + response);
		
		
	}
	
	@Test
	public void testGetFormDetailsForFormObj() {
		String url = "http://localhost:9080/formslibraryservice/details/company/{co}/form/{key}";
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("co", "Kemper");
		urlVariables.put("key", "AK23478");
		Form response = restTemplate.getForObject(url, Form.class, urlVariables);
		
		assertNotNull(response);
		System.out.println("detail response: " + response);
		
	}
	
	@Test
	public void testGetFormsForFormString() {
		String url = "http://localhost:9080/formslibraryservice/forms/company/{co}/search?formnumber={formnumber}";
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("co", "Kemper");
		urlVariables.put("formnumber", "AK23478");
		String response = restTemplate.getForObject(url, String.class, urlVariables);
		
		assertNotNull(response);
		System.out.println("forms response: " + response);
		
	}
	
	@Test
	public void testGetFormsForFormObj() {
		String url = "http://localhost:9080/formslibraryservice/forms/company/{co}/search?formnumber={formnumber}";
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("co", "Kemper");
		urlVariables.put("formnumber", "AK23478");
		List<Form> response = restTemplate.getForObject(url, List.class, urlVariables);
		
		assertNotNull(response);
		System.out.println("forms response: " + response);
		
	}
	


}
