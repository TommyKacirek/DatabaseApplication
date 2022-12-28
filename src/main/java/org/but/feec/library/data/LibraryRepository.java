package org.but.feec.library.data;

import javafx.scene.control.cell.PropertyValueFactory;
import org.but.feec.library.api.*;
import org.but.feec.library.config.DataSourceConfig;
import org.but.feec.library.exceptions.DataAccessException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LibraryRepository {

    public LibraryAuthView findPersonByEmail(String email) {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT login_email, passwd_hash" +
                             " FROM bds.sign_in " +
                             " WHERE login_email = ?")) {

            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    System.out.println("findPersonByEmail if block");
                    return mapToPersonAuth(resultSet);
                }
            }
        } catch (SQLException e) {
            System.out.println("LibraryAuthView block:"+ e);
            throw new DataAccessException("Find person by ID with addresses failed.", e);
        }
        return null;
    }

    //DetailedView
    public List<LibraryBasicView> getPersonsBasicView() {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT title_id, title_name, publication_year, availability_present, availability_absent"+
                             " FROM bds.title "
                              );



             ResultSet resultSet = preparedStatement.executeQuery();) {
            List<LibraryBasicView> libraryBasicViews = new ArrayList<>();
            while (resultSet.next()) {
                libraryBasicViews.add(mapToPersonBasicView(resultSet));
            }
            return libraryBasicViews;
        } catch (SQLException e) {
            throw new DataAccessException("Persons basic view could not be loaded.", e);
        }
    }



    private LibraryAuthView mapToPersonAuth(ResultSet rs) throws SQLException {
        LibraryAuthView person = new LibraryAuthView();
        person.setEmail(rs.getString("login_email"));
        person.setPassword(rs.getString("passwd_hash"));
        return person;
    }



    private LibraryBasicView mapToPersonBasicView(ResultSet rs) throws SQLException {
        LibraryBasicView libraryBasicView = new LibraryBasicView();
        libraryBasicView.setTitleId(rs.getLong("title_id"));
        libraryBasicView.setTitleName(rs.getString("title_name"));
        libraryBasicView.setPublicationYear(rs.getLong("publication_year"));
        libraryBasicView.setAvailabilityPresent(rs.getLong("availability_present"));
        libraryBasicView.setAvailabilityAbsent(rs.getLong("availability_absent"));
        return libraryBasicView;
    }


    public LibraryDetailView findPersonDetailedView(Long id) {
        return null;
    }

    public void createPerson(LibraryCreateView personCreateView) {
    }

    public void editPerson(LibraryEditView personEditView) {
    }

    public void addBook(LibraryEditView libraryEditView) {
        String insertAuthorSQL = "INSERT INTO bds.author (author_id,given_name,family_name,born,died,popularity_rank) VALUES () \n";
    }
}

