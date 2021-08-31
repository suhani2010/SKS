
package com.sks.servlets;


import com.sks.dao.UserDao;
import com.sks.entities.User;
import com.sks.helper.ConnectionProvider;
import com.sks.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        //fetch data form Edit form
        
   String userName=request.getParameter("user_name");
      String userEmail=request.getParameter("user_email");
      String userPassword=request.getParameter("user_password");
      String userAbout=request.getParameter("user_about");
      Part part=request.getPart("image");
      String imageName=part.getSubmittedFileName();
      
      
     
        
        //get user from the session
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("currentUser");
        user.setName(userName);
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setAbout(userAbout);
        String oldProfile=user.getProfile();
        System.out.println("old profile: "+oldProfile);
        System.out.println("file submitted by user: "+part.getSubmittedFileName());
        if(part.getSubmittedFileName().trim()== "" || part.getSubmittedFileName()== null){
          imageName=oldProfile;
      }
        user.setProfile(imageName);
        System.out.println("imagName: "+imageName);
        //update user info in database
        UserDao userDao=new UserDao(ConnectionProvider.getConnection());
        boolean ans=userDao.updateUser(user);
        if(ans)
        {
            //out.println("updated");
            String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
            System.out.println("path: "+path);
            
            //deleting old profile from disc
            
             if(Helper.saveFile(part.getInputStream(),path)){
                 out.println("Updated");
                /* String oldProfilePath=request.getRealPath("/")+"pics"+File.separator+oldProfile;
             Helper.deleteFile(oldProfilePath);*/
             }
             else{
                 out.println("profile photo not updated");
             }
           
        }
        else{
            out.println("not updated");
        }
    }

  


}
