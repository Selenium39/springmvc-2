package com.wantao.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wantao.bean.Employee;
import com.wantao.dao.DepartmentDao;
import com.wantao.dao.EmployeeDao;

/*
 *@author:wantao
 *@time:Jul 20, 2018 9:55:37 PM
 *@description:
 */
@Controller
public class CRUDController {
	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	public String show(Map<String, Object> map) {
		// 获取所有的员工
		map.put("employees", EmployeeDao.getAllEmployees());
		map.put("ids", EmployeeDao.getAllEmployeesIds());
		return "show";
	}

	@RequestMapping(value = "/beforeAddEmployee/{id}", method = RequestMethod.GET)
	public String beforeAddEmployee(Map<String, Object> map, @PathVariable("id") Integer id, HttpSession session) {
		Employee employee = null;
		// 获取所有的性别
		Map<Integer, Object> genders = new HashMap<Integer, Object>();
		genders.put(0, "男");
		genders.put(1, "女");
		if (id == 0) {
			employee = new Employee();
		} else {
			// 表单回显
			employee = EmployeeDao.getEmployeeById(id);
			session.setAttribute("id", id);

		}
		map.put("command", employee);// 没有指定modelAttribute属性,则默认key为command
		// 获取所有的部门信息
		map.put("departments", DepartmentDao.getAllDepartment());
		map.put("genders", genders);
		map.put("id", id);
		return "addEmployee";

	}

	@RequestMapping(value = "/employees/{id}", method = RequestMethod.DELETE)
	public String deleteEmployee(@PathVariable("id") Integer id) {
		EmployeeDao.deleteEmployee(id);
		return "redirect:/employees";
	}

	@RequestMapping(value = "**/employees", method = RequestMethod.POST)
	public String addEmployee(Employee employee) {
		EmployeeDao.addEmployee(employee);
		return "redirect:/employees";
	}

	@RequestMapping(value = "**/employees", method = RequestMethod.PUT)
	public String updateEmployee(Employee employee, HttpSession session) {
		EmployeeDao.updateEmployee((Integer) session.getAttribute("id"), employee);
		return "redirect:/employees";
	}
}
