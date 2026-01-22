//DAO is a design pattern that separates the database logic from business logic by keeping DB code separate classes called DAO classes
//main three points to remember
//DAO-->data access object
//all DB logic in separate layer(DAO)
//Business logic does not directly talk to DB


//Why DAO??????
//segrate database logic and business logic


//structure
//DAO_Project
//          |
//----JRE   |
//----Src   |-----com.tap.model
//          |           user.java
//          |
//          |------com.tap.DAO
//          |            userDAO
//          |
//          |------com.tap.DAOImpl
//                         userDAOImp.java


package com.tap.main;

import java.util.Scanner;

import com.tap.DAOimplementation.UserDAOImpl;
import com.tap.model.User;

public class launch {

	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		
		System.out.println("Enter the username");
		String username=scanner.next();
		
		System.out.println("Enter the password");
		String password=scanner.next();
		
		System.out.println("Enter the email");
		String email=scanner.next();
		
		System.out.println("Enter the address");
		String address=scanner.next();
		
		System.out.println("Enter the role");
		String role=scanner.next();
		
		User u=new User(username, password, email, address, role);
		UserDAOImpl ud = new UserDAOImpl();
		ud.addUser(u);
		System.out.println("INSERTED");
		
		
		//getUser
//		System.out.println("Enter user id");
//		int id=scanner.nextInt();
//		
//		UserDAOImpl ud = new UserDAOImpl();
//		User user = ud.getUser(id);
//		System.out.println(user);
		
		
		
		//update
//		System.out.println("Enter the userid");
//		int userid = scanner.nextInt();
//		
//		System.out.println("Enter the email");
//		String email = scanner.next();
//		
//		UserDAOImpl ud=new UserDAOImpl();
//		
//		User user = ud.getUser(userid);
//		user.setEmail(email);
//		
//		ud.updateUser(user);
//		System.out.println(user);
		
		
		
		//DELETE
//		UserDAOImpl ud=new UserDAOImpl();
//		ud.deleteUser(3);
//		System.out.println("DELETED");
//		
		
		
		
		
		
	}

}
