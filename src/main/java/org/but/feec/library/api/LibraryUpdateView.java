package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class LibraryUpdateView {

    private StringProperty enterTitleName = new SimpleStringProperty();
    private LongProperty enterPublicationYear = new SimpleLongProperty();
    private LongProperty enterAvailabilityPresent = new SimpleLongProperty();
    private LongProperty getEnterAvailabilityAbsent = new SimpleLongProperty();

    public String getEnterTitleName() {
        return enterTitleName.get();
    }

    public StringProperty enterTitleNameProperty() {
        return enterTitleName;
    }

    public void setEnterTitleName(String enterTitleName) {
        this.enterTitleName.set(enterTitleName);
    }

    public long getEnterPublicationYear() {
        return enterPublicationYear.get();
    }

    public LongProperty enterPublicationYearProperty() {
        return enterPublicationYear;
    }

    public void setEnterPublicationYear(long enterPublicationYear) {
        this.enterPublicationYear.set(enterPublicationYear);
    }

    public long getEnterAvailabilityPresent() {
        return enterAvailabilityPresent.get();
    }

    public LongProperty enterAvailabilityPresentProperty() {
        return enterAvailabilityPresent;
    }

    public void setEnterAvailabilityPresent(long enterAvailabilityPresent) {
        this.enterAvailabilityPresent.set(enterAvailabilityPresent);
    }

    public long getGetEnterAvailabilityAbsent() {
        return getEnterAvailabilityAbsent.get();
    }

    public LongProperty getEnterAvailabilityAbsentProperty() {
        return getEnterAvailabilityAbsent;
    }

    public void setGetEnterAvailabilityAbsent(long getEnterAvailabilityAbsent) {
        this.getEnterAvailabilityAbsent.set(getEnterAvailabilityAbsent);
    }
    @Override
    public String toString() {
        return "PersonEditView{" +
                "enterTitleName='" + enterTitleName + '\'' +
                ", enterPublicationYear='" + enterPublicationYear + '\'' +
                ", enterAvailabilityPresent='" + enterAvailabilityPresent + '\'' +
                ", getEnterAvailabilityAbsent='" + getEnterAvailabilityAbsent + '\'' +
                '}';
    }

}
