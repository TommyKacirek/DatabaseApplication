package org.but.feec.library.services;


import org.but.feec.library.api.LibraryAuthView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.ResourceNotFoundException;

public class AuthService {

    private LibraryRepository libraryRepository;

    public AuthService(LibraryRepository personRepository) {
        this.libraryRepository = personRepository;
    }

    private LibraryAuthView findPersonByEmail(String email) {
        return libraryRepository.findPersonByEmail(email);
    }

    public boolean authenticate(String username, String password) {
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            return false;
        }

        LibraryAuthView libraryAuthView = findPersonByEmail(username);
        if (libraryAuthView == null) {
            throw new ResourceNotFoundException("Provided username is not found.");
        }

        libraryAuthView.getPassword();
        return true;
    }


}
