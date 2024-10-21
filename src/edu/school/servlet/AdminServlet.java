package edu.school.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.school.entity.Admin;
import edu.school.entity.Student;
import edu.school.service.AdminService;
import edu.school.service.impl.AdminServiceImpl;
import edu.school.utils.WebUtils;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private AdminService as=new AdminServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //管理员修改密码
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
    	
         String username=request.getParameter("username");
         String password=request.getParameter("password");      
         int b=as.updatePwd(new Admin(null,username,password));
         if(b==1) {
        	  request.getRequestDispatcher("/WEB-INF/admin/edit_success.jsp").forward(request,response);
         }
           
        


   }
    protected void toEditPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/admin/pwd_edit.jsp").forward(request,response);
	}
	
	//加载菜单栏
	protected void toMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
	        request.getRequestDispatcher("/WEB-INF/views/menu.jsp").forward(request,response);
	}
	
	//加载顶部
	protected void toTop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/views/top.jsp").forward(request,response);
	}
	
	
	//加载主题
	protected void toWelcome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,response);
	}

	//注销登录
	 protected void loginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//退出
	        request.getSession().invalidate();
	  }
}
