package org.but.feec.library.data;

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
                             " FROM bds.sign_in s" +
                             " WHERE s.login_email = ?")) {

            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return mapToPersonAuth(resultSet);
                }
            }
        } catch (SQLException e) {
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
                     "SELECT id_person, email, given_name, family_name, nickname, city" +
                             " FROM bds.person p" +
                             " LEFT JOIN bds.address a ON p.id_address = a.id_address");
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
        person.setEmail(rs.getString("email"));
        person.setPassword(rs.getString("pwd"));
        return person;
    }

    private LibraryBasicView mapToPersonBasicView(ResultSet rs) throws SQLException {
        LibraryBasicView personBasicView = new LibraryBasicView();
        personBasicView.setId(rs.getLong("id_person"));
        personBasicView.setEmail(rs.getString("email"));
        personBasicView.setGivenName(rs.getString("given_name"));
        personBasicView.setFamilyName(rs.getString("family_name"));
        personBasicView.setNickname(rs.getString("nickname"));
        personBasicView.setCity(rs.getString("city"));
        return personBasicView;
    }


    public LibraryDetailView findPersonDetailedView(Long id) {
        return null;
    }

    public void createPerson(LibraryCreateView personCreateView) {
    }

    public void editPerson(LibraryEditView personEditView) {
    }
}
