package org.techhub.repo;

import java.util.List;
import org.techhub.model.Contact;

public interface ContactRepository {
    void save(Contact contact);
    List<Contact> findAll();
}