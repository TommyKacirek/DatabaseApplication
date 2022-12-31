package org.but.feec.library;

import org.but.feec.library.exceptions.ExceptionHandler;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;


/**
 * @author Tomáš Kačírek
 */
public class App extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("fxml/Login.fxml"));
            BorderPane mainStage = loader.load();

            primaryStage.setTitle("Samurai Duck Library");
            Scene scene = new Scene(mainStage);
            primaryStage.getIcons().add(new Image(App.class.getResourceAsStream("images/duck_48px.png")));
            primaryStage.setScene(scene);
            primaryStage.show();

        } catch (Exception ex) {
            ExceptionHandler.handleException(ex);
        }
    }

}








































