package edu.school.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


public class LoginFilter implements Filter {
    private String errorPage="index.jsp";
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();

        Object student = session.getAttribute("student");
        Object admin = session.getAttribute("admin");
        PrintWriter out = response.getWriter();
        if(admin != null||student!=null){

            chain.doFilter(request,response);

        } else{

            out.println("您还未登陆，三秒钟后跳转至登录页面");

            response.setHeader("refresh","3;/WEB-INF/views/login.jsp");

          

        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
