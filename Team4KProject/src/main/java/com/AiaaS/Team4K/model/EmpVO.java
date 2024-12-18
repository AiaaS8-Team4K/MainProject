package com.AiaaS.Team4K.model;

import java.sql.Date;

import lombok.Data;

@Data
public class EmpVO {
	
	private int employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private String jobId;
	private double salary;
	private double commissionPct;
	private int managerId;
	private int departmentId;
}
