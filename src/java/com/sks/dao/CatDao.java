
package com.sks.dao;

import com.sks.entities.Category;
import com.sks.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class CatDao {
    private Connection con;

    public CatDao(Connection con) {
        this.con = con;
    }
    
    //method to insert category to database
    
    public boolean saveCategory(Category cat){
    boolean f=false;
        try{
            //category-->database
            String query="INSERT INTO categories(name,description) VALUES (?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1, cat.getName());
            pstmt.setString(2, cat.getDescription());
            
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
}
