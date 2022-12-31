package org.but.feec.library.api;

public class LibraryAuthView {
    private String email;
    private String password;

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "PersonAuthView{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
