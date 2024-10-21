package edu.school.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import edu.school.dao.CourseDao;
import edu.school.entity.Course;
import edu.school.utils.C3p0Utils;

public class CourseDaoImpl implements CourseDao {
    private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());


    public int save(Course record) {
        try {
            //执行插入sql
            runner.update("insert into course(cno,cname,tname,place,weekday,sxw,lesson) values (?,?,?,?,?,?,?)",
            		record.getCno(),record.getCname(),record.getTname(),record.getPlace(),record.getWeekday(),record.getSxw(),record.getLesson());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;
    }

  


   //修改课程信息
    public int update(Course record) {
        try {
            //执行插入sql
            runner.update("update course set cno=?,cname=?,tname=?,place=?,weekday=?,sxw=?,lesson=? where id=?",
            		record.getCno(),record.getCname(),record.getTname(),record.getPlace(),record.getWeekday(),record.getSxw(),record.getLesson(),record.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;

    }
    
    //查询所有
    public List<Course> selectAll() {
		try {
			return runner.query("select * from course", new BeanListHandler<Course>(Course.class));//添加实体类的适配器进行类的反射
		} catch (SQLException e) {//捕获异常
			throw new RuntimeException(e);//抛出运行异常
		}

	}
    
 
   

    
    //分页查询
    public List<Course> getPage(int pageNum, int pageSize) {
        String sql="select * from course  limit ?,?";
        int startNo=(pageNum-1)*pageSize;
        List<Course> list=null;
        try {
            list= runner.query(sql, new BeanListHandler<Course>(Course.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
            return list;
        } catch (SQLException e) {//捕获异常
            throw new RuntimeException(e);//抛出运行异常
        }
    }

    //多条件查询
    public List<Course> findByMap(String cno,String cname) {
        String sql="select * from course where 1=1 ";
        List<Course> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (cno != "") {
            //如果用户输入的cno不为空，那需要进行字符串拼接
            sql += " and cno like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + cno + "%");
        }
        if (cname != "") {
            sql += "and cname like ? ";
            list1.add("%" + cname + "%");
        }

        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params, new BeanListHandler<Course>(Course.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    //统计数量
    public int queryCount() {
        String sql="select count(*) from course";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

   
    //根据id删除
    public int delete(Integer id) {
        try {
            //执行删除的sql
            runner.update("delete from course where id=?",id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }

    //根据id查询
	public Course query(Integer id) {
		 try {//返回查询的信息
	            return runner.query("select * from course where id=?", new BeanHandler<Course>(Course.class),id);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
	}
}
