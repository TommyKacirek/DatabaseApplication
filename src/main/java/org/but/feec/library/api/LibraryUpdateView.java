package org.but.feec.library.api;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class LibraryUpdateView {

    private LongProperty enterTitleId = new SimpleLongProperty();
    private StringProperty enterTitleName = new SimpleStringProperty();
    private LongProperty enterPublicationYear = new SimpleLongProperty();
    private LongProperty enterAvailabilityPresent = new SimpleLongProperty();
    private LongProperty getEnterAvailabilityAbsent = new SimpleLongProperty();

    public long getEnterTitleId() {
        return enterTitleId.get();
    }

    public String getEnterTitleName() {
        return enterTitleName.get();
    }

    public long getEnterPublicationYear() {
        return enterPublicationYear.get();
    }

    public long getEnterAvailabilityPresent() {
        return enterAvailabilityPresent.get();
    }

    public long getGetEnterAvailabilityAbsent() {
        return getEnterAvailabilityAbsent.get();
    }

    public void setEnterTitleId(long enterTitleId) {
        this.enterTitleId.set(enterTitleId);
    }

    public void setEnterTitleName(String enterTitleName) {
        this.enterTitleName.set(enterTitleName);
    }

    public void setEnterPublicationYear(long enterPublicationYear) {
        this.enterPublicationYear.set(enterPublicationYear);
    }

    public void setEnterAvailabilityPresent(long enterAvailabilityPresent) {
        this.enterAvailabilityPresent.set(enterAvailabilityPresent);
    }

    public void setGetEnterAvailabilityAbsent(long getEnterAvailabilityAbsent) {
        this.getEnterAvailabilityAbsent.set(getEnterAvailabilityAbsent);
    }

    /**public LongProperty enterTitleIdProperty() {
        return enterTitleId;
    }

    public StringProperty enterTitleNameProperty() {
        return enterTitleName;
    }

    public LongProperty enterPublicationYearProperty() {
        return enterPublicationYear;
    }

    public LongProperty enterAvailabilityPresentProperty() {
        return enterAvailabilityPresent;
    }

    public LongProperty getEnterAvailabilityAbsentProperty() {
        return getEnterAvailabilityAbsent;
    }
   */
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
