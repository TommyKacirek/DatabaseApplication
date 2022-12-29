package org.but.feec.library.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.but.feec.library.api.LibraryEditView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOError;

public class LibraryAddBookController {
    private static final Logger logger = LoggerFactory.getLogger(LibraryAddBookController.class);
    @FXML
    public Button ApplyEditButton;

    @FXML
    public TextField enterAuthor;

    @FXML
    public TextField enterGivenName;

    @FXML
    public TextField enterBorn;

    @FXML
    public TextField enterTitleName;

    @FXML
    public TextField enterPublicationYear;



    private LibraryService libraryService;
    private LibraryRepository libraryRepository;
    private ValidationSupport validation;

    public Stage stage;

    public void setStage(Stage stage){
        this.stage = stage;
    }

    @FXML
    public void initialize() {
        libraryRepository = new LibraryRepository();
        libraryService = new LibraryService(libraryRepository);

        validation = new ValidationSupport();
        validation.registerValidator(enterAuthor, Validator.createEmptyValidator("The author must not be empty."));
        validation.registerValidator(enterGivenName, Validator.createEmptyValidator("The given name name must not be empty."));
        validation.registerValidator(enterBorn, Validator.createEmptyValidator("The born must not be empty."));
        validation.registerValidator(enterTitleName, Validator.createEmptyValidator("The title name must not be empty."));
        validation.registerValidator(enterPublicationYear, Validator.createEmptyValidator("The publication year  must not be empty."));


        ApplyEditButton.disableProperty().bind(validation.invalidProperty());

        logger.info("PersonCreateController initialized");
    }


    public void handleOnEditButton(ActionEvent actionEvent) throws IOError{
        String author = String.valueOf(enterAuthor.getText());
        String givenName = String.valueOf(enterGivenName.getText());
        Long born = Long.valueOf(enterBorn.getText());
        String titleName = String.valueOf(enterTitleName.getText());
        Long publicationYear = Long.valueOf(enterPublicationYear.getText());
            LibraryEditView libraryEditView = new LibraryEditView();
            libraryEditView.setAuthor(author);
            libraryEditView.setGivenName(givenName);
            libraryEditView.setBorn(born);
            libraryEditView.setTitleName(titleName);
            libraryEditView.setPublicationYear(publicationYear);

            libraryService.addBook(libraryEditView);


    }
}




