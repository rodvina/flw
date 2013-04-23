package com.ksg.formslibrary.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import com.ksg.formslibrary.domain.CodeValue;

@Repository
public class ListValueDAOImpl implements ListValueDAO {

	@Override
	public List<CodeValue> getAllStates() {
		return Arrays.asList(new CodeValue[] {
				new CodeValue("01", "Alabama"),
				new CodeValue("02", "Alaska"),
				new CodeValue("03", "Arizona"),
				new CodeValue("04", "Arkansas"),
				new CodeValue("05", "California"),
				new CodeValue("06", "Colorado"),
				new CodeValue("07", "Connecticut")
				
		});
	}

	@Override
	public List<CodeValue> getAllLOBs() {
		return Arrays.asList(new CodeValue[] {
				new CodeValue("01", "Auto Monoline"),
				new CodeValue("02", "Auto Package"),
				new CodeValue("03", "Home Monoline"),
				new CodeValue("04", "Home Package")				
		});
	}

	@Override
	public List<CodeValue> getAllPolicyTypes() {
		return Arrays.asList(new CodeValue[] {
				new CodeValue("01", "Auto Single"),
				new CodeValue("02", "Auto Split"),
				new CodeValue("03", "HE 7"),
				new CodeValue("04", "HO-2/HO-A+"),
				new CodeValue("05", "HO-3/HO-B"),
				new CodeValue("06", "HO-4/HO-BT"),
				new CodeValue("07", "HO-5/HO-C")
				
		});
	}

	@Override
	public List<CodeValue> getAllCompanies() {
		return Arrays.asList(new CodeValue[] {
				new CodeValue("01", "AMICO - American Independent Insurance Co"),
				new CodeValue("02", "AMM"),
				new CodeValue("03", "AMPICO"),
				new CodeValue("04", "KGA"),
				new CodeValue("05", "KIC"),
				new CodeValue("06", "LMC"),
				new CodeValue("07", "TLOYDS")
				
		});
	}

	@Override
	public List<CodeValue> getAllFormTypes() {
		return Arrays.asList(new CodeValue[] {
				new CodeValue("01", "Endorsement"),
				new CodeValue("02", "Insert")
				
		});
	}

	@Override
	public List<CodeValue> getAllMandOpt() {
		return Arrays.asList(new CodeValue[] {
			new CodeValue("01", "Mandatory"),
			new CodeValue("02", "Optional")
		});
	}
}
