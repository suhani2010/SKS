/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sks.servlets;

import com.sks.dao.shippingDao;
import com.sks.entities.shippingDetails;
import com.sks.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@MultipartConfig
public class ShippingDetailsServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            PrintWriter out = response.getWriter();
            
            
            String userId=request.getParameter("user_id");
            String userName=request.getParameter("user_name");
       String userContact=request.getParameter("user_contact");
       String userAddress=request.getParameter("user_address");
//       String orders=request.getParameter("user_order");

       shippingDao dao=new shippingDao(ConnectionProvider.getConnection());
        shippingDetails sh=new shippingDetails(userId,userName,userAddress,userContact);
            if(dao.saveShippingDetails(sh)){out.println("<h1>Order Placed Successfully</h1>");
            out.println("<h3>Your Order will be delivered within 7 days</h3>");
            out.println("<h3>Thank You For Shopping</h3>");
            out.println("<a href='profile.jsp' >Go to Profile Page</a>");
            }
            
            else out.println("Order not placed");


    }

  


   
}
