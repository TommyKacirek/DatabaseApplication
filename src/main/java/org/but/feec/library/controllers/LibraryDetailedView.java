package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import org.but.feec.library.api.LibraryBasicView;
import org.but.feec.library.api.LibraryDetailView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.controlsfx.validation.ValidationSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class LibraryDetailedView {
    private static final Logger logger = LoggerFactory.getLogger(LibraryPageController.class);
    @FXML
    public TableView detailedTableView;

    @FXML
    public TableColumn givenNameColumn;

    @FXML
    public TableColumn titleNameColumn;

    @FXML
    public TableColumn copyIdColumn;

    @FXML
    public TableColumn genreColumn;

    @FXML
    public TableColumn borrowTypeColumn;

    @FXML
    public TableColumn languageColumn;

    private LibraryService libraryService;
    private LibraryRepository libraryRepository;
    private ValidationSupport validation;

    public Stage stage;



    @FXML
    public void initialize() {
        libraryRepository = new LibraryRepository();
        libraryService = new LibraryService(libraryRepository);

        givenNameColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("givenNameColumn"));
        titleNameColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("titleNameColumn"));
        copyIdColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("copyIdColumn"));
        genreColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("genreColumn"));
        borrowTypeColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("borrowTypeColumn"));
        languageColumn.setCellValueFactory(new PropertyValueFactory<LibraryDetailView, String>("languageColumn"));

        ObservableList<LibraryDetailView> observablePersonList = initializePersonsData();
        detailedTableView.setItems(observablePersonList);

        detailedTableView.getSortOrder().add(givenNameColumn);

        logger.info("DetailView initialized");


    }

    private ObservableList<LibraryDetailView> initializePersonsData() {
        List<LibraryDetailView> persons = libraryService.getPersonsDetailView();
        return FXCollections.observableArrayList(persons);
    }


}
