package org.but.feec.library.controllers;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.but.feec.library.api.LibraryBasicView;
import org.but.feec.library.api.LibraryUpdateView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Text;

import java.util.Optional;

public class LibraryUpdateController {
    private static final Logger logger = LoggerFactory.getLogger(LibraryUpdateController.class);


    @FXML
    public TextField enterTitleName;

    @FXML
    public TextField enterPublicationYear;

    @FXML
    public TextField enterAvailabilityPresent;

    @FXML
    public TextField enterAvailabilityAbsent;

    @FXML
    public Button updateButton;

    private LibraryService libraryService;
    private LibraryRepository libraryRepository;
    private ValidationSupport validation;

    private long enterTitleId;
    public Stage stage;

    public void setStage(Stage stage) {
        this.stage = stage;

    }

    @FXML
    public void initialize(){
        libraryRepository = new LibraryRepository();
        libraryService = new LibraryService(libraryRepository);

        validation = new ValidationSupport();
        validation.registerValidator(enterTitleName, Validator.createEmptyValidator("The title name must not be empty."));
        validation.registerValidator(enterPublicationYear, Validator.createEmptyValidator("The publication year must not be empty."));
        validation.registerValidator(enterAvailabilityPresent, Validator.createEmptyValidator("The availability present must not be empty."));
        validation.registerValidator(enterAvailabilityAbsent, Validator.createEmptyValidator("The availability absent must not be empty."));

        updateButton.disableProperty().bind(validation.invalidProperty());

        loadPersonsData();
        logger.info("LibraryUpdateController initialized");

    }



    private void loadPersonsData() {
        this.stage = new Stage();
        Stage stage = this.stage;
        if (stage.getUserData() instanceof LibraryBasicView) {
            LibraryBasicView libraryBasicView = (LibraryBasicView) stage.getUserData();
            enterTitleId = libraryBasicView.getTitleId();
            enterTitleName.setText(String.valueOf(libraryBasicView.getTitleName()));
            enterPublicationYear.setText(String.valueOf(libraryBasicView.getPublicationYear()));
            enterAvailabilityPresent.setText(String.valueOf(libraryBasicView.getAvailabilityPresent()));
            enterAvailabilityAbsent.setText(String.valueOf(libraryBasicView.getAvailabilityAbsent()));
        }


    }
    @FXML
    public void handleUpdateTitle(ActionEvent event){
        String titleName = String.valueOf(enterTitleName.getText());
        Long publicationYear = Long.valueOf(enterPublicationYear.getText());
        Long availabilityPresent = Long.valueOf(enterAvailabilityPresent.getText());
        Long availabilityAbsent = Long.valueOf(enterAvailabilityAbsent.getText());



        LibraryUpdateView libraryUpdateView = new LibraryUpdateView();
        libraryUpdateView.setEnterTitleName(titleName);
        libraryUpdateView.setEnterPublicationYear(publicationYear);
        libraryUpdateView.setEnterAvailabilityPresent(availabilityPresent);
        libraryUpdateView.setGetEnterAvailabilityAbsent(availabilityAbsent);


        libraryService.libraryUpdate(libraryUpdateView);

        personEditedConfirmationDialog();
    }

    private void personEditedConfirmationDialog() {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Title updated ");
        alert.setHeaderText("Title was successfully updated.");

        Timeline idlestage = new Timeline(new KeyFrame(Duration.seconds(3), new EventHandler<ActionEvent>() {
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


