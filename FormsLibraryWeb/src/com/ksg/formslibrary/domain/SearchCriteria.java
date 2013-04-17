package com.ksg.formslibrary.domain;


public class SearchCriteria extends AbstractDomain {


	//form input values
	String formNumber;
	String formName;
	String[] states;
	String[] lobs;
	String[] policyTypes;
	String[] company;
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
	
	public String[] getStates() {
		return states;
	}
	public void setStates(String[] states) {
		this.states = states;
	}
	public String[] getLobs() {
		return lobs;
	}
	public void setLobs(String[] lobs) {
		this.lobs = lobs;
	}
	public String[] getPolicyTypes() {
		return policyTypes;
	}
	public void setPolicyTypes(String[] policyTypes) {
		this.policyTypes = policyTypes;
	}
	public String[] getCompany() {
		return company;
	}
	public void setCompany(String[] company) {
		this.company = company;
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
	
}
