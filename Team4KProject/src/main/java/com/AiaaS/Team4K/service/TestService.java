package com.AiaaS.Team4K.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AiaaS.Team4K.dao.ITestRepository;

@Service
public class TestService {

	@Autowired
	@Qualifier("ITestRepository")
	ITestRepository testRepository;
	
	public int getEmpCount() {
		return testRepository.getEmpCount();
	}

	public int getEmpCount(int deptid) {
		return testRepository.getEmpCount(deptid);
	}
	
}
