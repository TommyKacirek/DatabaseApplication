package org.but.feec.library;

import org.but.feec.library.config.DataSourceConfig;
import org.but.feec.library.exceptions.ExceptionHandler;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.but.feec.library.exceptions.ExceptionHandler;


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
            FXMLLoader loader = new FXMLLoader(getClass().getResource("hello-view.fxml"));
            AnchorPane mainStage = loader.load();

            primaryStage.setTitle("Samurai Duck Library");
            Scene scene = new Scene(mainStage);
            primaryStage.setScene(scene);
            primaryStage.show();
        } catch (Exception ex) {
            ExceptionHandler.handleException(ex);
        }
    }

}
