package org.but.feec.library.api;

public class LibraryEditView {

    private String author;
    private String givenName;
    private Long born;
    private String titleName;
    private Long publicationYear;

    public String getAuthor() {
        return author;
    }

    public String getGivenName() {
        return givenName;
    }

    public Long getBorn() {
        return born;
    }

    public String getTitleName() {
        return titleName;
    }

    public Long getPublicationYear() {
        return publicationYear;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public void setBorn(Long born) {
        this.born = born;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public void setPublicationYear(Long publicationYear) {
        this.publicationYear = publicationYear;
    }

    @Override
    public String toString() {
        return "PersonEditView{" +
                "author='" + author + '\'' +
                ", title='" + givenName + '\'' +
                ", genre='" + born + '\'' +
                ", copy='" + titleName + '\'' +
                ", borrow_type='" + publicationYear + '\'' +
                '}';
    }
}

