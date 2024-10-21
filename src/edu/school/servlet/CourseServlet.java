package edu.school.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.school.entity.Course;
import edu.school.service.CourseService;
import edu.school.service.impl.CourseServiceImpl;
import edu.school.utils.WebUtils;


public class CourseServlet extends BaseServlet {
    private CourseService service=new CourseServiceImpl();

    //分页查询
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
        String p=request.getParameter("p");//接收页码
        System.out.println(p);
        int pageSize=6;//每页显示5条
        int pageNum=1; //默认第一页
        if(p!=null){
            pageNum= Integer.parseInt(p);
        }
        //调用分页查询
        List<Course> list=service.getPage(pageNum,pageSize);
        //携带参数到页面
        request.setAttribute("courseList",list); //绑定参数
        int nums=service.queryCount(); //查询总数
        //计算总页数
        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
        request.setAttribute("cp",pageNum); //当前页
        request.setAttribute("tp",totalPage); //总页数

        //条件 值1：值2
        request.getRequestDispatcher("/WEB-INF/course/course_list.jsp").forward(request,response); //页面转发

    }

    //添加课程信息
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加
        Course record=WebUtils.copyParamToBean(request.getParameterMap(),new Course());//使用一个BeanUtils的工具类，优化request.getParamter的代码。
        //**测试request.getParamterMap都有哪些内容*//*
        Map<String,String []> map=request.getParameterMap();
        for(Map.Entry<String,String[]> entry:map.entrySet()){
            System.out.println(entry.getKey()+"="+ Arrays.asList(entry.getValue()));
        }
        int b=service.addCourse(record);
        if(b==1){
            response.sendRedirect(request.getContextPath()+"/CourseServlet?action=list");//重定向防止重复提交哦
        }

    }
    
    //根据id查询
     protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
         int id=WebUtils.parseInt(request.getParameter("id"),0);
         Course record=service.queryById(id);
         request.setAttribute("course",record);
        
         request.getRequestDispatcher("/WEB-INF/course/course_edit.jsp").forward(request,response);
    }

     //根据id修改
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改
        int id= WebUtils.parseInt(request.getParameter("id"),0);
        String cno=request.getParameter("cno");
        String cname=request.getParameter("cname");
        String tname=request.getParameter("tname");
        String place=request.getParameter("place");
        String weekday=request.getParameter("weekday");
        String sxw=request.getParameter("sxw");
        String lesson=request.getParameter("lesson");

       int b= service.update(new Course(id,cno,cname,tname,place,weekday,sxw,lesson));
       if(b==1){
           response.sendRedirect(request.getContextPath()+"/CourseServlet?action=list");//重定向防止重复提交哦
       }



    }
    
    //根据id删除
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
        int id=WebUtils.parseInt(request.getParameter("id"),0);
        service.deleteById(id);
        response.sendRedirect(request.getContextPath()+"/CourseServlet?action=list");//重定向防止重复提交哦
    }

    //多条件查询
    protected void findByMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String cname=request.getParameter("cname");
        String cno=request.getParameter("cno");
        List<Course> list=service.findByMap(cno,cname);
        if(null == list || list.size() ==0 ){
            request.setAttribute("msg" ,"无此信息");
            request.getRequestDispatcher("/WEB-INF/course/list_course.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/course/list_course.jsp").forward(request, response);
        }
    }

    //跳转到添加课程页面
    protected void toAddCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面

        request.getRequestDispatcher("/WEB-INF/course/course_edit.jsp").forward(request,response);
    }

}
