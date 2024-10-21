package edu.school.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import edu.school.dao.AdminDao;
import edu.school.entity.Admin;
import edu.school.utils.C3p0Utils;

public class AdminDaoImpl implements AdminDao {
	private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

	
	//根据用户名和密码查询
	public Admin queryByUsernameAndPassword(String username, String password) {
		 try {
	            return runner.query("select * from admin where username=? and password=?", new BeanHandler<Admin>(Admin.class),username,password);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
	}
	

	public int updatePwd(Admin record) {
		try {//执行更改
            runner.update("update admin set password=? where username=?",
            		record.getPassword(),record.getUsername());
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
        return 1;
	}

}
