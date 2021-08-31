

package com.sks.dao;


import com.sks.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
            //user-->database
            String query="INSERT INTO user(name,email,password,gender,about) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="SELECT* FROM user WHERE email =? and password =?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
           // System.out.println(email+" "+password);
            if(rs.next())
            {
                user=new User();
                //data from db
                String name=rs.getString("name");
                
                //set to user object
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                user.setType(rs.getString("type"));
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        System.out.println(user);
         return user;
        
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try{
            String query="update user set name =? , email =? , password =?, gender =?, about =?, profile =? where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            System.out.println("image updated on db: "+user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
