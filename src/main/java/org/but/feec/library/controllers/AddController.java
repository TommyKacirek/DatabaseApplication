package org.but.feec.library.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;

public class AddController {
    @FXML
    public TableColumn AuthorColumn;

    @FXML
    public TableColumn TitleColumn;

    @FXML
    public TableColumn CopyColumn;

    @FXML
    public TableColumn GenreColumn;

    @FXML
    public TableColumn Borrow_typeColumn;

    @FXML
    public TableColumn LocationColumn;

    @FXML
    public TableColumn LanguageColumn;

    @FXML
    public Label LabelAdd;

    public void initialize() {

    }

}
