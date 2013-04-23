package com.ksg.formslibrary.dao;

import java.util.List;

import com.ksg.formslibrary.domain.CodeValue;
import com.ksg.formslibrary.domain.SearchCriteria;

public interface ListValueDAO {

	List<CodeValue> getAllStates();
	List<CodeValue> getAllLOBs();
	List<CodeValue> getAllPolicyTypes();
	List<CodeValue> getAllCompanies();
	List<CodeValue> getAllFormTypes();
	List<CodeValue> getAllMandOpt();

}
