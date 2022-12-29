package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class LibraryInjectionView {
    private final LongProperty idColumn = new SimpleLongProperty();
    private final StringProperty nameColumn = new SimpleStringProperty();
    private final StringProperty usernameColumn = new SimpleStringProperty();

    public long getIdColumn() {
        return idColumn.get();
    }

    public LongProperty idColumnProperty() {
        return idColumn;
    }

    public void setIdColumn(long idColumn) {
        this.idColumn.set(idColumn);
    }

    public String getNameColumn() {
        return nameColumn.get();
    }

    public StringProperty nameColumnProperty() {
        return nameColumn;
    }

    public void setNameColumn(String nameColumn) {
        this.nameColumn.set(nameColumn);
    }

    public String getUsernameColumn() {
        return usernameColumn.get();
    }

    public StringProperty usernameColumnProperty() {
        return usernameColumn;
    }

    public void setUsernameColumn(String usernameColumn) {
        this.usernameColumn.set(usernameColumn);
    }
}
