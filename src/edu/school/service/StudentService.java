package edu.school.service;

import edu.school.entity.Student;

import java.util.List;

public interface StudentService {
    /*
    注册学号
   */
    public void registerStudent(Student record);
    /*
      登录,返回null,表示登录失败，返回有个值，表示登陆成功。
     */
    public Student login(Student record);

    /*
     判断用户是否存在,返回true表示学生已经存在，返回false表示该学号可以用
    */
    public boolean existsStuno(String stuno);
    public List<Student> getPage(int pageNum, int pageSize);//分页查询
    public List<Student> findByMap(String stuno);//条件查询
    public int queryCount();//统计数量
    public int update(Student record);//修改
    public int delete(Integer id);//根据id数量
    public Student queryById(Integer id);//根据id查询
    public Student findByStuno(String stuno);
    public int updatePwd(Student user);
}
