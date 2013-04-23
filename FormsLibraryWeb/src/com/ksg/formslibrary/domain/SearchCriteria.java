package com.ksg.formslibrary.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Encapsulates search criteria data selected
 *
 */
public class SearchCriteria extends AbstractDomain {

	//form input values, basic
	String formNumber;
	String formName;
	@NotNull
	List<String> states;
	List<String> lobs;
	List<String> contractTypes;
	List<String> companies;
	
	//advanced
	List<String> coverages;
	List<String> events;
	List<String> ruleIds;
	List<String> printCategories;
	List<String> levelIndicators;
	List<String> premIndicators;
	List<String> statuses;
	List<String> formTypes;
	List<String> bulkRenewals;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date nbEffDate;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date nbExpDate;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date renEffDate;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date renExpDate;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date procDate;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	Date modDate;
	String formId;
	
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

	public List<String> getCompanies() {
		return companies;
	}
	public void setCompanies(List<String> companies) {
		this.companies = companies;
	}
	public List<String> getContractTypes() {
		return contractTypes;
	}
	public void setContractTypes(List<String> contractTypes) {
		this.contractTypes = contractTypes;
	}
	public List<String> getEvents() {
		return events;
	}
	public void setEvents(List<String> events) {
		this.events = events;
	}
	public List<String> getRuleIds() {
		return ruleIds;
	}
	public void setRuleIds(List<String> ruleIds) {
		this.ruleIds = ruleIds;
	}
	public List<String> getPrintCategories() {
		return printCategories;
	}
	public void setPrintCategories(List<String> printCategories) {
		this.printCategories = printCategories;
	}
	public List<String> getLevelIndicators() {
		return levelIndicators;
	}
	public void setLevelIndicators(List<String> levelIndicators) {
		this.levelIndicators = levelIndicators;
	}
	public List<String> getPremIndicators() {
		return premIndicators;
	}
	public void setPremIndicators(List<String> premIndicators) {
		this.premIndicators = premIndicators;
	}
	public List<String> getStatuses() {
		return statuses;
	}
	public void setStatuses(List<String> statuses) {
		this.statuses = statuses;
	}
	public List<String> getFormTypes() {
		return formTypes;
	}
	public void setFormTypes(List<String> formTypes) {
		this.formTypes = formTypes;
	}
	public List<String> getBulkRenewals() {
		return bulkRenewals;
	}
	public void setBulkRenewals(List<String> bulkRenewals) {
		this.bulkRenewals = bulkRenewals;
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
	public Date getProcDate() {
		return procDate;
	}
	public void setProcDate(Date procDate) {
		this.procDate = procDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public String getFormId() {
		return formId;
	}
	public void setFormId(String formId) {
		this.formId = formId;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	
}
