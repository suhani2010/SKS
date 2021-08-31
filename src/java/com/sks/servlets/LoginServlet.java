
package com.sks.servlets;



import com.sks.entities.Message;
import com.sks.dao.UserDao;
import com.sks.entities.User;
import com.sks.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ConnectException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       String userEmail=request.getParameter("email");
       String userPassword=request.getParameter("password");
       // System.out.println(userPassword);
       UserDao dao=new UserDao(ConnectionProvider.getConnection());
       User userDetails=dao.getUserByEmailAndPassword(userEmail, userPassword);
       if(userDetails==null){
           //login error
           //out.println("Invalid details...please try again");
           Message msg=new Message("Invalid details...please try again","error","alert-danger");
           HttpSession session=request.getSession();
           session.setAttribute("msg",msg);
           response.sendRedirect("login_page.jsp");
       }
       else{
           //login success
           HttpSession session=request.getSession();
           session.setAttribute("currentUser", userDetails);
            String userType=userDetails.getType();
            if(userType.equals("admin")){
                response.sendRedirect("admin.jsp");
            }
            else if(userType.equals("normal")){
                response.sendRedirect("profile.jsp");
            }
            else{
                out.println("We have not identified the user");
            }
           
       }
    }
    
    
    
}
