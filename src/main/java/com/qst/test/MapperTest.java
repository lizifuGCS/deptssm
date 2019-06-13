package com.qst.test;



import com.qst.bean.Employee;
import com.qst.mapper.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class MapperTest {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private SqlSession sqlSession;

    @Test
    public void  testCRUD(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0;i<1000;i++){
            employeeMapper.insertSelective(new Employee(null,"李自富"+i,"男","li@qq.com",2));
        }
    }
}
