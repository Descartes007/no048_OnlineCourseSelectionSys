package edu.school.service.impl;

import java.util.List;

import edu.school.dao.StudentDao;
import edu.school.dao.impl.StudentDaoImpl;
import edu.school.entity.Student;
import edu.school.service.StudentService;

public class StudentServiceImpl implements StudentService {
    private StudentDao dao=new StudentDaoImpl();

    public void registerStudent(Student record) {
        dao.save(record);
    }


    public Student login(Student record) {
    	return dao.queryByStunoAndPwd(record.getStuno(), record.getPwd());

    }


    public boolean existsStuno(String stuno) {
        if(dao.queryByStuno(stuno)==null){
            return false;//表示不可以用
        }
        return true;//表示可以用

    }

    
    public List<Student> getPage(int pageNum, int pageSize) {
        return dao.getPage(pageNum,pageSize);
    }


   
    public List<Student> findByMap(String stuno) {
        return dao.findByMap(stuno);
    }

    
    public int queryCount() {
        return dao.queryCount();
    }

    
    public int update(Student record) {
        return dao.update(record);
    }

   
    public int delete(Integer id) {
        return dao.delete(id);
    }

    
    public Student queryById(Integer id) {
        return dao.query(id);
    }

   
    public Student findByStuno(String stuno) {
        return dao.queryByStuno(stuno);
    }


    public int updatePwd(Student record) {
        return dao.update(record);
    }
}
