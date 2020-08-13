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
public interface QueryandAssessmentInterface {
    public int addQueryandAssessment(String lastname, String firstname, String username, String dept, String query, String filename);
    public List<Query> getQueryandAssessment(int usertypeid, String department, String limit);
    public List<Query> getStaffQueryandAssessment(String username, String department, String limit);
}
