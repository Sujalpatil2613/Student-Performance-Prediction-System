package org.techhub.services;

import java.util.List;
import org.techhub.model.Contact;

public interface ContactService {
    void saveContact(Contact contact);
    List<Contact> getAllContacts();
}