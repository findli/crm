package com.becomejavasenior.DAO;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.SQLException;


public class DaoException extends Exception {

    public static Logger log = LogManager.getLogger(DaoException.class);

    public DaoException() {

        super();

    }

    public DaoException(String errorMsg) {

        super(errorMsg);
        log.error(errorMsg);

    }

    public DaoException(String errorMsg, SQLException exception) {

        super(errorMsg);
        log.error(errorMsg, exception);

    }
}
