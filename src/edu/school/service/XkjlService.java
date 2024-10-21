package edu.school.service;

import edu.school.entity.Xkjl;
import edu.school.entity.Course;

import java.util.List;
import java.util.Map;

public interface XkjlService {
    public int addXkjl(Xkjl record);//保存选课记录
    public List<Xkjl> getPage(int pageNum, int pageSize);
    public  List<Map<String, Object>>  findByMap(String stuno,String sname);//条件查询
    List<Map<String, Object>> selectdoubleList(int pageNum, int pageSize);//多表查询
    public int queryCount();//统计数量
    public int deleteById(Integer x_id);//根据id删除
    public Xkjl queryById(Integer x_id);//根据id更改
    public int update(Xkjl record);//更改
    public  List<Map<String, Object>>  findByStuno(String stuno);//查询我的选课信息
}
