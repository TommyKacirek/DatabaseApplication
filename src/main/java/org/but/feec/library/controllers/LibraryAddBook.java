package org.but.feec.library.controllers;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.but.feec.library.api.LibraryEditView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.Optional;

public class LibraryAddBook {
    private static final Logger logger = LoggerFactory.getLogger(LibraryAddBook.class);
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


    public void handleOnEditButton(ActionEvent actionEvent) {
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

        bookAdded();
    }
    private void bookAdded() {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Book Added");
        alert.setHeaderText("Book successfully added.");

        Timeline idlestage = new Timeline(new KeyFrame(Duration.seconds(2), new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                alert.setResult(ButtonType.CANCEL);
                alert.hide();
            }
        }));
        idlestage.setCycleCount(1);
        idlestage.play();
        Optional<ButtonType> result = alert.showAndWait();
    }
}



