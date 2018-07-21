package com.wantao.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.wantao.bean.Department;

/*
 *@author:wantao
 *@time:Jul 20, 2018 9:38:12 PM
 *@description:使用Map集合模拟数据库
 */
public class DepartmentDao {
	private static Map<Integer, Department> departments;
	static {
		departments = new HashMap<Integer, Department>();
		departments.put(1, new Department(1, "行政部"));
		departments.put(2, new Department(2, "人事部"));
	}

	public static Collection getAllDepartment() {
		return departments.values();
	}

	public static Department getDepartmentById(Integer id) {
		return departments.get(id);
	}

}
