package edu.school.service.impl;

import java.util.List;
import java.util.Map;

import edu.school.dao.XkjlDao;
import edu.school.dao.impl.XkjlDaoImpl;
import edu.school.entity.Xkjl;
import edu.school.service.XkjlService;


public class XkjlServiceImpl implements XkjlService {
    private XkjlDao dao=new XkjlDaoImpl();
    public int addXkjl(Xkjl record) {
        return dao.save(record);
    }

   
    public List<Xkjl> getPage(int pageNum, int pageSize) {
        return dao.getPage(pageNum,pageSize);
    }


    public  List<Map<String, Object>>  findByMap(String stuno,String sname) {
        return dao.findByMap(stuno,sname);
    }


    public int queryCount() {
        return dao.queryCount();
    }

   
    public int deleteById(Integer x_id) {
        return dao.delete(x_id);
    }

    
    public Xkjl queryById(Integer x_id) {
        return dao.query(x_id);
    }


    public int update(Xkjl record) {
        return dao.update(record);
    }


	public List<Map<String, Object>> selectdoubleList(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return dao.selectdoubleList(pageNum, pageSize);
	}


	public List<Map<String, Object>> findByStuno(String stuno) {
		// TODO Auto-generated method stub
		return dao.findByStuno(stuno);
	}
}
