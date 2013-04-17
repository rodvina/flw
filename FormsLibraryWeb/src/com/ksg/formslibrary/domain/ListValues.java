package com.ksg.formslibrary.domain;


public class ListValues extends AbstractDomain {
	
	//form input selection values
	KeyValue[] states;	
	KeyValue[] lobs;	
	KeyValue[] policyTypes;	
	KeyValue[] companies;
	KeyValue[] formTypes;
	KeyValue[] mandOpts;
	KeyValue[] coverages;

	public KeyValue[] getStateList() {
		return states;
	}

	public void setStateList(KeyValue[] states) {
		this.states = states;
	}

	public KeyValue[] getLobList() {
		return lobs;
	}

	public void setLobList(KeyValue[] lobs) {
		this.lobs = lobs;
	}

	public KeyValue[] getPolicyTypeList() {
		return policyTypes;
	}

	public void setPolicyTypeList(KeyValue[] policyTypes) {
		this.policyTypes = policyTypes;
	}

	public KeyValue[] getCompanyList() {
		return companies;
	}

	public void setCompanyList(KeyValue[] companies) {
		this.companies = companies;
	}

	public KeyValue[] getFormTypeList() {
		return formTypes;
	}

	public void setFormTypeList(KeyValue[] formTypes) {
		this.formTypes = formTypes;
	}

	public KeyValue[] getMandOptList() {
		return mandOpts;
	}

	public void setMandOptList(KeyValue[] mandOpts) {
		this.mandOpts = mandOpts;
	}

	public KeyValue[] getCoverageList() {
		return coverages;
	}

	public void setCoverageList(KeyValue[] coverages) {
		this.coverages = coverages;
	}
	
//	public KeyValue[] getStateList() {
//		return states;
//	}
//	public void setStateList(KeyValue[] states) {
//		this.states = states;
//	}
//	public KeyValue[] getLobList() {
//		return lobs;
//	}
//	public void setLobList(KeyValue[] lobs) {
//		this.lobs = lobs;
//	}
//	public KeyValue[] getPolicyTypeList() {
//		return policyTypes;
//	}
//	public void setPolicyTypeList(KeyValue[] policyTypes) {
//		this.policyTypes = policyTypes;
//	}
//	public KeyValue[] getCompanyList() {
//		return companies;
//	}
//	public void setCompanyList(KeyValue[] companies) {
//		this.companies = companies;
//	}
//	public KeyValue[] getFormTypeList() {
//		return formTypes;
//	}
//	public void setFormTypeList(KeyValue[] formTypes) {
//		this.formTypes = formTypes;
//	}
//	public KeyValue[] getMandOptList() {
//		return mandOpts;
//	}
//	public void setMandOptList(KeyValue[] mandOpts) {
//		this.mandOpts = mandOpts;
//	}
//	public KeyValue[] getCoveragesList() {
//		return coveragesList;
//	}
//	public void setCoveragesList(KeyValue[] coveragesList) {
//		this.coveragesList = coveragesList;
//	}

	
	
}
