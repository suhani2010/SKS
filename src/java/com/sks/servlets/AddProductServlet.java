
package com.sks.servlets;

import com.sks.dao.ProductDao;
import com.sks.entities.Products;
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
import javax.servlet.http.Part;


@MultipartConfig
public class AddProductServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("admin.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        System.out.println("product");
        int catId=Integer.parseInt(request.getParameter("cid"));
        String pTitle=request.getParameter("pTitle");
        String pDesc=request.getParameter("pDescription");
        int pPrice=Integer.parseInt(request.getParameter("pPrice"));
        int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
        int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
        Part part=request.getPart("pPic");

        Products p=new Products(pTitle,pDesc,part.getSubmittedFileName(),pPrice,pDiscount,pQuantity,null,catId);
        ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
        if(dao.saveProduct(p)){
            
            String path=request.getRealPath("/")+"product_pics"+File.separator+part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(), path);
            out.println("Product Added Successfully");
            
        }
        else{
            out.println("Product not added");
        }
    }

}
