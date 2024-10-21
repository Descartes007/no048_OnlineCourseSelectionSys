package edu.school.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import edu.school.dao.XkjlDao;
import edu.school.entity.Student;
import edu.school.entity.Xkjl;
import edu.school.utils.C3p0Utils;

public class XkjlDaoImpl implements XkjlDao {
    private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

    //插入选课记录
    public int save(Xkjl record) {
        try {
            //执行插入sql
            runner.update("insert into xkjl(stuno,sname,c_id,createTime) values (?,?,?,?)",
            		record.getStuno(),record.getSname(),record.getC_id(),record.getCreateTime());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;
    }

  
  

   //更改选课记录
    public int update(Xkjl record) {
        try {
            //执行插入sql
            runner.update("update xkjl set stuno=?,sname=?,c_id=? where x_id=?",
            		record.getStuno(),record.getSname(),record.getC_id(),record.getX_id());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;

    }

    
    //查选课
    public List<Xkjl> getPage(int pageNum, int pageSize) {
        String sql="select * from xkjl limit ?,?";
        int startNo=(pageNum-1)*pageSize;
        List<Xkjl> list=null;
        try {
            list= runner.query(sql, new BeanListHandler<Xkjl>(Xkjl.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
            return list;
        } catch (SQLException e) {//捕获异常
            throw new RuntimeException(e);//抛出运行异常
        }
    }
    //查寻选课记录
    public List<Map<String, Object>> selectdoubleList(int pageNum, int pageSize) {
    	List<Map<String, Object>> list=null;
    	   int startNo=(pageNum-1)*pageSize;
    	 String sql="select x.*,c.* from xkjl x,course c where x.c_id=c.id limit ?,?";
    	 try {
             list= runner.query(sql, new MapListHandler(),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
             return list;
         } catch (SQLException e) {//捕获异常
             throw new RuntimeException(e);//抛出运行异常
         }
    }


    public List<Map<String, Object>> findByMap(String stuno,String sname) {
        String sql="select x.*,c.* from xkjl x,course c where x.c_id=c.id  ";
        List<Map<String, Object>> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (stuno != "") {
            //如果用户输入的stuno不为空，那需要进行字符串拼接
            sql += "and stuno like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + stuno + "%");
        }
        if (sname != "") {
            //如果用户输入的sname不为空，那需要进行字符串拼接
            sql += "and   sname like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + sname + "%");
        }

        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params,  new MapListHandler());
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    //统计选课记录数量
    public int queryCount() {
        String sql="select count(*) from xkjl";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

   //删除选课记录
    public int delete(Integer x_id) {
        try {
            //执行删除的sql
            runner.update("delete from xkjl where x_id=?",x_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }




	public Xkjl query(Integer x_id) {
		 try {//返回查询的信息
	            return runner.query("select * from xkjl where x_id=?", new BeanHandler<Xkjl>(Xkjl.class),x_id);
	        } catch (SQLException e) {
	        	 throw new RuntimeException(e);//抛出运行异常 
	}
		
	}




	public List<Map<String, Object>> findByStuno(String stuno) {
		 String sql="select x.*,c.* from xkjl x,course c where x.c_id=c.id  ";
	        List<Map<String, Object>> list=null;
	        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
	        List<String> list1 = new ArrayList<String>();
	        if (stuno != "") {
	            //如果用户输入的stuno不为空，那需要进行字符串拼接
	            sql += "and stuno like  ? ";
	            //将用户输入的参数添加到集合
	            list1.add("%" + stuno + "%");
	        }
	        

	        Object[] params = list1.toArray();
	        try {
	            list=runner.query(sql,params, new MapListHandler());
	            System.out.println(list.size());
	            return list;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException(e);
	        }
	}
}
