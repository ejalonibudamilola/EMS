/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author franc
 */
public class Leave {
    private int id;
    private String firstname;
    private String lastname;
    private String dept;
    private String username;
    private String jobtype;
    private String lrd;
    private String duration;
    private String lsd;
    private String led;
    private String leave_reason;
    private String leave_status;
    private String leave_review_date;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getJobtype() {
        return jobtype;
    }

    public void setJobtype(String jobtype) {
        this.jobtype = jobtype;
    }

    public String getLrd() {
        return lrd;
    }

    public void setLrd(String lrd) {
        this.lrd = lrd;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLsd() {
        return lsd;
    }

    public void setLsd(String lsd) {
        this.lsd = lsd;
    }

    public String getLed() {
        return led;
    }

    public void setLed(String led) {
        this.led = led;
    }

    public String getLeave_reason() {
        return leave_reason;
    }

    public void setLeave_reason(String leave_reason) {
        this.leave_reason = leave_reason;
    }

   
    public String getLeave_status() {
        return leave_status;
    }

    public void setLeave_status(String leave_status) {
        this.leave_status = leave_status;
    }

    public String getLeave_review_date() {
        return leave_review_date;
    }

    public void setLeave_review_date(String leave_review_date) {
        this.leave_review_date = leave_review_date;
    }
    
    
}
