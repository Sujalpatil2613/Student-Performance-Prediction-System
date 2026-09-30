package org.techhub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.Contact;
import org.techhub.model.User;
import org.techhub.repo.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repo;

    @Override
    public boolean addUser(User user) {
        if (repo.findByEmail(user.getEmail()) != null) 
            return false;
        return repo.save(user);
    }

    @Override
    public List<User> getUsersByRole(String role) {
        return repo.findByRole(role);
    }

    @Override
    public boolean isEmailExist(String email) {
        return repo.findByEmail(email) != null;
    }

    @Override
    public User getUserById(int id) {
        return repo.findById(id);   // ✅ FIX
    }

    @Override
    public boolean updateUser(User user) {
        return repo.update(user);   // ✅ FIX
    }

    @Override
    public boolean deleteUser(int id) {
        return repo.delete(id);     // ✅ FIX
    }

	@Override
	public User login(String email, String password, String role) {
		return repo.login(email, password, role);	// TODO Auto-generated method stub
	}
	

	 
    
}