package org.techhub.repo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.Contact;

@Repository
public class ContactRepositoryImpl implements ContactRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void save(Contact contact) {
        String sql = "INSERT INTO contact(name, email, phone, message) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, contact.getName(), contact.getEmail(), contact.getPhone(), contact.getMessage());
    }

    @Override
    public List<Contact> findAll() {
        String sql = "SELECT * FROM contact";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Contact.class));
    }
}