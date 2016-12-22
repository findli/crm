package com.becomejavasenior.DAO.mapper;

import com.becomejavasenior.DAO.*;
import com.becomejavasenior.bean.*;
import com.becomejavasenior.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ContactRowMapper implements RowMapper<Contact> {

    private static final String FIELD_ID = "id";
    private static final String FIELD_FIRST_NAME = "first_name";
    private static final String FIELD_LAST_NAME = "last_name";
    private static final String FIELD_COMPANY_ID = "company_id";
    private static final String FIELD_POSITION = "post";
    private static final String FIELD_EMAIL = "email";
    private static final String FIELD_SKYPE = "skype";
    private static final String FIELD_RESPONSIBLE_USER_ID = "responsible_user_id";
    private static final String FIELD_IS_DELETED = "is_deleted";

    private static final String FIELD_TYPE_OF_PHONE = "type_of_phone";
    private static final String FIELD_PHONE = "phone";
    private static final String FIELD_DATE_CREATE = "date_create";
    private static final String FIELD_CREATED_BY_ID = "created_by_id";
    private static final String FIELD_COMPANY_NAME = "company_name";

    @Autowired
    CompanyDao companyDao;

    @Autowired
    UserDao userDao;

    @Override
    public Contact mapRow(ResultSet resultSet, int i) throws SQLException {
        Contact contact = new Contact();
        contact.setId(resultSet.getInt(FIELD_ID));
        contact.setlName(resultSet.getString(FIELD_LAST_NAME));
        contact.setfName(resultSet.getString(FIELD_FIRST_NAME));

        if (resultSet.getObject(FIELD_COMPANY_ID, Integer.class) != null) {
            Company company = null;
            try {
                company = (Company) companyDao.getById(resultSet.getInt(FIELD_COMPANY_ID));
            } catch (DaoException e) {
                e.printStackTrace();
            }
            contact.setCompany(company);
        }

        if (resultSet.getObject(FIELD_RESPONSIBLE_USER_ID, Integer.class) != null) {
            User responsibleUser = null;
            try {
                responsibleUser = (User) userDao.getById(resultSet.getInt(FIELD_RESPONSIBLE_USER_ID));
            } catch (DaoException e) {
                e.printStackTrace();
            }
            contact.setResponsibleUser(responsibleUser);
        }

        contact.setPosition(resultSet.getString(FIELD_POSITION));
        contact.setSkype(resultSet.getString(FIELD_SKYPE));
        contact.setEmail(resultSet.getString(FIELD_EMAIL));
        contact.setDeleted(resultSet.getBoolean(FIELD_IS_DELETED));

        return contact;
    }
}
