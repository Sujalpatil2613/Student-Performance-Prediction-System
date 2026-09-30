package org.techhub.services;

import java.util.List;

import org.techhub.model.Contact;
import org.techhub.model.User;

public interface UserService {
    boolean addUser(User user);
    List<User> getUsersByRole(String role);
    boolean isEmailExist(String email);
    User getUserById(int id);
    boolean updateUser(User user);
    boolean deleteUser(int id);
    User login(String email, String password, String role);
    
}