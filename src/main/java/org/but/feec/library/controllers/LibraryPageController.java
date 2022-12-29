package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import org.but.feec.library.App;
import org.but.feec.library.api.LibraryBasicView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.exceptions.ExceptionHandler;
import org.but.feec.library.services.LibraryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;

public class LibraryPageController {


    private static final Logger logger = LoggerFactory.getLogger(LibraryPageController.class);
    @FXML
    private TableView <LibraryBasicView> LibraryTabelView;

    @FXML
    private TableColumn <LibraryBasicView, String> titleId;

    @FXML
    private TableColumn <LibraryBasicView, String> titleName;

    @FXML
    private TableColumn <LibraryBasicView, String> publicationYear;

    @FXML
    private TableColumn <LibraryBasicView, String> availabilityPresent;

    @FXML
    private TableColumn <LibraryBasicView, String> availabilityAbsent;



    @FXML
    public TextField EnterBookTextField;

    @FXML
    private TextField searchBar;

    @FXML
    public Button filterButton;
    @FXML
    public Button DetailedViewButton;

    @FXML
    public Button RefreshButton;

    @FXML
    public Button AddBookButton;

    @FXML
    public Button TrySQLInjectionButton;

    @FXML
    public Button updateButton;

    private LibraryService libraryService;

    private LibraryRepository libraryRepository;

    public void initialize() {
        libraryRepository = new LibraryRepository();
        libraryService = new LibraryService(libraryRepository);

        titleId.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("titleId"));
        titleName.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("titleName"));
        publicationYear.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("publicationYear"));
        availabilityPresent.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("availabilityPresent"));
        availabilityAbsent.setCellValueFactory(new PropertyValueFactory<LibraryBasicView, String>("availabilityAbsent"));

        ObservableList<LibraryBasicView> observablePersonList = initializePersonsData();
        LibraryTabelView.setItems(observablePersonList);

        LibraryTabelView.getSortOrder().add(titleId);

        initializeTableViewSelection();

        logger.info("LibraryPageController initialized");


    }

    private ObservableList<LibraryBasicView> initializePersonsData() {
        List<LibraryBasicView> persons = libraryService.getPersonsBasicView();
        return FXCollections.observableArrayList(persons);
    }


    @FXML
    private void handleOnBookAction() {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(App.class.getResource("fxml/LibraryAddBook.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 900, 600);
            Stage stage = new Stage();
            stage.setTitle("Samurai Duck Library Add Book");
            stage.setScene(scene);

            Stage stageOld = (Stage) AddBookButton.getScene().getWindow();

            stage.show();
        } catch (IOException ex) {
            ExceptionHandler.handleException(ex);
        }
    }

    public void handleRefreshButton(ActionEvent actionEvent) {
        ObservableList<LibraryBasicView> observablePersonsList = initializePersonsData();
        LibraryTabelView.setItems(observablePersonsList);
        LibraryTabelView.refresh();
        LibraryTabelView.sort();
    }

    @FXML
    public void handleDetailedView(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(App.class.getResource("fxml/DetailedView.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 900, 600);
            Stage stage = new Stage();
            stage.setTitle("Samurai Duck Library Detail View");
            stage.setScene(scene);

            Stage stageOld = (Stage) DetailedViewButton.getScene().getWindow();

            stage.show();
        } catch (IOException ex) {
            ExceptionHandler.handleException(ex);
        }
    }

    private void initializeTableViewSelection() {
        MenuItem update = new MenuItem("Update Book");
        MenuItem delete = new MenuItem("Delete");
        update.setOnAction((ActionEvent event) -> {
            LibraryBasicView updateView = LibraryTabelView.getSelectionModel().getSelectedItem();
            try {
                FXMLLoader fxmlLoader = new FXMLLoader();
                fxmlLoader.setLocation(App.class.getResource("fxml/UpdateView.fxml"));
                Stage stage = new Stage();
                stage.setUserData(updateView);
                stage.setTitle("Samurai Duck Library Update");

                LibraryUpdateController controller = new LibraryUpdateController();
                controller.setStage(stage);
                fxmlLoader.setController(controller);

                Scene scene = new Scene(fxmlLoader.load(), 900, 600);

                stage.setScene(scene);

                stage.show();
            } catch (IOException ex) {
                ExceptionHandler.handleException(ex);
            }
        });



        delete.setOnAction((ActionEvent event) -> {
            LibraryBasicView bookView = LibraryTabelView.getSelectionModel().getSelectedItem();
            long titleId = bookView.getTitleId();
            libraryRepository.removeBook(titleId);
        });


        ContextMenu menu = new ContextMenu();
        menu.getItems().add(update);
        menu.getItems().add(delete);
        LibraryTabelView.setContextMenu(menu);
    }

    public void handleFilterButton(ActionEvent actionEvent){
        try {
            String text = searchBar.getText();
            System.out.println("handler" +text);
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(App.class.getResource("fxml/FilterView.fxml"));
            Stage stage = new Stage();
            LibraryFilterController libraryFilterController = new LibraryFilterController();
            stage.setUserData(text);
            libraryFilterController.setStage(stage);
            fxmlLoader.setController(libraryFilterController);
            Scene scene = new Scene(fxmlLoader.load(), 900, 600);


            stage.setTitle("Filtered view");
            stage.setScene(scene);
            stage.show();

        } catch (IOException ex) {
            ExceptionHandler.handleException(ex);
        }
    }

    public void handleInjection(ActionEvent event) {

    }
}


