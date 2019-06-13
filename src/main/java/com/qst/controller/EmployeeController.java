package com.qst.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qst.bean.Employee;
import com.qst.bean.Msg;
import com.qst.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;


    /*删除单个员工信息*/
    @RequestMapping(value = "/deleteEmp/{empId}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable Integer empId){

        employeeService.deleteEmp(empId);

        return Msg.success();
    }



    /*
    * 更新用户信息
    * */
    @RequestMapping(value = "/updateEmp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){

        employeeService.updateEmp(employee);

        return Msg.success();
    }




/*
* 根据Id值来获取员工数据
* */
    @RequestMapping(value = "/getEmp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public  Msg getEmp(@PathVariable Integer id){

       Employee employee = employeeService.getEmp(id);

        return  Msg.success().add("employee",employee);
    }

/*
*
* 检查用户名是否重复
* */
    @RequestMapping("/checkuser")
    @ResponseBody
    public  Msg checkuser(@RequestParam("empName") String empName){
        /*后端格式校验*/
        String regax = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{3,16})";
        if(!empName.matches(regax)){
                return Msg.fail().add("va_msg","用户名必须是3-16位数字和字母或者是3-16位的汉字");
        }

    /*数据库取值校验*/
      boolean b =  employeeService.checkuser(empName);
      if (b){
          return Msg.success();
      }else {
          return Msg.fail().add("va_msg","用户名不可用");
      }


    }

/*
*
* 保存用户，进行后端的JSR303检验
* */
    @RequestMapping(value = "/saveEmp",method = RequestMethod.POST)
    @ResponseBody
    public  Msg saveEmp(@Valid Employee employee, BindingResult result){
        /*后端JSR303校验*/
        Map<String,Object> map = new HashMap<String,Object>();
        if (result.hasErrors()){
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError errors:fieldErrors) {
                System.out.println("错误的字段名："+errors.getField());
                System.out.println("错误的信息："+errors.getDefaultMessage());
                map.put(errors.getField(),errors.getDefaultMessage());
            }
            return Msg.fail().add("errorFiles",map);

        }else {
            employeeService.saveEmp(employee);

            return Msg.success();
        }

    }



    /*
    * 查询数据库员工信息在页面进行展示
    *
    * */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg toPage(@RequestParam(value = "pn",defaultValue ="1") Integer pn){
        /*pageHelper的插件*/
        PageHelper.startPage(pn,5);

       List<Employee> emps =employeeService.getAll();


      PageInfo page = new PageInfo(emps,5);


        return Msg.success().add("page",page);

    }


}
