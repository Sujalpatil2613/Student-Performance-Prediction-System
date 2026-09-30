package org.techhub.repo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.Contact;
import org.techhub.model.User;

@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;  // Spring injects this

    @Override
    public boolean save(User user) {
        String sql = "INSERT INTO user(name,email,phone,password,role) VALUES(?,?,?,?,?)";
        int rows = jdbcTemplate.update(sql,
            user.getName(), user.getEmail(), user.getPhone(), user.getPassword(), user.getRole());
        return rows > 0;
    }

    @Override
    public List<User> findByRole(String role) {
        String sql = "SELECT * FROM user WHERE role=?";
        return jdbcTemplate.query(sql, new Object[]{role}, (rs, rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPhone(rs.getString("phone"));
            u.setRole(rs.getString("role"));
            return u;
        });
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email=?";
        List<User> list = jdbcTemplate.query(sql, new Object[]{email}, (rs, rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPhone(rs.getString("phone"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("role"));
            return u;
        });
        return list.isEmpty() ? null : list.get(0);
    }
    public User findById(int id) {
        String sql = "SELECT * FROM user WHERE id=?";
        
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPhone(rs.getString("phone"));
            u.setRole(rs.getString("role"));
            u.setPassword(rs.getString("password"));
            return u;
        });
    }
    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM user WHERE id=?";
        return jdbcTemplate.update(sql, id) > 0;
    }
    @Override
    public boolean update(User user) {

        String sql = "UPDATE user SET name=?, email=?, phone=?, password=? WHERE id=?";
        
        int rows = jdbcTemplate.update(sql,
                user.getName(),
                user.getEmail(),
                user.getPhone(),
                user.getPassword(),
                user.getId()
        );

        return rows > 0;
    }

	@Override
	public User login(String email, String password, String role) {
		String sql = "SELECT * FROM user WHERE email=? AND password=? AND role=?";

	        try {
	            return jdbcTemplate.queryForObject(sql,
	                    new Object[]{email, password, role},
	                    new BeanPropertyRowMapper<>(User.class));

	        } catch (Exception e) {
	            return null;
	        }
	}

	
}