package org.but.feec.library.controllers;

import org.but.feec.library.App;
import org.but.feec.library.data.PersonRepository;
import org.but.feec.library.exceptions.DataAccessException;
import org.but.feec.library.exceptions.ExceptionHandler;
import org.but.feec.library.exceptions.ResourceNotFoundException;
import org.but.feec.library.services.AuthService;
import de.jensd.fx.glyphs.GlyphsDude;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIcon;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
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



        private PersonRepository personRepository;
        private AuthService authService;
        private ValidationSupport validation;

    public LoginController() {
        }

        @FXML
        private void initialize() {
            /**GlyphsDude.setIcon(LogButton, FontAwesomeIcon.SIGN_IN, "1em");
            GlyphsDude.setIcon(LabelUsername, FontAwesomeIcon.USER, "2em");
            GlyphsDude.setIcon(LabelPassword, FontAwesomeIcon.USER_SECRET, "2em");
             */
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
            personRepository = new PersonRepository();
            authService = new AuthService(personRepository);
        }



        public void signInActionHandler(ActionEvent event) {
            handleSignIn();
        }

        private void handleSignIn() {
            String username = EnterUsername.getText();
            String password = EnterPassword.getText();

            try {
                boolean authenticated = authService.authenticate(username, password);
                if (authenticated) {
                    showPersonsView();
                } else {
                    showInvalidPaswordDialog();
                }
            } catch (ResourceNotFoundException | DataAccessException e) {
                showInvalidPaswordDialog();
            }
        }

        private void showPersonsView() {
            try {
                FXMLLoader fxmlLoader = new FXMLLoader();
                fxmlLoader.setLocation(App.class.getResource("fxml/add-books.fxml"));
                Scene scene = new Scene(fxmlLoader.load(), 1050, 600);
                Stage stage = new Stage();
                stage.setTitle("Samurai Duck Library");
                stage.setScene(scene);

                Stage stageOld = (Stage) LogButton.getScene().getWindow();
                stageOld.close();


                authConfirmDialog();

                stage.show();
            } catch (IOException ex) {
                ExceptionHandler.handleException(ex);
            }
        }

        private void showInvalidPaswordDialog() {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Unauthenticated");
            alert.setHeaderText("The user is not authenticated");
            alert.setContentText("Please provide a valid username and password");//ww  w . j  a  va2s  .  co  m

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


