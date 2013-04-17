package com.ksg.formslibrary.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ksg.formslibrary.domain.ListValues;

import dw.spring3.rest.bean.Employee;
import dw.spring3.rest.bean.EmployeeList;

@Service
public class ListValueServiceImpl implements ListValueService {
	private static final Logger log = Logger.getLogger(ListValueServiceImpl.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	private String url = "http://127.0.0.1:9080/formslibraryservice/listval/company/KP/list";
	
	/**
	 * Returns available search criteria
	 */
	@Override
	public ListValues getListValues() {
		log.info("getting list values from restful service: " + url);
		//Create a list for the message converters
	
		Map<String, String> urlVariables = new HashMap<String, String>();
		urlVariables.put("co", "kp");
		//rest call with json response expected in the form of
		//{states : [ {"key":"CO", "value":"Colorado", "pattern":"a[20]"},...], lobs : []
		
//		listValues = restTemplate.getForObject(url, ListValues.class);
//		listValues.setStateList(Arrays.asList(new KeyValue[] {new KeyValue("02", "California")}));
		
//		this.callTestRest();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		ResponseEntity<ListValues> response = restTemplate.exchange(
				url, 
				HttpMethod.GET, entity, ListValues.class);
		
		ListValues listValues = response.getBody();
		return listValues;
	}
	
	private void callTestRest() {
		String url = "http://localhost:9080/RESTClientIBM/service/emps";
		log.info("calling RESTClientIBM: " + url);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
				
		ResponseEntity<EmployeeList> response = restTemplate.exchange(
				url, 
				HttpMethod.GET, entity, EmployeeList.class);
		
		EmployeeList employees = response.getBody();
		for(Employee e : employees.getEmployees()) {
			System.out.println(e.getId() + ": " + e.getName());
		}
	}

}
