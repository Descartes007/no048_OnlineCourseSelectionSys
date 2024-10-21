package edu.school.dao;

import edu.school.entity.Course;
import edu.school.entity.Admin;

import java.util.List;

public interface CourseDao {
    public int save(Course record);//保存景点信息
    public Course query(Integer id);//根据id更改
    public int update(Course record);//更改
    public List<Course> getPage(int pageNum, int pageSize);
    public List<Course> selectAll();//查询所有课程
    public List<Course> findByMap(String cno,String cname);//条件查询
    public int queryCount();//统计数量
    public int delete(Integer id);//根据id删除
}
