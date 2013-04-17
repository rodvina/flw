package com.ksg.formslibrary.domain;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListValues1 extends AbstractDomain {
	
	//form input selection values
	
	List<KeyValue> stateList;	
	List<KeyValue> lobList;	
	List<KeyValue> policyTypeList;	
	List<KeyValue> companyList;
	List<KeyValue> formTypeList;
	List<KeyValue> mandOptList;
	List<KeyValue> coverageList;
	
	//Map<String, List<KeyValue>> listValMap;


	public ListValues1() {
		//listValMap = new HashMap<String, List<KeyValue>>();
	}
	
//	public Map<String, List<KeyValue>> getListValMap() {
//		return listValMap;
//	}
//
//	public void setListValMap(Map<String, List<KeyValue>> listValMap) {
//		this.listValMap = listValMap;
//	}
//	
//	public List<KeyValue> getKeyValues(String type) {
//		return listValMap.get(type);
//	}
//	
//	public void setKeyValues(String type, List<KeyValue> keyValues) {
//		listValMap.put(type, keyValues);
//	}
	
	public List<KeyValue> getStateList() {
		return stateList;
	}
	public void setStateList(List<KeyValue> stateList) {
		this.stateList = stateList;
	}
	public List<KeyValue> getLobList() {
		return lobList;
	}
	public void setLobList(List<KeyValue> lobList) {
		this.lobList = lobList;
	}

	public List<KeyValue> getPolicyTypeList() {
		return policyTypeList;
	}
	public void setPolicyTypeList(List<KeyValue> policyTypeList) {
		this.policyTypeList = policyTypeList;
	}
	public List<KeyValue> getCompanyList() {
		return companyList;
	}
	public void setCompanyList(List<KeyValue> companyList) {
		this.companyList = companyList;
	}
	public List<KeyValue> getFormTypeList() {
		return formTypeList;
	}
	public void setFormTypeList(List<KeyValue> formTypeList) {
		this.formTypeList = formTypeList;
	}
	public List<KeyValue> getMandOptList() {
		return mandOptList;
	}
	public void setMandOptList(List<KeyValue> mandOptList) {
		this.mandOptList = mandOptList;
	}
	public List<KeyValue> getCoverageList() {
		return coverageList;
	}
	public void setCoveragesList(List<KeyValue> coverageList) {
		this.coverageList = coverageList;
	}

	
	
}
