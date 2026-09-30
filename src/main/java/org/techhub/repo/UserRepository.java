package org.techhub.repo;

import java.util.List;

import org.techhub.model.Contact;
import org.techhub.model.User;

public interface UserRepository {
    boolean save(User user);
    List<User> findByRole(String role);
    User findByEmail(String email);
    User findById(int id);
    boolean update(User user);
    boolean delete(int id);
    public User login(String email, String password, String role);
    
}