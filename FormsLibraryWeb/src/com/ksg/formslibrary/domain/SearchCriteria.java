package com.ksg.formslibrary.domain;

import java.util.List;


public class SearchCriteria extends AbstractDomain {

	//form input values
	String formNumber;
	String formName;
	List<String> states;
	List<String> lobs;
	List<String> policyTypes;
	List<String> company;
	List<String> coverages;
	String formType;
	String mandatoryOptional;
	
	public String getFormNumber() {
		return formNumber;
	}
	public void setFormNumber(String formNumber) {
		this.formNumber = formNumber;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	
	public String getFormType() {
		return formType;
	}
	public void setFormType(String formType) {
		this.formType = formType;
	}
	public String getMandatoryOptional() {
		return mandatoryOptional;
	}
	public void setMandatoryOptional(String mandatoryOptional) {
		this.mandatoryOptional = mandatoryOptional;
	}
	public List<String> getCoverages() {
		return coverages;
	}
	public void setCoverages(List<String> coverages) {
		this.coverages = coverages;
	}
	public List<String> getStates() {
		return states;
	}
	public void setStates(List<String> states) {
		this.states = states;
	}
	public List<String> getLobs() {
		return lobs;
	}
	public void setLobs(List<String> lobs) {
		this.lobs = lobs;
	}
	public List<String> getPolicyTypes() {
		return policyTypes;
	}
	public void setPolicyTypes(List<String> policyTypes) {
		this.policyTypes = policyTypes;
	}
	public List<String> getCompany() {
		return company;
	}
	public void setCompany(List<String> company) {
		this.company = company;
	}

	
}
