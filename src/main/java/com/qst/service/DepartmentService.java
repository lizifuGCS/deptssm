package com.qst.service;

import com.qst.bean.Department;
import com.qst.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDept(){
        List<Department> list =   departmentMapper.selectByExample(null);

        return  list;

    }
}
