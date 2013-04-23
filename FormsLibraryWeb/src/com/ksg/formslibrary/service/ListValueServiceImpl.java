package com.ksg.formslibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import net.sf.ehcache.CacheManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.googlecode.ehcache.annotations.Cacheable;
import com.ksg.formslibrary.domain.CodeValue;

@Service
public class ListValueServiceImpl implements ListValueService {
	private static final String LIST_VAL_CACHE = "listValCache";

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
//	@Cacheable(value="listValCache", key="#key")
	@Cacheable(cacheName=LIST_VAL_CACHE)
	public Map<String, List<CodeValue>> getListValues(String affiliate) {
		//TODO:  Cache listValues
		log.info("getting list values...");
		//Create a list for the message converters
	
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("afl", affiliate);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		log.info("calling restful service: " + urlListVal);
		ResponseEntity<Map> response = restTemplate.exchange(
				urlListVal, 
				HttpMethod.GET, entity, Map.class, urlVariables);
		
		Map<String, List<CodeValue>> listValues = response.getBody();

		return listValues;
	}
	
//	@CacheEvict(value="listValCache", allEntries=true, key="#affiliate")
	public void resetCache(String affiliate) {
		//TODO:  can this be done via @annotation
		CacheManager singletonManager = CacheManager.create();
		singletonManager.getCache(LIST_VAL_CACHE).removeAll();
	}



}
