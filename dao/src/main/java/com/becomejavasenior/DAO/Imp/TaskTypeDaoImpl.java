package com.becomejavasenior.DAO.Imp;

import com.becomejavasenior.DAO.DaoException;
import com.becomejavasenior.DAO.TaskTypeDao;
import com.becomejavasenior.bean.TaskType;
import com.becomejavasenior.exceptions.DatabaseException;
import com.becomejavasenior.factory.PostgresDaoFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskTypeDaoImpl extends AbstractDaoImpl<TaskType> implements TaskTypeDao<TaskType> {

    @Override
    public String getCreateQuery(){
        return "INSERT INTO crm_pallas.task_type (title) VALUES(?)";
    }

    @Override
    public String getUpdateQuery(){
        return "UPDATE crm_pallas.task_type SET title = ?";
    }

    @Override
    public String getDeleteQuery(){
        return "DELETE FROM crm_pallas.task_type WHERE id = ?";
    }

    @Override
    public String getAllQuery(){
        return "SELECT * FROM crm_pallas.task_type";
    }

    @Override
    public List<TaskType> getByFilter(String query) {
        return null;
    }

    @Override
    public String getByIdQuery(){
        return "SELECT * FROM crm_pallas.task_type WHERE id = ?";
    }

    @Override
    public void createStatement(PreparedStatement preparedStatement, TaskType taskType) throws DaoException {
        try {
            preparedStatement.setString(1, taskType.getTitle());
        } catch (SQLException e){
            throw new DaoException("Can't create statement for Task", e);
        }
    }

    @Override
    public void updateStatement(PreparedStatement preparedStatement, TaskType taskType) throws DaoException {
        try {
            preparedStatement.setString(1, taskType.getTitle());
        } catch (SQLException e){
            throw new DaoException("Can't update statement for TaskType", e);
        }
    }

    @Override
    public TaskType getByName(String str) throws DaoException, ClassNotFoundException {
        return null;
    }

    @Override
    public TaskType getEntity(ResultSet resultSet) throws DaoException {
        TaskType taskType = new TaskType();
        try {
            taskType.setId(resultSet.getInt("id"));
            taskType.setTitle(resultSet.getString("title"));

        } catch (SQLException e){
            throw new DaoException("Can't get entity from Company", e);
        }
        return taskType;
    }

    @Override
    public List<TaskType> getAll() throws DaoException, ClassNotFoundException {
        List<TaskType> taskTypes = new ArrayList<>();
        TaskType taskType;

        try (Connection connection = PostgresDaoFactory.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(getAllQuery())) {
            while (resultSet.next()) {
                taskType = new TaskType();
                taskType.setId(resultSet.getInt("id"));
                taskType.setTitle(resultSet.getString("title"));

                taskTypes.add(taskType);
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex);
        }

        return taskTypes;
    }

}