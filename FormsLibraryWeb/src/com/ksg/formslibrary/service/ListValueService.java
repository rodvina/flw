package com.ksg.formslibrary.service;

import java.util.List;
import java.util.Map;

import com.ksg.formslibrary.domain.CodeValue;

public interface ListValueService {

	Map<String, List<CodeValue>> getListValues(String affiliate);
	
	void resetCache(String affiliate);
}
