package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;

public class LibraryDetailView {
    private StringProperty givenNameColumn  = new SimpleStringProperty();
    private StringProperty titleNameColumn = new SimpleStringProperty();
    private LongProperty copyIdColumn = new SimpleLongProperty();
    private StringProperty genreColumn = new SimpleStringProperty();
    private StringProperty borrowTypeColumn = new SimpleStringProperty();
    private StringProperty languageColumn = new SimpleStringProperty();

    public String getGivenNameColumn() {
        return givenNameColumn.get();
    }

    public StringProperty givenNameColumnProperty() {
        return givenNameColumn;
    }

    public void setGivenNameColumn(String givenNameColumn) {
        this.givenNameColumn.set(givenNameColumn);
    }

    public String getTitleNameColumn() {
        return titleNameColumn.get();
    }

    public StringProperty titleNameColumnProperty() {
        return titleNameColumn;
    }

    public void setTitleNameColumn(String titleNameColumn) {
        this.titleNameColumn.set(titleNameColumn);
    }

    public long getCopyIdColumn() {
        return copyIdColumn.get();
    }

    public LongProperty copyIdColumnProperty() {
        return copyIdColumn;
    }

    public void setCopyIdColumn(long copyIdColumn) {
        this.copyIdColumn.set(copyIdColumn);
    }

    public String getGenreColumn() {
        return genreColumn.get();
    }

    public StringProperty genreColumnProperty() {
        return genreColumn;
    }

    public void setGenreColumn(String genreColumn) {
        this.genreColumn.set(genreColumn);
    }

    public String getBorrowTypeColumn() {
        return borrowTypeColumn.get();
    }

    public StringProperty borrowTypeColumnProperty() {
        return borrowTypeColumn;
    }

    public void setBorrowTypeColumn(String borrowTypeColumn) {
        this.borrowTypeColumn.set(borrowTypeColumn);
    }

    public String getLanguageColumn() {
        return languageColumn.get();
    }

    public StringProperty languageColumnProperty() {
        return languageColumn;
    }

    public void setLanguageColumn(String languageColumn) {
        this.languageColumn.set(languageColumn);
    }
}

