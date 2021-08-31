
package com.sks.servlets;

import com.sks.dao.CatDao;
import com.sks.entities.Category;
import com.sks.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import com.sks.dao.CatDao;
import com.sks.entities.Category;
import com.sks.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class AddCatServlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("admin.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         PrintWriter out = response.getWriter();
         String catTitle=request.getParameter("catTitle");
       String catDescription=request.getParameter("catDescription");
        
        CatDao dao=new CatDao(ConnectionProvider.getConnection());
        Category cat=new Category(catTitle,catDescription);
            if(dao.saveCategory(cat))out.println("Category Added Successfully");
            else out.println("Category Not added");
        
        
    }

   
}


