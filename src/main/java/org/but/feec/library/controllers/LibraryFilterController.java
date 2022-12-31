package org.but.feec.library.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import org.but.feec.library.api.LibraryFilterView;
import org.but.feec.library.data.LibraryRepository;
import org.but.feec.library.services.LibraryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;

public class LibraryFilterController {

    @FXML
    public TableView tableViewFilter;

    @FXML
    public TableColumn titleIdColumn;

    @FXML
    public TableColumn titleNameColumn;

    @FXML
    public TableColumn publicationYearColumn;

    @FXML
    public TableColumn availabilityPresentColumn;

    @FXML
    public TableColumn availabilityAbsentColumn;

    private static final Logger logger = LoggerFactory.getLogger(LibraryFilterController.class);

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

        titleIdColumn.setCellValueFactory(new PropertyValueFactory<LibraryFilterController, Long>("titleId"));
        titleNameColumn.setCellValueFactory(new PropertyValueFactory<LibraryFilterController, String>("titleName"));
        publicationYearColumn.setCellValueFactory(new PropertyValueFactory<LibraryFilterController, Long>("publicationYear"));
        availabilityPresentColumn.setCellValueFactory(new PropertyValueFactory<LibraryFilterController, String>("availabilityPresent"));
        availabilityAbsentColumn.setCellValueFactory(new PropertyValueFactory<LibraryFilterController, String>("availabilityAbsent"));

    ObservableList<LibraryFilterView> observableLibraryList = initializeLibraryData();
        tableViewFilter.setItems(observableLibraryList);
        logger.info("LibraryFilterController initialized");

}
    private ObservableList<LibraryFilterView> initializeLibraryData() {

        String text = (String) stage.getUserData();
        System.out.println("controller "+text);
        List<LibraryFilterView> titles = libraryService.getBookFilterView(text);
        return FXCollections.observableArrayList(titles);
    }
}


















































