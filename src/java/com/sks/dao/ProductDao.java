
package com.sks.dao;

import com.sks.entities.Category;
import com.sks.entities.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;


public class ProductDao {
     private Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }
    //fetching categories from database
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list= new ArrayList<>();
        try {
            String query="Select* from categories";
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Category cat =new Category(cid,name,description);
                list.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
      
         return list;
    }
    
    public boolean saveProduct(Products p){
        boolean f=false;
        try{
                        //product-->database
            String query="INSERT INTO product(pTitle,pDesc,pPhoto,pPrice,pDiscount,pQuantity,catId) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpDesc());
            pstmt.setString(3,p.getpPhoto());
            pstmt.setInt(4,p.getpPrice());
            pstmt.setInt(5,p.getpDiscount());
            pstmt.setInt(6,p.getpQuantity());
            pstmt.setInt(7,p.getCatId());
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
    
   return f;
    }
   public ArrayList<Products> getAllProducts()
    {
        ArrayList<Products> pList =new ArrayList<>();
        //fetch all products
        try {
            String query="Select* from product";
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pDesc=rs.getString("pDesc");
                String pPhoto=rs.getString("pPhoto");
                int pPrice=rs.getInt("pPrice");
                int pDiscount=rs.getInt("pDiscount");
                int pQuantity=rs.getInt("pQuantity");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catId=rs.getInt("catId");
               
                Products product=new Products( pid,  pTitle, pDesc, pPhoto, pPrice,  pDiscount,  pQuantity,  pDate,  catId);
                pList.add(product);
            }
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
      
         return pList;
    }
   public ArrayList<Products> getAllProductsByCatId(int catId)
    {
        ArrayList<Products> pList =new ArrayList<>();
        //fetch all products by catId
        try {
            String query="select* from product where catId=?";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pDesc=rs.getString("pDesc");
                String pPhoto=rs.getString("pPhoto");
                int pPrice=rs.getInt("pPrice");
                int pDiscount=rs.getInt("pDiscount");
                int pQuantity=rs.getInt("pQuantity");
                Timestamp pDate=rs.getTimestamp("pDate");
                
               
                Products product=new Products( pid,  pTitle, pDesc, pPhoto, pPrice,  pDiscount,  pQuantity,  pDate,  catId);
                pList.add(product);
           
        }
        }catch (Exception e) {
            e.printStackTrace();
        }
      
         return pList;
    }
}
