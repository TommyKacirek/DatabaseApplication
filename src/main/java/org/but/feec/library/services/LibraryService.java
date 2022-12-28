package org.but.feec.library.services;


import org.but.feec.library.api.LibraryBasicView;
import org.but.feec.library.api.LibraryCreateView;
import org.but.feec.library.api.LibraryDetailView;
import org.but.feec.library.api.LibraryEditView;
import org.but.feec.library.data.LibraryRepository;
import at.favre.lib.crypto.bcrypt.BCrypt;
import java.util.List;


public class LibraryService {

    private LibraryRepository libraryRepository;

    public LibraryService(LibraryRepository libraryRepository) {
        this.libraryRepository = libraryRepository;
    }

    public List<LibraryBasicView> getPersonsBasicView() {
        return libraryRepository.getPersonsBasicView();
    }

    public void addBook(LibraryEditView libraryEditView){
        libraryRepository.addBook(libraryEditView);
    }

    /**
     * <p>
     * Note: For implementation details see: https://github.com/patrickfav/bcrypt
     * </p>
     *
     * @param password to be hashed
     * @return hashed password
     */
    private char[] hashPassword(char[] password) {
        return BCrypt.withDefaults().hashToChar(10, password);

    }


}





