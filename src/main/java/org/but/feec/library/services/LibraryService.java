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

    public LibraryDetailView getPersonDetailView(Long id) {
        return libraryRepository.findPersonDetailedView(id);
    }

    public List<LibraryBasicView> getPersonsBasicView() {
        return libraryRepository.getPersonsBasicView();
    }

    public void createPerson(LibraryCreateView personCreateView) {
        // the following three lines can be written in one code line (only for more clear explanation it is written in three lines
        char[] originalPassword = personCreateView.getPwd();
        /**char[] hashedPassword = hashPassword(originalPassword);
         personCreateView.setPwd(hashedPassword);
         */
        libraryRepository.createPerson(personCreateView);
    }

    public void editPerson(LibraryEditView personEditView) {
        libraryRepository.editPerson(personEditView);
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
        return BCrypt.withDefaults().hashToChar(12, password);

    }
}



