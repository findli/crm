package com.becomejavasenior.DAO.Imp;

import com.becomejavasenior.DAO.*;
import com.becomejavasenior.DAO.StageDao;
import com.becomejavasenior.DataBaseUtil;
import com.becomejavasenior.bean.*;
import com.becomejavasenior.exceptions.DatabaseException;
import com.becomejavasenior.factory.PostgresDaoFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DealDaoImpl extends AbstractDaoImpl<Deal> implements DealDao<Deal> {

    private static final String SELECT_DEALS_FOR_LIST = "SELECT\n" +
            "  crm_pallas.deal.id AS dealId,\n" +
            "  crm_pallas.deal.title,\n" +
            "  crm_pallas.deal.budget,\n" +
            "  crm_pallas.stage.title AS stage,\n" +
            "  crm_pallas.contact.id AS contactId,\n" +
            "  crm_pallas.contact.last_name AS contact,\n" +
            "  crm_pallas.company.id AS companyId,\n" +
            "  crm_pallas.company.title AS company\n" +
            "FROM crm_pallas.deal\n" +
            "  JOIN crm_pallas.stage ON crm_pallas.deal.stage_id = crm_pallas.stage.id\n" +
            "  JOIN crm_pallas.contact ON crm_pallas.deal.primary_contact_id = crm_pallas.contact.id\n" +
            "  JOIN crm_pallas.company ON crm_pallas.deal.company_id = crm_pallas.company.id\n";

    @Override
    void createStatement(PreparedStatement preparedStatement, Deal deal) throws DaoException {
        try {
            preparedStatement.setString(1, deal.getTitle());
            preparedStatement.setInt(2, deal.getCompany().getId());
            preparedStatement.setInt(3, deal.getBudget());
            preparedStatement.setInt(4, deal.getStage().getId());
            preparedStatement.setInt(5, deal.getResponsibleUser().getId());
            preparedStatement.setBoolean(6, deal.isDeleted());
            preparedStatement.setInt(7, deal.getPrimaryContact().getId());
            preparedStatement.setTimestamp(8, new Timestamp(deal.getCreateDate().getTime()));

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    void updateStatement(PreparedStatement preparedStatement, Deal deal) throws DaoException {
        try {
            preparedStatement.setString(1, deal.getTitle());
            preparedStatement.setInt(2, deal.getCompany().getId());
            preparedStatement.setInt(3, deal.getBudget());
            preparedStatement.setInt(4, deal.getStage().getId());
            preparedStatement.setInt(5, deal.getResponsibleUser().getId());
            preparedStatement.setBoolean(6, deal.isDeleted());
            preparedStatement.setInt(7, deal.getId());
//            preparedStatement.setInt(7, deal.getPrimaryContact().getId());
//            preparedStatement.setTimestamp(8, new Timestamp(deal.getCreateDate().getTime()));

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Deal getByName(String str) throws DaoException, ClassNotFoundException {
        return null;
    }

    @Override
    Deal getEntity(ResultSet resultSet) throws DaoException {
        Deal deal = new Deal();
        CompanyDao<Company> company = new CompanyDaoImpl();
        StageDao<Stage> stage = new StageDaoImpl();
        UserDao<User> user = new UserDaoImpl();
        try {
            deal.setId(resultSet.getInt("id"));
            deal.setCompany(company.getById(resultSet.getInt("company_id")));
            deal.setStage(stage.getById(resultSet.getInt("stage_id")));
            deal.setResponsibleUser(user.getById(resultSet.getInt("responsible_user_id")));
            deal.setTitle(resultSet.getString("title"));
            deal.setBudget(resultSet.getInt("budget"));
            deal.setDeleted(resultSet.getBoolean("is_deleted"));
        } catch (SQLException e) {
            throw new DaoException("Can't get entity from Deal", e);
        }
        return deal;
    }

    @Override
    String getAllQuery() {
        return DataBaseUtil.getQuery("SELECT * FROM crm_pallas.deal WHERE is_deleted = FALSE");
    }

    @Override
    String getByIdQuery() {
        return DataBaseUtil.getQuery("SELECT * FROM crm_pallas.deal WHERE id=?");
    }

    @Override
    String getCreateQuery() {
        return DataBaseUtil.getQuery("INSERT INTO crm_pallas.deal (title, company_id, budget, stage_id, responsible_user_id,  is_deleted, primary_contact_id, date_create) values (?,?,?,?,?,?,?,?)");
    }

    @Override
    String getDeleteQuery() {
        return DataBaseUtil.getQuery("DELETE FROM crm_pallas.deal WHERE id = ?");
    }

    @Override
    String getUpdateQuery() {
        return DataBaseUtil.getQuery("UPDATE crm_pallas.deal SET title = ?, company_id = ?, " +
                "budget = ?, stage_id = ?, responsible_user_id =?, is_deleted = ? WHERE id = ?");
    }

    @Override
    public List<Deal> getByFilter(String query) {
        List<Deal> dealList = new ArrayList<Deal>();
        try{
            Connection connection = DataBaseUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                dealList.add(getEntity(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return dealList;
    }

    @Override
    public List<Deal> getAll() throws DaoException, ClassNotFoundException {
        List<Deal> deals = new ArrayList<>();
        Deal deal;
        User responsibleUser;
        Company company;
        Contact contact;

        try (Connection connection = PostgresDaoFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(getAllQuery())) {

            while (resultSet.next()) {

                deal = new Deal();
                responsibleUser = new User();
                company = new Company();
                Stage stage = new Stage();
                contact = new Contact();

                deal.setId(resultSet.getInt("id"));
                responsibleUser.setId(resultSet.getInt("responsible_user_id"));
                deal.setResponsibleUser(responsibleUser);
                company.setId(resultSet.getInt("company_id"));
                deal.setCompany(company);
                deal.setTitle(resultSet.getString("title"));
                deal.setBudget(resultSet.getInt("budget"));
                deal.setDeleted(false);
                stage.setId(resultSet.getInt("stage_id"));
                deal.setStage(stage);
                deal.setStage(stage);
                contact.setId(resultSet.getInt("primary_contact_id"));
                deal.setPrimaryContact(contact);
                deal.setCreateDate(resultSet.getDate("date_create"));

                deals.add(deal);
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex);
        }
        return deals;
    }

    @Override
    public List<Deal> getDealsForList() {
        List<Deal> deals = new ArrayList<>();
        Deal deal;
        Contact contact;
        Company company;
        Stage stage;

        try (Connection connection = PostgresDaoFactory.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_DEALS_FOR_LIST)) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                deal = new Deal();
                company = new Company();
                contact = new Contact();
                stage = new Stage();

                deal.setId(resultSet.getInt("dealId"));
                deal.setTitle(resultSet.getString("title"));
                deal.setBudget(resultSet.getInt("budget"));
                stage.setTitle(resultSet.getString("stage"));
                deal.setStage(stage);
                contact.setId(resultSet.getInt("contactId"));
                contact.setlName(resultSet.getString("contact"));

                company.setId(resultSet.getInt("companyId"));
                company.setTitle(resultSet.getString("company"));
                contact.setCompany(company);
                deal.setPrimaryContact(contact);
                deal.setCompany(company);

                deals.add(deal);
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex);
        }

        return deals;
    }
}