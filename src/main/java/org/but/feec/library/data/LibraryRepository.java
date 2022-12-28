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






    /**
     * What will happen if we do not use LEFT JOIN? What persons will be returned? Ask your self and repeat JOIN from the presentations
     *
     * @return list of persons
     */
    public List<LibraryBasicView> getPersonsBasicView() {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT given_name, title_name, copy_id, genre, type, name"+
                             " FROM bds.author " +
                             " LEFT JOIN bds.author_has_title ON author_author_id = id_address" +
                             " LEFT JOIN bds.title ON author_has_title.title_title_id = title.title_id " +
                             " LEFT JOIN bds.copy ON title.title_id = copy.copy_id " +
                             " LEFT JOIN bds.genre_has_title ON title.title_id = genre_has_title.genre_title_to_genre_id " +
                             " LEFT JOIN bds.genre ON genre_has_title.genre_title_to_genre_id = genre.title_to_genre_id " +
                             " LEFT JOIN bds.borrow_type ON copy.copy_id = borrow_type.borrow_type_id " +
                             " LEFT JOIN bds.lang_name ON copy.copy_id = lang_name.lang_id; "  );



             ResultSet resultSet = preparedStatement.executeQuery();) {
            List<LibraryBasicView> personBasicViews = new ArrayList<>();
            while (resultSet.next()) {
                personBasicViews.add(mapToPersonBasicView(resultSet));
            }
            return personBasicViews;
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
        LibraryBasicView libraryBasicViewBasicView = new LibraryBasicView();
        libraryBasicViewBasicView.setAuthor(rs.getString("given_name"));
        libraryBasicViewBasicView.setTitle(rs.getString("title_name"));
        libraryBasicViewBasicView.setCopy(rs.getLong("copy_id"));
        libraryBasicViewBasicView.setGenre(rs.getString("genre"));
        libraryBasicViewBasicView.setBorrow_type(rs.getString("type"));
        libraryBasicViewBasicView.setLanguage(rs.getString("name"));
        return libraryBasicViewBasicView;
    }


    public LibraryDetailView findPersonDetailedView(Long id) {
        return null;
    }

    public void createPerson(LibraryCreateView personCreateView) {
    }

    public void editPerson(LibraryEditView personEditView) {
    }

}

