/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.model.Query;
import java.util.List;

/**
 *
 * @author franc
 */
public interface EmailInterface {
    public int insertmail(String lastname, String firstname, String fromemail, String toemailaddress, String subject, String emailbody);    
}
