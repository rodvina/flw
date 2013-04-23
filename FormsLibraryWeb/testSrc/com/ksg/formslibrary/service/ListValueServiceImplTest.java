package com.ksg.formslibrary.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mockit.Mocked;
import mockit.NonStrictExpectations;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;

import com.ksg.formslibrary.domain.CodeValue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
//@ActiveProfiles(profiles="test")
public class ListValueServiceImplTest {

	@Autowired
	ListValueService listValueService;
	
	
	@Test
	public void testGetListValues() {
		Map<String, List<CodeValue>>  listValues = listValueService.getListValues("all");
		final Map<String, List<CodeValue>> map = new HashMap<String, List<CodeValue>>();
		List<CodeValue> CodeValueStateList = new ArrayList<CodeValue>();
		CodeValueStateList.add(new CodeValue("AL", "ALABAMA"));
		CodeValueStateList.add(new CodeValue("FL", "FLORIDA"));
		map.put("stateList", CodeValueStateList);
		
		final ResponseEntity response = new ResponseEntity<String>("200", null);
		new NonStrictExpectations() {
			@Mocked RestTemplate template;
			{
				template.exchange(anyString, HttpMethod.GET, (HttpEntity)any, Map.class, any);
					result=response;

			}
			
		};
				
		assertNotNull(listValues);

		
	}

}
