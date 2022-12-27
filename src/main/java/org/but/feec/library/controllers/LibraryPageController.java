package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import org.but.feec.library.App;
import org.but.feec.library.api.LibraryBasicView;
import org.but.feec.library.api.LibraryDetailView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.ExceptionHandler;
import org.but.feec.library.services.AuthService;
import org.but.feec.library.services.LibraryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;

public class LibraryPageController {

    private static final Logger logger = LoggerFactory.getLogger(LibraryPageController.class);
    @FXML
    private TableView <LibraryBasicView> SystemTableView;

    @FXML
    private TableColumn <LibraryBasicView, String> AuthorColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> TitleColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> CopyColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> GenreColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> BorrowTypeColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> LocationColumn;

    @FXML
    private TableColumn <LibraryBasicView, String> LanguageColumn;

    @FXML
    private TextField EnterBookTextField;

    @FXML
    public Button SearchButton;

    @FXML
    public Button RefreshButton;

    @FXML
    public Button AddBookButton;

    @FXML
    public Button TrySQLInjectionButton;

    private LibraryService libraryService;

    private LibraryRepository libraryRepository;

    public void initialize() {
        libraryService = new LibraryService(libraryRepository);
        libraryRepository = new LibraryRepository();

        AuthorColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("author"));
        TitleColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("title"));
        CopyColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("copy"));
        GenreColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("genre"));
        BorrowTypeColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("borrow_type"));
        LocationColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("location"));
        LanguageColumn.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("language"));

        ObservableList<LibraryBasicView> observablePersonList = initializePersonsData();
        SystemTableView.setItems(observablePersonList);

        SystemTableView.getSortOrder().add(AuthorColumn);

        logger.info("PersonsController initialized");


    }

    private ObservableList<LibraryBasicView> initializePersonsData() {
        List<LibraryBasicView> persons = libraryService.getPersonsBasicView();
        return FXCollections.observableArrayList(persons);
    }
}
