
package com.sks.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.annotation.MultipartConfig;


public class Helper {
    
    public static boolean deleteFile(String path){
        boolean f=false;
        try{
        File file=new File(path);
        f = file.delete();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public static boolean saveFile(InputStream is,String path){
        boolean f=false;
        try{
        byte b[]=new byte[is.available()];
        is.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            System.out.println("inputstream: "+is.available());
            fos.flush();
            fos.close();
        f=true;
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        return f;
    }
    public static int getUserCount() {
        Connection con=ConnectionProvider.getConnection();
        int count=0;
        try{
        String query="Select count(*) from user";
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(query);
        if(rs.next()){
            count=rs.getInt(1);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return count;
        
    }
    public static int getProductCount(){
        Connection con=ConnectionProvider.getConnection();
        int count=0;
        try{
        String query="Select count(*) from product";
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery(query);
        if(rs.next()){
            count=rs.getInt(1);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return count;
        
    }
}
