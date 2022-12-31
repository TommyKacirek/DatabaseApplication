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

    public String getTitleName() {
        return titleName.get();
    }

    public long getPublicationYear() {
        return publicationYear.get();
    }

    public long getAvailabilityPresent() {
        return availabilityPresent.get();
    }

    public long getAvailabilityAbsent() {
        return availabilityAbsent.get();
    }

    public void setTitleId(long titleId) {
        this.titleId.set(titleId);
    }

    public void setTitleName(String titleName) {
        this.titleName.set(titleName);
    }

    public void setPublicationYear(long publicationYear) {
        this.publicationYear.set(publicationYear);
    }

    public void setAvailabilityPresent(long availabilityPresent) {
        this.availabilityPresent.set(availabilityPresent);
    }

    public void setAvailabilityAbsent(long availabilityAbsent) {
        this.availabilityAbsent.set(availabilityAbsent);
    }

    public LongProperty titleIdProperty() {
        return titleId;
    }

    public StringProperty titleNameProperty() {
        return titleName;
    }

    public LongProperty publicationYearProperty() {
        return publicationYear;
    }

    public LongProperty availabilityPresentProperty() {
        return availabilityPresent;
    }

    public LongProperty availabilityAbsentProperty() {
        return availabilityAbsent;
    }
}
