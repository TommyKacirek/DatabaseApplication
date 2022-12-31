package org.but.feec.library.services;

import org.but.feec.library.api.*;
import org.but.feec.library.data.LibraryRepository;
import java.util.List;

public class LibraryService {

    private LibraryRepository libraryRepository;

    public LibraryService(LibraryRepository libraryRepository) {
        this.libraryRepository = libraryRepository;
    }

    public List<LibraryBasicView> getPersonsBasicView() {
        return libraryRepository.getLibraryBasicView();
    }

    public List<LibraryDetailView> getPersonsDetailView(){
        return libraryRepository.getLibraryDetailView();
    }

    public void addBook(LibraryEditView libraryEditView){
        libraryRepository.addBook(libraryEditView);
    }

    public void libraryUpdate(LibraryUpdateView libraryUpdateView) {
        libraryRepository.libraryUpdate(libraryUpdateView);
    }

    public List<LibraryFilterView> getBookFilterView(String text) {
        return libraryRepository.getBookFilterView(text);
    }

    public List<LibraryInjectionView> getInjectionView(String text) {
        return libraryRepository.getInjectionView(text);
    }
}





