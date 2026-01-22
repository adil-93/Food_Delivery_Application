package com.tap.DAO;

import java.util.List;
import com.tap.model.User;

import com.tap.model.User;

public interface UserDAO {
	void addUser(User U);
	User getUser(int id);
	void updateUser(User u);
	void deleteUser(int id);
	List<User> getAllUser();
	

}
