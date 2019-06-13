package com.qst.service;


import com.qst.bean.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> getAll();


    void saveEmp(Employee employee);

    boolean checkuser(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteEmp(Integer empId);
}
