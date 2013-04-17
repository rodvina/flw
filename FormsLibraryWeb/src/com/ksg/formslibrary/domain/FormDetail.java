package com.ksg.formslibrary.domain;

import java.util.Date;

public class FormDetail extends AbstractDomain {

	private String state;
	private String company;
	private Date nbEffDate;
	private Date nbExpDate;
	private Date renEffDate;
	private Date renExpDate;
	private String lob;
	private String policyType;
	private String contractType;
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Date getNbEffDate() {
		return nbEffDate;
	}
	public void setNbEffDate(Date nbEffDate) {
		this.nbEffDate = nbEffDate;
	}
	public Date getNbExpDate() {
		return nbExpDate;
	}
	public void setNbExpDate(Date nbExpDate) {
		this.nbExpDate = nbExpDate;
	}
	public Date getRenEffDate() {
		return renEffDate;
	}
	public void setRenEffDate(Date renEffDate) {
		this.renEffDate = renEffDate;
	}
	public Date getRenExpDate() {
		return renExpDate;
	}
	public void setRenExpDate(Date renExpDate) {
		this.renExpDate = renExpDate;
	}
	public String getLob() {
		return lob;
	}
	public void setLob(String lob) {
		this.lob = lob;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getContractType() {
		return contractType;
	}
	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
}
