package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
  public boolean UserRegister(User u) {
	  
	  boolean f=false;
	  
	  try {
		  
		  String sql="insert into userregister(email,name,pass) values(?,?,?)";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, u.getEmail());
		  ps.setString(2, u.getFullName());
		  ps.setString(3, u.getPassword());
		  int i=ps.executeUpdate();
		  if(i==1) {
			  f=true;
		  }
		  
		  
	  }catch (Exception e) {

		  e.printStackTrace();
	  }
	  return f;
  }
  
  public User login(String email,String pass) {
	  User u=null;
	  try {
		  String sql="select * from userregister where email=? and pass=?" ;
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, email);
		  ps.setString(2, pass);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next()) {
			  u=new User();
			  u.setId(rs.getInt(1));
			  u.setEmail(rs.getString(2));
			  u.setFullName(rs.getString(3));
			  u.setPassword(rs.getString(4));
			  
		  }
		  
		  
		  
		 
	  }catch (Exception e) {
            e.printStackTrace();
	}
	  return u;
  }
  public boolean changeOldPassword(int userid,String oldpassword,String newpassword) {
	  
	  boolean f=false;
	  try {
		  String sql="update userregister set pass=? where id=? and pass=?";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, newpassword);
		  ps.setInt(2, userid);
		  ps.setString(3, oldpassword);
		  int i=ps.executeUpdate();
		  if(i==1) {
			  f=true;
		  }
		
	} catch (Exception e) {
		
		e.printStackTrace();

	}
	
	  return f;
  }

}
