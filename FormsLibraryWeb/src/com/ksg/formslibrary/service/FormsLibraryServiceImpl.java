package com.ksg.formslibrary.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.util.UrlVariable;

@Service
public class FormsLibraryServiceImpl implements FormsLibraryService {
	private static final Logger log = Logger.getLogger(FormsLibraryServiceImpl.class);

	
	@Autowired
	RestTemplate restTemplate;
	
	@Value("${service.url.${env}}${search.url.path}")
	private String searchUrl;// = "http://localhost:9080/formslibraryservice/forms/company/{co}/search?formnumber={formnumber}";
	
	private List<Form> forms = new ArrayList<Form>();
	
	@Override
	public List<Form> getForms() {
		return forms;
	}

	@Override
	public List<Form> search(String affiliate, SearchCriteria searchCriteria) throws FormsLibraryServiceException {
		log.info("searching for forms based on the following criteria: " + searchCriteria);
		
		//TODO: Convert searchCriteria to searchParams
		String message = null;
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put(UrlVariable.afl.toString(), affiliate);
		log.info("calling REST url:" + searchUrl);
		List<Form> response = restTemplate.getForObject(searchUrl, List.class, urlVariables);

		return response;
	}

	@Override
	public List<Form> searchDetail(String formname)
			throws FormsLibraryServiceException {
		// TODO Auto-generated method stub
		return null;
	}



}
