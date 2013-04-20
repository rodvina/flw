package com.ksg.formslibrary.service;

import java.util.List;
import java.util.Map;

import com.ksg.formslibrary.domain.KeyValue;
import com.ksg.formslibrary.domain.ListValues;

public interface ListValueService {

	Map<String, List<KeyValue>> getListValues();
}
