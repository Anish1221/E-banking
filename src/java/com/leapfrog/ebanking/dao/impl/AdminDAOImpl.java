/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.ebanking.dao.impl;

import com.leapfrog.ebanking.dao.AdminDAO;
import com.leapfrog.ebanking.dbutil.DbConnection;
import com.leapfrog.ebanking.entity.Account;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author acer
 */
public class AdminDAOImpl implements AdminDAO{
    
    DbConnection db = new DbConnection();

    
    @Override
    public int insertAccount(Account a, int id) throws ClassNotFoundException, SQLException {
        
        db.open();
        String sql = "INSERT INTO tbl_account(account_no, customer_id, balance)"
                + "VALUES(?,?,?)";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, a.getAccountNo());
        stmt.setInt(2, id);
        stmt.setDouble(3, a.getBalance());
        int result = db.executeUpdate();

        db.close();

        return result;
    }

    

}
