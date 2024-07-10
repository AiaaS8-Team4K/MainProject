package com.AiaaS.Team4K.dao;

import org.apache.ibatis.annotations.Param;

public interface ITestRepository {
	int getEmpCount();
	int getEmpCount(@Param("deptid")int deptid);
}
