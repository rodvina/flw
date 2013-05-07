package com.ksg.formslibrary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
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
	public List<Form> search(String affiliate, SearchCriteria searchCriteria) {
		//TODO:  Decide whether REST service will provide GET (via querystring) or POST (via request body) method
		log.info("searching for forms based on the following criteria:" + searchCriteria.toJSON());
		return searchViaPost(affiliate, searchCriteria);
	}

	private List<Form> searchViaGet(String affiliate, SearchCriteria searchCriteria) {
		log.info("search via GET to " + searchUrl);
		
		//TODO: Convert searchCriteria to searchParams
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put(UrlVariable.afl.toString(), affiliate);
		
		ResponseEntity<List> response = restTemplate.getForEntity(searchUrl, List.class, urlVariables);
		
		return response.getBody();
	}
	
	private List<Form> searchViaPost(String affiliate, SearchCriteria searchCriteria) {
		log.info("search via POST to " + searchUrl);
		
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put(UrlVariable.afl.toString(), affiliate);
				
		ResponseEntity<List> response = restTemplate.postForEntity(searchUrl, searchCriteria, List.class, urlVariables);
		return response.getBody();
	
	}

	@Override
	public Form searchDetail(String url) {
		log.info("get form via GET to " + url);
		ResponseEntity<Form> response = restTemplate.getForEntity(url, Form.class);
		return response.getBody();
	}

}
