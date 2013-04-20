package com.ksg.formslibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ksg.formslibrary.domain.KeyValue;

@Service
public class ListValueServiceImpl implements ListValueService {
	private static final Logger log = Logger.getLogger(ListValueServiceImpl.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Value("${service.url.${env}}${listval.url.path}")
	String urlListVal;
	
//	private String url = "http://127.0.0.1:9080/formslibraryservice/listval/company/KP/list";
	
	/**
	 * Returns available search criteria
	 */
	@Override
	public Map<String, List<KeyValue>> getListValues() {
		log.info("getting list values from restful service: " + urlListVal);
		//Create a list for the message converters
	
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("afl", "KP");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<Map> response = restTemplate.exchange(
				urlListVal, 
				HttpMethod.GET, entity, Map.class, urlVariables);
		
		Map<String, List<KeyValue>> listValues = response.getBody();
		for (String key :listValues.keySet()) {
			log.info(key);
			log.info(listValues.get(key));
		}
		return listValues;
	}



}
