package com.wantao.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.wantao.bean.Department;
import com.wantao.bean.Employee;

/*
 *@author:wantao
 *@time:Jul 20, 2018 9:37:58 PM
 *@description:
 */
public class EmployeeDao {
	private static Map<Integer, Employee> employees;
	static {
		employees = new HashMap<Integer, Employee>();
		employees.put(1, new Employee(1, "万涛", "895484122@qq.com", 0, DepartmentDao.getDepartmentById(1)));
		employees.put(2, new Employee(2, "万晓菲", "895484123@qq.com", 1, DepartmentDao.getDepartmentById(2)));
		employees.put(3, new Employee(3, "万超", "895484124@qq.com", 0, DepartmentDao.getDepartmentById(2)));
	}

	// 这里没有使用Map,是因为在前端遍历时如果是Map比较麻烦,先要遍历Key再遍历Value
	public static Collection getAllEmployees() {
		return employees.values();
	}

	public static Collection getAllEmployeesIds() {
		return employees.keySet();
	}

	public static void deleteEmployee(Integer id) {
		employees.remove(id);
	}

	private static Integer key = 4;

	public static void addEmployee(Employee employee) {
		employee.setId(key);
		Integer deptId = Integer.valueOf(employee.getDepartment().getDeptName());
		DepartmentDao.getDepartmentById(deptId);
		Department department = employee.getDepartment();
		if (department.getDeptName().equals("1")) {
			department.setDeptName("行政部");
		} else {
			department.setDeptName("人事部");
		}
		employee.setDepartment(department);
		employees.put(key++, employee);
	}

	public static Employee getEmployeeById(Integer id) {
		return employees.get(id);
	}
	public static void updateEmployee(Integer id,Employee employee) {
		employees.replace(id, employee);
	}

}
