package edu.school.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.school.entity.Course;
import edu.school.entity.Xkjl;
import edu.school.service.CourseService;
import edu.school.service.XkjlService;
import edu.school.service.impl.CourseServiceImpl;
import edu.school.service.impl.XkjlServiceImpl;
import edu.school.utils.WebUtils;


public class XkjlServlet extends BaseServlet {
    private XkjlService xs=new XkjlServiceImpl();
    private CourseService cs=new CourseServiceImpl();

    //分页查询选课记录
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
        String p=request.getParameter("p");//接收页码
        System.out.println(p);
        int pageSize=6;//每页显示5条
        int pageNum=1; //默认第一页
        if(p!=null){
            pageNum= Integer.parseInt(p);
        }
        //调用分页查询
        //List<Xkjl> list=xs.getPage(pageNum,pageSize);
        //携带参数到页面
    
        List<Map<String,Object>> list=xs.selectdoubleList(pageNum, pageSize);
        request.setAttribute("xkjlList",list); //绑定参数
        int nums=xs.queryCount(); //查询总数
        //计算总页数
        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
        request.setAttribute("cp",pageNum); //当前页
        request.setAttribute("tp",totalPage); //总页数

        //条件 值1：值2
        request.getRequestDispatcher("/WEB-INF/xkjl/xkjl_list.jsp").forward(request,response); //页面转发

    }
    
    
    
    //我要选课
    protected void xuanke(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加

        String stuno=request.getParameter("stuno");
        String sname=request.getParameter("sname");
        String c_id=request.getParameter("id");
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String temp_str=sdf.format(dt);
        int b= xs.addXkjl(new Xkjl(null,stuno,sname,c_id,temp_str));
        if(b==1){
            response.sendRedirect(request.getContextPath()+"/XkjlServlet?action=myXuanke&stuno="+stuno);//重定向防止重复提交哦
        }

    }

    //回显选课信息
     protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
         int x_id=WebUtils.parseInt(request.getParameter("x_id"),0);
         System.out.println(x_id+"*******************");
         Xkjl record=xs.queryById(x_id);
         request.setAttribute("xkjl",record);
         List<Course> list=cs.selectAll();
         request.setAttribute("xkjl2",list);     
         request.getRequestDispatcher("/WEB-INF/xkjl/xkjl_edit.jsp").forward(request,response);
    }

     
     //编辑选课信息
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改
        int x_id= WebUtils.parseInt(request.getParameter("x_id"),0);
        String stuno=request.getParameter("stuno");
        String sname=request.getParameter("sname");
        String c_id=request.getParameter("c_id");
       int b= xs.update(new Xkjl(x_id,stuno,sname,c_id,null));
       if(b==1){
           response.sendRedirect(request.getContextPath()+"/XkjlServlet?action=list");//重定向防止重复提交哦
       }

    }
    
    //根据id删除选课记录
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
        int id=WebUtils.parseInt(request.getParameter("id"),0);
        xs.deleteById(id);
        response.sendRedirect(request.getContextPath()+"/XkjlServlet?action=list");//重定向防止重复提交哦
    }

    
    //根据学号和学生姓名查询
    protected void findByMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String stuno=request.getParameter("stuno");
        String sname=request.getParameter("sname");
        List<Map<String, Object>>  list=xs.findByMap(stuno,sname);
        if(null == list || list.size() ==0 ){
            request.setAttribute("msg" ,"无此信息");
            request.getRequestDispatcher("/WEB-INF/xkjl/list_xkjl.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/xkjl/list_xkjl.jsp").forward(request, response);
        }
    }
    
    //我的选课信息
    protected void myXuanke(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String stuno=request.getParameter("stuno");   
        List<Map<String, Object>>  list=xs.findByStuno(stuno);
        if(null == list || list.size() ==0 ){
            request.setAttribute("msg" ,"没有选课信息");
            request.getRequestDispatcher("/WEB-INF/xkjl/myxk_list.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/xkjl/myxk_list.jsp").forward(request, response);
        }
    }
   

}
