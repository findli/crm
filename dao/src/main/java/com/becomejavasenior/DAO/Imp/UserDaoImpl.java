package com.becomejavasenior.DAO.Imp;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.DAO.LanguageDao;
import com.becomejavasenior.DAO.UserDao;
import com.becomejavasenior.bean.Language;
import com.becomejavasenior.bean.User;
import com.becomejavasenior.exceptions.DatabaseException;

import com.becomejavasenior.factory.PostgresDaoFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends AbstractDaoImpl<User> implements UserDao<User> {

    @Autowired
    public UserDaoImpl(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    void createStatement(PreparedStatement preparedStatement, User user) throws DaoException {
        try {

            preparedStatement.setString(1, user.getfName());
            preparedStatement.setString(2, user.getlName());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setBoolean(5, user.is_admin());
            preparedStatement.setInt(6, user.getRights());
            preparedStatement.setString(7, user.getPhotoPath());
            preparedStatement.setBoolean(8, user.is_notification());
            preparedStatement.setString(9, user.getNote());
            preparedStatement.setDate(10, (Date) user.getDateCreate());
            preparedStatement.setInt(11, user.getLanguage().getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    String getAllQuery() {
        return "SELECT * FROM crm_pallas.user ORDER BY id";
    }

    @Override
    String getByIdQuery() {
        return "SELECT * FROM crm_pallas.user WHERE id = ?";
    }

    @Override
    String getCreateQuery() {
        return "INSERT INTO crm_pallas.user (first_name, last_name, password_hash, email, is_admin, rights, photo_path, is_notification_enabled, note, creation_date_time, language_id) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    }

    @Override
    String getDeleteQuery() {
        return "DELETE FROM crm_pallas.user WHERE id = ?";
    }

    @Override
    public User getByName(String str) throws DaoException, ClassNotFoundException {
        User user = new User();
        List<User> users = getAll();
        for (int i = 0; i < users.size(); ++i) {
            if(users.get(i).getlName().equals(str)) {
                user = users.get(i);
                break;
            }
        }
        return user;
    }

    @Override
    User getEntity(ResultSet resultSet) throws DaoException {
        User user = new User();
     /*   LanguageDao<Language> language = new LanguageDaoImpl();*/
        try {
            user.setId(resultSet.getInt("id"));
            user.setlName(resultSet.getString("last_name"));
            user.setfName(resultSet.getString("first_name"));
            user.setPassword(resultSet.getString("password_hash"));
            user.setEmail(resultSet.getString("email"));
            user.setAdmin(resultSet.getBoolean("is_admin"));
            user.setRights(resultSet.getInt("rights"));
            user.setPhotoPath(resultSet.getString("photo_path"));
            user.setNotification(resultSet.getBoolean("is_notification_enabled"));
            user.setNote(resultSet.getString("note"));
            user.setDateCreate(resultSet.getDate("creation_date_time"));
//            user.setLanguage(language.getById(resultSet.getInt("language_id")));

        } catch (SQLException e) {
            throw new DaoException("Can't get entity from Deal", e);
        }
        return user;
    }

    @Override
    String getUpdateQuery() {
        return null;
    }

    @Override
    void updateStatement(PreparedStatement preparedStatement, User entity) throws DaoException {

    }

    @Override
    public void delete(Integer id) throws DaoException {
        super.delete(id);
    }

    @Override
    public List<User> getAll() throws DaoException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        User user;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(getAllQuery())) {

            while (resultSet.next()) {
                user = new User();

                user.setId(resultSet.getInt("id"));
                user.setfName(resultSet.getString("first_name"));
                user.setlName(resultSet.getString("last_name"));
                user.setAdmin(resultSet.getBoolean("is_admin"));
                user.setDateCreate(resultSet.getDate("creation_date_time"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password_hash"));
                user.setRights(resultSet.getInt("rights"));
                user.setPhotoPath(resultSet.getString("photo_path"));
                user.setNotification(resultSet.getBoolean("is_notification_enabled"));
                user.setNote(resultSet.getString("note"));

                users.add(user);

            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex);
        }

        return users;
    }

    @Override
    public List<User> getByFilter(String query) {
        return null;
    }

}