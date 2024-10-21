package edu.school.dao;

import java.util.List;
import java.util.Map;

import edu.school.entity.Xkjl;

public interface XkjlDao {
    public int save(Xkjl Xkjl);//保存选课记录
    public Xkjl query(Integer x_id);//根据id更改
    public int update(Xkjl record);//更改
    public List<Xkjl> getPage(int pageNum, int pageSize);
    List<Map<String, Object>> selectdoubleList(int pageNum, int pageSize);//多表查询
    public List<Map<String, Object>> findByMap(String stuno,String sname);//条件查询
    public int queryCount();//统计数量
    public int delete(Integer x_id);//根据id删除
    public List<Map<String, Object>> findByStuno(String stuno);//查询我的选课
}
