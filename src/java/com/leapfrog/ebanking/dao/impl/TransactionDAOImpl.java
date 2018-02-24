/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.ebanking.dao.impl;

import com.leapfrog.ebanking.dao.TransactionDAO;
import com.leapfrog.ebanking.dbutil.DbConnection;
import com.leapfrog.ebanking.entity.Account;
import com.leapfrog.ebanking.entity.Transaction;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author acer
 */
public class TransactionDAOImpl implements TransactionDAO{
    
    DbConnection db = new DbConnection();
    
    @Override
    public int insertTransation(Transaction t) throws ClassNotFoundException, SQLException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        db.open();
        String sql = "INSERT INTO tbl_transaction(account_no, transaction_type, transaction_amount, available_balance)"
                + "VALUES(?,?,?,?)";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, t.getAccountNo());
        stmt.setString(2, t.getTransactionType());      
        stmt.setDouble(3, t.getTransactionAmount());
        stmt.setDouble(4, t.getAvailableBalance());
        int result = db.executeUpdate();
        db.close();
        return result;
        
    }
    
    @Override
    public int updateBalance(Account a, double balance) throws ClassNotFoundException, SQLException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        db.open();
        String sql = "UPDATE tbl_account SET balance = ? WHERE account_no=?";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setDouble(1, balance);
        stmt.setString(2, a.getAccountNo());
        int result = db.executeUpdate();
        db.close();
        return result;
    }
   
}
