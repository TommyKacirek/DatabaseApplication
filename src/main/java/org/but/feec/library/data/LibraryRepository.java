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
                             " FROM bds.sign_in " +
                             " WHERE login_email = ?")) {

            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    System.out.println("findPersonByEmail if block");
                    return mapToLibraryAuth(resultSet);
                }
            }
        } catch (SQLException e) {
            System.out.println("LibraryAuthView block:"+ e);
            throw new DataAccessException("Find person by ID with addresses failed.", e);
        }
        return null;
    }

    //DetailedView
    public List<LibraryBasicView> getLibraryBasicView() {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT title_id, title_name, publication_year, availability_present, availability_absent"+
                             " FROM bds.title "
                              );

             ResultSet resultSet = preparedStatement.executeQuery();) {
            List<LibraryBasicView> libraryBasicViews = new ArrayList<>();
            while (resultSet.next()) {
                libraryBasicViews.add(mapToLibraryBasicView(resultSet));
            }
            return libraryBasicViews;
        } catch (SQLException e) {
            throw new DataAccessException("Library basic view could not be loaded.", e);
        }
    }

    private LibraryAuthView mapToLibraryAuth(ResultSet rs) throws SQLException {
        LibraryAuthView person = new LibraryAuthView();
        person.setEmail(rs.getString("login_email"));
        person.setPassword(rs.getString("passwd_hash"));
        return person;
    }

    private LibraryBasicView mapToLibraryBasicView(ResultSet rs) throws SQLException {
        LibraryBasicView libraryBasicView = new LibraryBasicView();
        libraryBasicView.setTitleId(rs.getLong("title_id"));
        libraryBasicView.setTitleName(rs.getString("title_name"));
        libraryBasicView.setPublicationYear(rs.getLong("publication_year"));
        libraryBasicView.setAvailabilityPresent(rs.getLong("availability_present"));
        libraryBasicView.setAvailabilityAbsent(rs.getLong("availability_absent"));
        return libraryBasicView;
    }

    public void addBook(LibraryEditView libraryEditView) {
        String insertAuthorSQL = "INSERT INTO bds.author (given_name,family_name,born) VALUES (?,?,?); " +
                                 "INSERT INTO bds.title (title_name,publication_year,availability_present,availability_absent) VALUES (?,?,0,0); " +
                                 "INSERT INTO bds.author_has_title(author_author_id,title_title_id) VALUES ((SELECT author_id FROM bds.author WHERE given_name = ? AND family_name = ? ), " +
                                 "(SELECT title_id FROM bds.title WHERE title_name=? ));";

        String checkIfExists = "SELECT title_name FROM bds.title WHERE title_name= ?";
        System.out.println(libraryEditView);

        try (Connection connection = DataSourceConfig.getConnection();
             // would be beneficial if I will return the created entity back
             PreparedStatement preparedStatement = connection.prepareStatement(insertAuthorSQL)) {
            // set prepared statement variables
            preparedStatement.setString(1, libraryEditView.getAuthor());
            preparedStatement.setString(2, libraryEditView.getGivenName());
            preparedStatement.setLong(3,libraryEditView.getBorn());
            preparedStatement.setString(4, libraryEditView.getTitleName());
            preparedStatement.setLong(5, libraryEditView.getPublicationYear());
            preparedStatement.setString(6, libraryEditView.getAuthor());
            preparedStatement.setString(7, libraryEditView.getGivenName());
            preparedStatement.setString(8, libraryEditView.getTitleName());
            System.out.println(preparedStatement);
            connection.setAutoCommit(false);

            try {
                int affectedRows = preparedStatement.executeUpdate();

                try (PreparedStatement ps = connection.prepareStatement(checkIfExists)) {
                    ps.setString(1, libraryEditView.getTitleName());

                    if (affectedRows == 0) {
                        throw new DataAccessException("book add failed.");
                    }

                    ps.execute();
                } catch (SQLException e) {
                    throw new DataAccessException("opsie." + e);
                }

                System.out.println(connection);
                connection.commit();

            } catch (SQLException e) {
                System.out.println("ahoj" + e);
                connection.rollback();

            } finally {
                connection.setAutoCommit(true);
            }
        } catch (SQLException e) {
            throw new DataAccessException("Creating book failed operation on the database failed." + e);
        }
    }

    public List<LibraryDetailView> getLibraryDetailView() {
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT given_name, title_name, copy_id, genre, type, name"+
                             " FROM bds.author " +
                             " LEFT JOIN bds.author_has_title ON author.author_id = author_has_title.author_author_id" +
                             " LEFT JOIN bds.title ON author_has_title.title_title_id = title.title_id " +
                             " LEFT JOIN bds.copy ON title.title_id = copy.copy_id " +
                             " LEFT JOIN bds.genre_has_title ON title.title_id = genre_has_title.genre_title_to_genre_id " +
                             " LEFT JOIN bds.genre ON genre_has_title.genre_title_to_genre_id = genre.title_to_genre_id " +
                             " LEFT JOIN bds.borrow_type ON copy.copy_id = borrow_type.borrow_type_id " +
                             " LEFT JOIN bds.lang_name ON copy.copy_id = lang_name.lang_id; "
             );

             ResultSet resultSet = preparedStatement.executeQuery();) {
            List<LibraryDetailView> libraryDetailViews = new ArrayList<>();
            while (resultSet.next()) {
                libraryDetailViews.add(mapToLibraryDetailView(resultSet));
            }
            return libraryDetailViews;
        } catch (SQLException e) {
            throw new DataAccessException("Persons basic view could not be loaded.", e);
        }
    }

    private LibraryDetailView mapToLibraryDetailView(ResultSet rs) throws SQLException {
        LibraryDetailView libraryDetailViews = new LibraryDetailView();
        libraryDetailViews.setGivenNameColumn(rs.getString("given_name"));
        libraryDetailViews.setTitleNameColumn(rs.getString("title_name"));
        libraryDetailViews.setCopyIdColumn(rs.getLong("copy_id"));
        libraryDetailViews.setGenreColumn(rs.getString("genre"));
        libraryDetailViews.setBorrowTypeColumn(rs.getString("type"));
        libraryDetailViews.setLanguageColumn(rs.getString("name"));
        return libraryDetailViews;
    }

    public void libraryUpdate(LibraryUpdateView libraryUpdateView) {
        String insertLibrarySQL = "UPDATE bds.title  SET title_name = ?, publication_year = ?, availability_present = ?, availability_absent = ? WHERE title_id = ?";

        System.out.println(libraryUpdateView.getEnterTitleId());

        try (Connection connection = DataSourceConfig.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(insertLibrarySQL)) {

            preparedStatement.setString(1, libraryUpdateView.getEnterTitleName());
            preparedStatement.setLong(2, libraryUpdateView.getEnterPublicationYear());
            preparedStatement.setLong(3, libraryUpdateView.getEnterAvailabilityPresent());
            preparedStatement.setLong(4, libraryUpdateView.getGetEnterAvailabilityAbsent());
            preparedStatement.setLong(5,libraryUpdateView.getEnterTitleId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new DataAccessException("Creating person failed operation on the database failed." + e );
        }
    }

    public List<LibraryFilterView> getBookFilterView(String text) {
        System.out.println(text);
        String filter = '%'+text+'%';
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT title_id, title_name, publication_year, availability_present, availability_absent  FROM bds.title " +
                             "WHERE lower(title_name) like lower(?); "
             )
        ) {
            preparedStatement.setString(1,filter);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<LibraryFilterView> libraryFilterView = new ArrayList<>();
            while (resultSet.next()) {
                libraryFilterView.add(mapToBookFilterView(resultSet));
            }
            return libraryFilterView;
        }
        catch (SQLException e) {
            throw new DataAccessException("Library filter view could not be loaded." + e);
        }
    }

    private LibraryFilterView mapToBookFilterView(ResultSet rs) throws SQLException{
        LibraryFilterView libraryFilterView = new LibraryFilterView();
        libraryFilterView.setTitleId(rs.getLong("title_id"));
        libraryFilterView.setTitleName(rs.getString("title_name"));
        libraryFilterView.setPublicationYear(rs.getLong("publication_year"));
        libraryFilterView.setAvailabilityPresent(rs.getLong("availability_present"));
        libraryFilterView.setAvailabilityAbsent(rs.getLong("availability_absent"));
        return libraryFilterView;
    }

    public void removeBook(long titleId) {
        String deleteBookSQL =  "DELETE FROM bds.title WHERE title_id = ?";
        System.out.println(deleteBookSQL);
        try (Connection connection = DataSourceConfig.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(deleteBookSQL)){

            prepareStatement.setLong(1, titleId);
            prepareStatement.executeUpdate();

        }
        catch (SQLException e) {
            System.out.println("failed");
        }
    }

    public List<LibraryInjectionView> getInjectionView(String input) {
        String InjectionSQL = "SELECT id, name, username FROM bds.injection_attack" +
                " WHERE id = "+input;
        try (Connection connection = DataSourceConfig.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(InjectionSQL))
         {
            List<LibraryInjectionView> libraryInjectionView = new ArrayList<>();
            while (resultSet.next()) {
                libraryInjectionView.add(mapToInjectionView(resultSet));
            }
            return libraryInjectionView;
        }
        catch (SQLException e) {
            throw new DataAccessException("Library filter view could not be loaded." + e);
        }
    }

    private LibraryInjectionView mapToInjectionView(ResultSet resultSet) throws SQLException {
        LibraryInjectionView libraryInjectionView = new LibraryInjectionView();
        libraryInjectionView.setIdColumn(resultSet.getLong("id"));
        libraryInjectionView.setNameColumn(resultSet.getString("name"));
        libraryInjectionView.setUsernameColumn(resultSet.getString("username"));

        return libraryInjectionView;
    }
}

