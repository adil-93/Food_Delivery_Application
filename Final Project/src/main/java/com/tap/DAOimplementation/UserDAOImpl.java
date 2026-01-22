package com.tap.DAOimplementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.db_connection;

public class UserDAOImpl implements UserDAO {

    private String ADD_USER = 
        "INSERT INTO `user` (`username`, `password`, `email`, `address`, `role`, `created date`, `last login date`) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    private String GET_USER = "SELECT * FROM `user` WHERE `userid` = ?";

    @Override
    public void addUser(User u) {
        Connection connection = db_connection.getConnection();
        try {
            PreparedStatement prepareStatement = connection.prepareStatement(ADD_USER);
            prepareStatement.setString(1, u.getUsername());
            prepareStatement.setString(2, u.getPassword());
            prepareStatement.setString(3, u.getEmail());
            prepareStatement.setString(4, u.getAddress());
            prepareStatement.setString(5, u.getRole());
            prepareStatement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            prepareStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

            prepareStatement.executeUpdate();
            System.out.println("User inserted successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	@Override
	public User getUser(int id) {
		Connection connection = db_connection.getConnection();
		User u=null;
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(GET_USER);
			prepareStatement.setInt(1,  id);
			ResultSet res=prepareStatement.executeQuery();
			
			while(res.next())
			{
				int userId = res.getInt("userid");
				String username=res.getString("username");
				String password=res.getString("password");
				String email=res.getString("email");
				String address=res.getString("address");
				String role=res.getString("role");
				
				u = new User(userId, username, password, email, address, role);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return u;
	}

	@Override
	public void updateUser(User u) {
		String UPDATE_USER = "UPDATE `user` SET `password` = ?, `email` = ?, `address` = ?, `role` = ?"
				+ "WHERE `userid` = ?";
				
		Connection connection = db_connection.getConnection();
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(UPDATE_USER);
			
			prepareStatement.setString(1, u.getPassword());
			prepareStatement.setString(2, u.getEmail());
			prepareStatement.setString(3, u.getAddress());
			prepareStatement.setString(4, u.getRole());
			prepareStatement.setInt(5, u.getUserid());
			
			prepareStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void deleteUser(int id) {
		String DELETE_USER = "DELETE from `user` WHERE `userid` = ?";
		
		Connection connection = db_connection.getConnection();
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(DELETE_USER);
			prepareStatement.setInt(1, id);
			
			prepareStatement.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	

	@Override
	public List<User> getAllUser() {
		String GET_ALL_USERS = "SELECT * FROM `user`";
	    Connection connection = db_connection.getConnection();
	    List<User> userList = new ArrayList<>();

	    try {
	        PreparedStatement prepareStatement = connection.prepareStatement(GET_ALL_USERS);
	        ResultSet res = prepareStatement.executeQuery();

	        while (res.next()) {
	            int userId = res.getInt("userid");
	            String username = res.getString("username");
	            String password = res.getString("password");
	            String email = res.getString("email");
	            String address = res.getString("address");
	            String role = res.getString("role");

	            User u = new User(userId, username, password, email, address, role);
	            userList.add(u);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return userList;
	}

	


}
