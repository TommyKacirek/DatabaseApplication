package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class LibraryBasicView {
    private StringProperty author = new SimpleStringProperty();
    private StringProperty title = new SimpleStringProperty();
    private StringProperty copy = new SimpleStringProperty();
    private StringProperty genre = new SimpleStringProperty();
    private StringProperty borrow_type = new SimpleStringProperty();
    private StringProperty location = new SimpleStringProperty();
    private StringProperty language = new SimpleStringProperty();

    public String getAuthor() {
        return author.get();
    }

    public void setAuthor(String author) {
        this.author.set(author);
    }

    public String getTitle() {
        return titleProperty().get();
    }

    public void setTitle(String title) {
        this.titleProperty().setValue(title);
    }

    public String getCopy() {
        return copyProperty().get();
    }

    public void setCopy(String copy) {
        this.copyProperty().setValue(copy);
    }

    public String getGenre() {
        return genreProperty().get();
    }

    public void setGenre(String genre) {
        this.genreProperty().setValue(genre);
    }

    public String getBorrow_type() {
        return borrow_typeProperty().get();
    }

    public void setBorrow_type(String borrow_type) {
        this.borrow_typeProperty().setValue(borrow_type);
    }

    public String getLocation() {
        return locationProperty().get();
    }

    public void setLocation(String location) {
        this.locationProperty().set(location);
    }

    public String getLanguage() {
        return language.get();
    }

    public void setLanguage(String language) {
        this.language.set(language);
    }

    public StringProperty languageProperty() {
        return language;
    }

    public StringProperty authorProperty() {
        return author;
    }

    public StringProperty titleProperty() {
        return title;
    }

    public StringProperty copyProperty() {
        return copy;
    }

    public StringProperty genreProperty() {
        return genre;
    }

    public StringProperty borrow_typeProperty() {
        return borrow_type;
    }

    public StringProperty locationProperty() {
        return location;
    }


}
