package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import org.but.feec.library.App;
import org.but.feec.library.api.LibraryFilterView;
import org.but.feec.library.api.LibraryInjectionView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.ExceptionHandler;
import org.but.feec.library.services.LibraryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Text;

import java.io.IOException;
import java.util.List;

public class LibraryInjectionController {

    private static final Logger logger = LoggerFactory.getLogger(LibraryInjectionController.class);

    @FXML
    public TextField enterSearchBar;
    @FXML
    public TableView <LibraryInjectionView> injectionViewTable;

    @FXML
    public TableColumn <LibraryInjectionView, Long>idColumn;

    @FXML
    public TableColumn <LibraryInjectionView, String> nameColumn;

    @FXML
    public TableColumn <LibraryInjectionView, String>usernameColumn;


    private LibraryService libraryService;
    private LibraryRepository libraryRepository;

    public Stage stage;

    public void setStage(Stage stage){
        this.stage = stage;
    }
    @FXML
    private void initialize(){
        libraryRepository = new LibraryRepository();
        libraryService = new LibraryService(libraryRepository);

        idColumn.setCellValueFactory(new PropertyValueFactory<LibraryInjectionView, Long>("idColumn"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<LibraryInjectionView, String>("nameColumn"));
        usernameColumn.setCellValueFactory(new PropertyValueFactory<LibraryInjectionView, String>("usernameColumn"));



        //ObservableList<LibraryInjectionView> observablePersonList = initializePersonsData();
        //injectionViewTable.setItems(observablePersonList);
        logger.info("LibraryInjectionController initialized");

    }
    private ObservableList<LibraryInjectionView> initializePersonsData() {

        String text = enterSearchBar.getText();
        List<LibraryInjectionView> injection = libraryService.getInjectionView(text);
        return FXCollections.observableArrayList(injection);
    }
    @FXML
    public void handleInjectionButton(ActionEvent actionEvent){

            ObservableList<LibraryInjectionView> observablePersonList = initializePersonsData();
            injectionViewTable.setItems(observablePersonList);

    }
}
