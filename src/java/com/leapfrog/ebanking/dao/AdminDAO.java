/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.ebanking.dao;

import com.leapfrog.ebanking.entity.Account;
import java.sql.SQLException;

/**
 *
 * @author acer
 */
public interface AdminDAO {
    
    int insertAccount(Account a, int id) throws ClassNotFoundException, SQLException;
    
    
}
