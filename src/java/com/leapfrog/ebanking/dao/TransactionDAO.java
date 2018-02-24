/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.ebanking.dao;

import com.leapfrog.ebanking.entity.Account;
import com.leapfrog.ebanking.entity.Transaction;
import java.math.BigDecimal;
import java.sql.SQLException;

/**
 *
 * @author acer
 */
public interface TransactionDAO {
    
    int insertTransation(Transaction t) throws ClassNotFoundException, SQLException;
    int updateBalance(Account a, double balance) throws ClassNotFoundException, SQLException;
        
}
