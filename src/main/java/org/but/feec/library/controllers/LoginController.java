package org.but.feec.library.controllers;

import org.but.feec.library.App;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.DataAccessException;
import org.but.feec.library.exceptions.ExceptionHandler;
import org.but.feec.library.exceptions.ResourceNotFoundException;
import org.but.feec.library.services.AuthService;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.KeyCode;
import javafx.stage.Stage;
import javafx.util.Duration;
import org.controlsfx.validation.ValidationSupport;
import org.controlsfx.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Optional;

public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);


    @FXML
    public Label LabelUsername;

    @FXML
    public Label LabelPassword;

    @FXML
    public Label LabelWelcome;

    @FXML
    private TextField EnterUsername;

    @FXML
    private PasswordField EnterPassword;

    @FXML
    private Button LogButton;



        private LibraryRepository libraryRepository;
        private AuthService authService;
        private ValidationSupport validation;

    public LoginController() {

        }

        @FXML
        private void initialize() {
            EnterUsername.setOnKeyPressed(event -> {
                if (event.getCode() == KeyCode.ENTER) {
                    handleSignIn();
                }
            });
            EnterPassword.setOnKeyPressed(event -> {
                if (event.getCode() == KeyCode.ENTER) {
                    handleSignIn();
                }
            });


            initializeServices();
            initializeValidations();

            logger.info("LoginController initialized");
        }

        private void initializeValidations() {
            validation = new ValidationSupport();
            validation.registerValidator(EnterUsername, Validator.createEmptyValidator("The username must not be empty."));
            validation.registerValidator(EnterPassword, Validator.createEmptyValidator("The password must not be empty."));
            LogButton.disableProperty().bind(validation.invalidProperty());
        }

        private void initializeServices() {
            libraryRepository = new LibraryRepository();
            authService = new AuthService(libraryRepository);
        }



        public void signInActionHandler(ActionEvent event) {
            handleSignIn();
        }

    private void handleSignIn() {
        String username = EnterUsername.getText();
        String password = EnterPassword.getText();
        try {
            boolean authenticated = authService.authenticate(username, password);
            System.out.println("try block");
            //boolean authenticated = true;
            if (authenticated) {
                System.out.println("handleSignIn block");
                authConfirmDialog();
                showPersonsView();
            } else {
                System.out.println(" handleSignIn else ");
                showInvalidPasswordDialog();
            }
        } catch (ResourceNotFoundException | DataAccessException e) {
            System.out.println("HandleSignIn Catch:" + e);
            showInvalidPasswordDialog();
        }
    }

        private void showPersonsView() {
            try {
                FXMLLoader fxmlLoader = new FXMLLoader();
                fxmlLoader.setLocation(App.class.getResource("fxml/LibraryPage.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 900, 600);
                Stage stage = new Stage();
                stage.setTitle("Samurai Duck Library");
                stage.setScene(scene);

                Stage stageOld = (Stage) LogButton.getScene().getWindow();
                stageOld.close();



                stage.show();
            } catch (IOException ex) {
                ExceptionHandler.handleException(ex);
            }
        }

        private void showInvalidPasswordDialog() {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Unauthenticated");
            alert.setHeaderText("The user is not authenticated");
            alert.setContentText("Please provide a valid username and password");

            alert.showAndWait();
        }


    private void authConfirmDialog() {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setTitle("Logging confirmation");
        alert.setHeaderText("You were successfully logged in.");

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

        if (result.get() == ButtonType.OK) {
            System.out.println("ok clicked");
        } else if (result.get() == ButtonType.CANCEL) {
            System.out.println("cancel clicked");
        }
    }

        public void handleOnEnterActionPassword(ActionEvent dragEvent) {
            handleSignIn();
        }
}


