package edu.school.dao;

import edu.school.entity.Admin;

public interface AdminDao {
    public Admin queryByUsernameAndPassword(String username, String password);//根据管理员账号和密码来登录
    public int updatePwd(Admin record);//根据id数量
}
