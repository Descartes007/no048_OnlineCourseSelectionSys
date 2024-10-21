package edu.school.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.school.entity.Admin;
import edu.school.entity.Student;
import edu.school.service.AdminService;
import edu.school.service.StudentService;
import edu.school.service.impl.AdminServiceImpl;
import edu.school.service.impl.StudentServiceImpl;
import edu.school.utils.WebUtils;

public class StudentServlet extends BaseServlet {
    private StudentService service=new StudentServiceImpl();
    private AdminService as=new AdminServiceImpl();
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理登录
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
       
        if(type.equals("1")) {
        	 Student student = service.login(new Student(null, account, null,password,null,null,null,null));
			 if (student == null) {
				  System.out.println("1*********");
				  request.setAttribute("msg","学号或者密码错误"); //绑定参数
				  request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
             } else {
            	 System.out.println("2*********");
            	  request.getSession().setAttribute("type",1);
                 request.getSession().setAttribute("student",student);
                 request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request,response);
             }
        }else {

			 Admin admin = as.login(new Admin(null,account, password));
			 if (admin == null) {
				  request.setAttribute("msg","管理员或者密码错误"); //绑定参数
				  request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
           } else {
        	   request.getSession().setAttribute("type",2);
               request.getSession().setAttribute("admin",admin);
               request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request,response);
           }
        	
        }
 
        

    }
    //分页查询学生信息
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
        String p=request.getParameter("p");//接收页码
        System.out.println(p);
        int pageSize=6;//每页显示5条
        int pageNum=1; //默认第一页
        if(p!=null){
            pageNum= Integer.parseInt(p);
        }
        //调用分页查询
        List<Student> bList=service.getPage(pageNum,pageSize);
        //携带参数到页面
        request.setAttribute("studentList",bList); //绑定参数
        int nums=service.queryCount(); //查询总数
        //计算总页数
        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
        request.setAttribute("cp",pageNum); //当前页
        request.setAttribute("tp",totalPage); //总页数

        //条件 值1：值2
        request.getRequestDispatcher("/WEB-INF/student/student_list.jsp").forward(request,response); //页面转发

    }

		
	//添加学生信息
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加
        String stuno=request.getParameter("stuno");
        String sname=request.getParameter("sname");
        String pwd=request.getParameter("pwd");
        String sex=request.getParameter("sex");
        String major=request.getParameter("major");
        String bj=request.getParameter("bj");
        String grade=request.getParameter("grade");
        if(service.existsStuno(stuno)){

            request.setAttribute("msg","该学号已存在");
            request.setAttribute("stuno",stuno);
            request.setAttribute("sname",sname);
            request.getRequestDispatcher("/WEB-INF/student/student_edit.jsp").forward(request,response);//返回到登陆界面
        }else {
            service.registerStudent(new Student(null,stuno,sname,pwd,major,sex,bj,grade));
            response.sendRedirect(request.getContextPath()+"/StudentServlet?action=list");//重定向防止重复提交哦

        }
    }

    	//根据id查询
     protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
         int id=WebUtils.parseInt(request.getParameter("id"),0);
         Student student=service.queryById(id);
         request.setAttribute("student",student);
       
         request.getRequestDispatcher("/WEB-INF/student/student_edit.jsp").forward(request,response);
    }

     //查询学生个人信息
    protected void findMyInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询个人信息
        String stuno=request.getParameter("stuno");
        Student student=service.findByStuno(stuno);
        request.setAttribute("student",student);
        System.out.println(student);
        request.getRequestDispatcher("/WEB-INF/student/student_info.jsp").forward(request,response);
    }

    //编辑学生信息
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改
        int id= WebUtils.parseInt(request.getParameter("id"),0);
        String stuno=request.getParameter("stuno");
        String sname=request.getParameter("sname");
        String pwd=request.getParameter("pwd");
        String sex=request.getParameter("sex");
        String major=request.getParameter("major");
        String bj=request.getParameter("bj");
        String grade=request.getParameter("grade");
        String type=request.getParameter("type");
        if (type.equals("1")) {
            service.update(new Student(id,stuno,sname,pwd,major,sex,bj,grade));
            request.getRequestDispatcher("/WEB-INF/student/edit_success.jsp").forward(request,response);
            //response.sendRedirect(request.getContextPath()+"/StudentServlet?action=findMyInfo&stuno="+stuno);//重定向防止重复提交哦
        }else {
            service.update(new Student(id,stuno,sname,pwd,major,sex,bj,grade));
            response.sendRedirect(request.getContextPath()+"/StudentServlet?action=list");//重定向防止重复提交哦
        }



    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
        int id=WebUtils.parseInt(request.getParameter("id"),0);
        service.delete(id);
        response.sendRedirect(request.getContextPath()+"/StudentServlet?action=list"); //重定向防止重复提交哦
    }

    protected void findByMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String stuno=request.getParameter("stuno");
        List<Student> list=service.findByMap(stuno);
        if(null == list || list.size() ==0 ){
            request.setAttribute("msg" ,"无此信息");
            request.getRequestDispatcher("/WEB-INF/student/list_student.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/student/list_student.jsp").forward(request, response);
        }
    }

    //学生注册
    protected void registe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理注册
    	  String stuno=request.getParameter("stuno");
          String sname=request.getParameter("sname");
          String pwd=request.getParameter("pwd");
          String sex=request.getParameter("sex");
          String major=request.getParameter("major");
          String bj=request.getParameter("bj");
          String grade=request.getParameter("grade");
          //String type=request.getParameter("type");
        if(service.existsStuno(stuno)){
            System.out.println(stuno+"该学号已存在");
            request.setAttribute("msg","该学号已存在");
            request.setAttribute("sname",sname);     
            request.getRequestDispatcher("/WEB-INF/views/registe.jsp").forward(request,response);
        }else{
            service.registerStudent(new Student(null,stuno,sname,pwd,sex,major,bj,grade));
            request.getRequestDispatcher("/WEB-INF/views/registe_success.jsp").forward(request,response);
        }
    }


   
    
    //学生注册
    protected void toRegiste(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
        request.getRequestDispatcher("/WEB-INF/views/registe.jsp").forward(request,response);
    }

    protected void toMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理注册
        request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request,response);
    }

    protected void welcome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理注册
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,response);
    }

    protected void toLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到登陆界面
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
    }
    protected void toAddStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/student/student_edit.jsp").forward(request,response);
    }
    
    protected void toEditStudentPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/student/edit_stupwd.jsp").forward(request,response);
    }
    
    //学生修改密码
    protected void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
    	
        String stuno=request.getParameter("stuno");
        String pwd=request.getParameter("pwd");      
        int b=service.updatePwd(new Student(null,stuno,null,pwd,null,null,null,null));
        if(b==1) {
       	  request.getRequestDispatcher("/WEB-INF/student/edit_success.jsp").forward(request,response);
        }
          
       


  }
  
}
