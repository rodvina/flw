package com.ksg.formslibrary.service;

import static org.junit.Assert.assertNotNull;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksg.formslibrary.domain.KeyValue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/restTest-context.xml"})
//@ActiveProfiles(profiles="test")
public class ListValueServiceImplTest {

	@Autowired
	ListValueService listValueService;
	
	
	@Test
	public void testGetListValues() {
		Map<String, KeyValue[]>  listValues = listValueService.getListValues();
		assertNotNull(listValues);

		
	}

}
