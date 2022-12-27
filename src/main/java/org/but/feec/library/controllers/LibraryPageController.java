package org.but.feec.library.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TextField;

public class LibraryPageController {
    @FXML
    public TableColumn AuthorColumn;

    @FXML
    public TableColumn TitleColumn;

    @FXML
    public TableColumn CopyColumn;

    @FXML
    public TableColumn GenreColumn;

    @FXML
    public TableColumn BorrowTypeColumn;

    @FXML
    public TableColumn LocationColumn;

    @FXML
    public TableColumn LanguageColumn;

    @FXML
    public TextField EnterBookTextField;

    @FXML
    private Button SearchButton;

    @FXML
    private Button RefreshButton;

    @FXML
    private Button AddBookButton;

    @FXML
    private Button TrySQLInjectionButton;



    public void initialize() {

    }

}
