package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import org.but.feec.library.api.LibraryInjectionView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class LibraryInjectionController {

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

    private static final Logger logger = LoggerFactory.getLogger(LibraryInjectionController.class);

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

        logger.info("LibraryInjectionController initialized");

    }
    private ObservableList<LibraryInjectionView> initializeLibraryData() {

        String text = enterSearchBar.getText();
        List<LibraryInjectionView> injection = libraryService.getInjectionView(text);
        return FXCollections.observableArrayList(injection);
    }
    @FXML
    public void handleInjectionButton(ActionEvent actionEvent){

            ObservableList<LibraryInjectionView> observableLibraryList = initializeLibraryData();
            injectionViewTable.setItems(observableLibraryList);
    }
}
