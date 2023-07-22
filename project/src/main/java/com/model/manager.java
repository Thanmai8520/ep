package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class manager {
	String url = "jdbc:mysql://localhost:3306/cse";

	String un = "root";
	String pwd = "uday2acc";
	
	Connection con =  null;
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	public boolean validate(loginpage l) throws ClassNotFoundException
	{
        //boolean status = false;
        try
        {
        	con = DriverManager.getConnection(url,un,pwd);
        	ps = con.prepareStatement("select * from project where username = ? and password = ? ");
        	ps.setString(1, l.getUname());
        	ps.setString(2, l.getPass());
        	
        	
            ResultSet rs = ps.executeQuery();
            if(rs==null)
            	return false;
            
            		
           // status = rs.next();
           // System.out.println("Status is "+status);
        }
        catch(Exception e) {
            System.out.println(e);
        }
        //return status;
        return true;
    }
	 public String saveData(registerpage S) throws Exception
	  {
		  con=DriverManager.getConnection(url,un,pwd);
		  ps=con.prepareStatement("insert into project values(?,?,?,?,?,?)");
		  ps.setString(1, S.getAccno());
		  ps.setString(2, S.getAcctype());
		  ps.setString(3, S.getFullname());
		  ps.setString(4, S.getUsername());
		  ps.setString(5, S.getEmail());
		  ps.setString(6, S.getPassword());
		  
		  ps.execute();
		  
		  ps1=con.prepareStatement("insert into account values(?,?,?,?)");
		  ps1.setInt(1, Integer.valueOf(S.getAccno()));
		  ps1.setInt(2, 0);
		  ps1.setInt(3, 0);
		  ps1.setInt(4, 0);
		  ps1.execute();
		  con.close();
		  return "Data Inserted Sucessfully...";
	  }

}
