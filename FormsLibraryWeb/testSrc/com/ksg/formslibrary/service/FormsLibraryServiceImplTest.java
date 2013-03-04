package com.ksg.formslibrary.service;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksg.formslibrary.dao.ListValueDAO;
import com.ksg.formslibrary.domain.ListValues;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:context/jms-context.xml"})
//@ActiveProfiles(profiles="test")
public class FormsLibraryServiceImplTest {

	@Autowired
	ListValueDAO dao;
	
	@Autowired
	FormsLibraryService formsLibraryService;


}
