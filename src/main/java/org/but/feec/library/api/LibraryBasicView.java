package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class LibraryBasicView {
    private LongProperty titleId = new SimpleLongProperty();
    private StringProperty titleName = new SimpleStringProperty();
    private LongProperty publicationYear = new SimpleLongProperty();
    private LongProperty availabilityPresent = new SimpleLongProperty();
    private LongProperty availabilityAbsent = new SimpleLongProperty();


    public long getTitleId() {
        return titleId.get();
    }

    public LongProperty titleIdProperty() {
        return titleId;
    }

    public void setTitleId(long titleId) {
        this.titleId.set(titleId);
    }

    public String getTitleName() {
        return titleName.get();
    }

    public StringProperty titleNameProperty() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName.set(titleName);
    }

    public long getPublicationYear() {
        return publicationYear.get();
    }

    public LongProperty publicationYearProperty() {
        return publicationYear;
    }

    public void setPublicationYear(long publicationYear) {
        this.publicationYear.set(publicationYear);
    }

    public long getAvailabilityPresent() {
        return availabilityPresent.get();
    }

    public LongProperty availabilityPresentProperty() {
        return availabilityPresent;
    }

    public void setAvailabilityPresent(long availabilityPresent) {
        this.availabilityPresent.set(availabilityPresent);
    }

    public long getAvailabilityAbsent() {
        return availabilityAbsent.get();
    }

    public LongProperty availabilityAbsentProperty() {
        return availabilityAbsent;
    }

    public void setAvailabilityAbsent(long availabilityAbsent) {
        this.availabilityAbsent.set(availabilityAbsent);
    }





}
