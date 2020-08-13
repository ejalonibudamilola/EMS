/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;

/**
 *
 * @author franc
 */
public class UserPages implements Serializable{
    String label;
    String urlmapping;
    String labeltitle;
    String labelicon;
    int usertypeid;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getUrlmapping() {
        return urlmapping;
    }

    public void setUrlmapping(String urlmapping) {
        this.urlmapping = urlmapping;
    }

    public String getLabeltitle() {
        return labeltitle;
    }

    public void setLabeltitle(String labeltitle) {
        this.labeltitle = labeltitle;
    }

    public String getLabelicon() {
        return labelicon;
    }

    public void setLabelicon(String labelicon) {
        this.labelicon = labelicon;
    }

    public int getUsertypeid() {
        return usertypeid;
    }

    public void setUsertypeid(int usertypeid) {
        this.usertypeid = usertypeid;
    }

   
}
